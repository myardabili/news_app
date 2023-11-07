// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:news_app/common/constants/colors.dart';
import 'package:news_app/common/constants/images.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:news_app/data/models/news_response_model.dart';

class DetailNews extends StatefulWidget {
  final Article article;
  const DetailNews({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  State<DetailNews> createState() => _DetailNewsState();
}

class _DetailNewsState extends State<DetailNews> {
  WebViewController? _controller;
  bool isLoading = false;

  @override
  void initState() {
    isLoading = true;
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.article.url ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          // icon: Image.asset(Images.iconArrowBack),
          icon: const Icon(Icons.arrow_back_ios),
          color: ColorsName.black,
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 24,
        ),
        automaticallyImplyLeading: false,
        actions: [
          Image.asset(
            Images.iconBookmark,
            height: 24,
            width: 24,
            color: ColorsName.black,
          ),
          const SizedBox(width: 20),
          Image.asset(
            Images.iconShare,
            height: 24,
            width: 24,
            color: ColorsName.black,
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : WebViewWidget(controller: _controller!),
    );
  }
}
