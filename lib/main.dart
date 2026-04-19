import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.initialize("97988702-6678-453c-88c9-0444d5742893");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UsakOlayApp(),
    );
  }
}

class UsakOlayApp extends StatefulWidget {
  const UsakOlayApp({super.key});
  @override
  State<UsakOlayApp> createState() => _UsakOlayAppState();
}

class _UsakOlayAppState extends State<UsakOlayApp> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("https://www.usakolay.com/"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Uşak Olay"),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              Share.share("https://www.usakolay.com/");
            },
          )
        ],
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
