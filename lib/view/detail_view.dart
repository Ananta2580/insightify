import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class DetailView extends StatefulWidget {
  String newsURL;
  DetailView({super.key , required this.newsURL});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      widget.newsURL = widget.newsURL.contains("http:")
          ? widget.newsURL.replaceAll("http:", "https:")
          : widget.newsURL;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("News Details") ,
        backgroundColor: Colors.red,

      ),
      body: WebViewWidget(controller: WebViewController()

          ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(widget.newsURL))

      )
    );
  }
}
