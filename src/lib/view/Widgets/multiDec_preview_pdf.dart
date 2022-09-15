import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:uni/globals.dart';

class PDFViewerCachedFromUrl extends StatelessWidget {

  final String url;

  const PDFViewerCachedFromUrl({
    Key key,
    @required this.url
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    profileInfo.sexo.acceptAlteration();
    profileInfo.estadoCivil.rejectAlteration();
    return Container(
      height: 480,
      width: 200,
      padding: EdgeInsets.only(right: 10.0, left: 10.0, top: 10, bottom: 10),
      alignment: Alignment.center,
      child: PDF().cachedFromUrl(
        url,
        maxAgeCacheObject:Duration(minutes: 10), //duration of cache
        placeholder: (progress) => Center(child: Text('$progress %')),
        errorWidget: (error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
