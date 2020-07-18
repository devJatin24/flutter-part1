import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'WebView'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

 

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
  
  //goto ios/ruuner/info.plist then add <key>io.flutter.embeded_views_privew</key> <string>YES</string>
	
final Completer<WebViewController> control= Completer<WebViewController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: WebView(
        initialUrl: "https://www.youtube.com/watch?v=BPO9JrNChlM",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webview){
          control.complete(webview);
        },

      ),
      );
  }
}
