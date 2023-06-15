import 'package:flutter/material.dart';
import 'package:usedcar_ex_flutter/presentation/widgets/base_statefull_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainWebview extends StatefulWidget {
  const MainWebview(
      {super.key, required this.controller});
  final WebViewController controller;

  @override
  State<MainWebview> createState() => MainWebviewState();
}

class MainWebviewState extends BaseStatefullWidget<MainWebview> {
  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();

    widget.controller.setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ),
    );
  }

  @override
  Widget buildContentView(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(
          controller: widget.controller,
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),
      ],
    );
  }
}
