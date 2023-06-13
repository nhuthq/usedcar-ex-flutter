import 'package:flutter/material.dart';
import 'package:usedcar_ex_flutter/presentation/widgets/base_statefull_widget.dart';
import 'package:usedcar_ex_flutter/presentation/widgets/main_webview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseStatefullWidget<HomeScreen> {
  @override
  Widget buildContentView(BuildContext context) {
    return _buildBodyWidget(context);
  }
}

Widget _buildBodyWidget(BuildContext context) {
  return _buildContentWidget(context);
}

Widget _buildContentWidget(BuildContext context) {
  return const Center(child: MainWebview(topUrl: 'https://flutter.dev'));
}
