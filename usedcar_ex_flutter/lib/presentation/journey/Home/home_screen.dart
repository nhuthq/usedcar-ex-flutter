import 'package:flutter/material.dart';
import 'package:usedcar_ex_flutter/presentation/widgets/base_statefull_widget.dart';
import 'package:usedcar_ex_flutter/presentation/widgets/main_webview.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.topURL, required this.controller});

  final String topURL;
  final WebViewController controller;

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends BaseStatefullWidget<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget.controller.loadRequest(
      Uri.parse(widget.topURL),
    );
  }

  @override
  Widget buildContentView(BuildContext context) {
    return _buildBodyWidget(context, widget.controller);
  }
}

Widget _buildBodyWidget(
    BuildContext context, WebViewController webViewController) {
  return _buildContentWidget(context, webViewController);
}

Widget _buildContentWidget(BuildContext context, WebViewController controller) {
  return Center(
    child: MainWebview(
      controller: controller,
    ),
  );
}
