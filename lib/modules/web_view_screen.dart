import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String url;
  WebViewScreen(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon:Icon(
            EvaIcons.arrowBack,
            color: AppCubit.get(context).isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}