import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Uni++',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Uni++'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  ValueNotifier<String> message = ValueNotifier<String>("Professor");

  void changeMessage(newMessage){
    setState(() {
      message = ValueNotifier(newMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/img/logoTransparent.png', fit: BoxFit.cover, height: 50, width: 100),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Desculpa, ainda não há menu :(')));

            },
          ),
        ],
      ),
      body: Center(
        child:

        Stack(
          children: <Widget>[
            Positioned(
              top: 30,
              left: 0,
              right: 0,
              child:
                ValueListenableBuilder(
                  valueListenable: message,
                  builder: (BuildContext context,dynamic message, child) {
                    return Text("Hi, $message!",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                    );
                  }
              )
            ),
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              height: 280,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Créditos:\n',
                    style: TextStyle(fontSize: 30,
                        color: Colors.red,
                        fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    'Fábio Sá - up202007658\n',
                    style: TextStyle(fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    'Gabriel Coelho - up201902223\n',
                    style: TextStyle(fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    'Inês Gaspar - up202007210\n',
                    style: TextStyle(fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    'Lourenço Gonçalves- up202004816\n',
                    style: TextStyle(fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    'Marcos Ferreira - up201800177',
                    style: TextStyle(fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 400,
              left:100,
              right:100,
              child:
              RaisedButton(
                color: Colors.red,
                textColor: Colors.white,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.redAccent,
                onPressed: () {
                  openPopup(context);
                },

                child: Text(
                  "Change username",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            Positioned(
              top: 470,
              left:100,
              right:100,
              child:
              RaisedButton(
                color: Colors.red,
                textColor: Colors.white,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.redAccent,
                onPressed: () {
                  downloadFile();
                },

                child: Text(
                  "Download Test",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            Positioned(
              top: 650,
              left: 0,
              right: 0,
              child: Text(
                'Versão: Teste 1.0',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }


  void openPopup(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                const Text(
                    "Select new username:"
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[


                      Padding(
                        //fazer o ficheiro
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(hintText: 'Type something'),
                          onChanged: (text) {
                            message = ValueNotifier<String>(text);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          color: Colors.red,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(8.0),
                          splashColor: Colors.redAccent,
                          onPressed: () {
                            Navigator.of(context).pop();
                            changeMessage(message.value);
                          },
                          child: const Text(
                            "Close",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }


  void downloadFile() async {

    final permissionStatus = await Permission.storage.request(); //request store permission

    if(permissionStatus.isGranted){
      final storagePath = await getExternalStorageDirectory(); //get path do download dir
      if( storagePath != null ) {
        try {
          final taskId = await FlutterDownloader.enqueue(
              url: 'https://0901.static.prezi.com/preview/v2/zd7mfd4k7cs5vuuhcb7gtbxa3t6jc3sachvcdoaizecfr3dnitcq_3_0.png',
              savedDir: storagePath.path,
              showNotification: true,
              openFileFromNotification: true,
              fileName: 'professor');
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
    final SendPort? send = IsolateNameServer.lookupPortByName('downloader');
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