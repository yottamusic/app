import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const kAndroidUserAgent = 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';

// ignore: prefer_collection_literals
final Set<JavascriptChannel> jsChannels = [
  JavascriptChannel(
      name: 'Print',
      onMessageReceived: (JavascriptMessage message) {
        print(message.message);
      }),
].toSet();

class WebView extends StatefulWidget {
  final url;

  WebView(this.url);

  @override
  createState() => _WebViewState(this.url);
}

class _WebViewState extends State<WebView> {
  var _url;

  _WebViewState(this._url);

  // Instance of WebView plugin
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: Container(),
          preferredSize: Size.fromHeight(0.0),
        ),
        body: Column(
          children: [
            Expanded(
                child: WebviewScaffold(
                  url: _url,
                  javascriptChannels: jsChannels,
                  mediaPlaybackRequiresUserGesture: false,
                  appBar: AppBar(
                    title: const Text('YottaMusic'),
                  ),
                  withZoom: true,
                  withLocalStorage: true,
                  hidden: true,
//                  initialChild: Container(
//                    color: Colors.redAccent,
//                    child: const Center(
//                      child: Text('Waiting.....'),
//                    ),
//                  ),
                  bottomNavigationBar: BottomAppBar(
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            flutterWebViewPlugin.goBack();
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_ios),
                          onPressed: () {
                            flutterWebViewPlugin.goForward();
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.autorenew),
                          onPressed: () {
                            flutterWebViewPlugin.reload();
                          },
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }
}
