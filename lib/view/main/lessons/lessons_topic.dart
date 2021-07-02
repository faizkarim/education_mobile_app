import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LessonTopic extends StatelessWidget {
  final String link;
  LessonTopic({this.link});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        initialUrl: link,
      ),
    );
  }
}
