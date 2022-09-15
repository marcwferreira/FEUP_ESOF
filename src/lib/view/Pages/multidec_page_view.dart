import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uni/utils/constants.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:uni/view/Widgets/page_title.dart';
import 'package:uni/view/Widgets/multiDec_preview_pdf.dart';
import 'package:uni/controller/get_multipurpose_declaration.dart';

import '../Widgets/multiDec_preview_pdf.dart';

class MultiDecPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MultiDecViewState();
}

/// Manages the 'multidec' section of the app.
class MultiDecViewState extends GeneralPageViewState {

  String downloadURL = getMultiDecURL();

  @override
  Widget getBody(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    key: PageStorageKey<String>('Multideclaration');

    return ListView(
      children: <Widget>[

        //title
        Container(child: PageTitle(name: 'Declaração Multiusos')),

        //preview
        getPDFPreview(),

        //download
        getDownloadButton(),
      ],
    );
  }

  Container getPDFPreview() {
    return Container (
      key: const Key("pdf_preview"),
      child: PDFViewerCachedFromUrl(url: downloadURL),
    );
  }

  Container getDownloadButton() {
    return Container(
      key: Key("multiDec_download_button"),
      margin:
      EdgeInsets.only(right: 90.0, left: 90.0, top: 40, bottom: 40),
      child:
      RaisedButton(
        color: Color.fromRGBO(127, 23, 30, 1),
        textColor: Colors.white,
        padding: EdgeInsets.all(8.0),
        splashColor: Colors.grey,
        key: const Key("download"),
        onPressed: () {
          downloadFile();
        },

        child: Text(
          "Salvar como PDF",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }

  void downloadFile() async {

    final permissionStatus = await Permission.storage.request(); //request store permission

    if(permissionStatus.isGranted){
      final storagePath = await getExternalStorageDirectory(); //get path do download dir
      if( storagePath != null ) {
        try {
          final taskId = await FlutterDownloader.enqueue(
              url: downloadURL,
              savedDir: storagePath.path,
              showNotification: true,
              openFileFromNotification: true,
              fileName: 'declaracao');
        }
        catch(e){
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Sorry, file can't be downloaded: error")));
        }
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Sorry, file can't be downloaded: directory not defined")));
      }

    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Sorry, file can't be downloaded: no permissions")));
    }
  }

  @pragma('vm:entry-point')
  static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
    final SendPort send = IsolateNameServer.lookupPortByName('downloader');
    send?.send([id, status, progress]);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  ReceivePort _port = ReceivePort();
  @override
  void initState() {
    super.initState();

    IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      setState((){ });
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }
}