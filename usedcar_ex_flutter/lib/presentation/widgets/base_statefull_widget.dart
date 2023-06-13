import 'package:flutter/material.dart';

import 'responsive.dart';

abstract class BaseStatefullWidget<T extends StatefulWidget> extends State<T>
    with RouteAware, WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildContentView(context),
      floatingActionButton: buildFloatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  Widget buildFloatingActionButton(BuildContext context) => Container();

  bool get isDark => Theme.of(context).brightness == Brightness.dark;

  void hideKeyboard() => FocusScope.of(context).requestFocus(FocusNode());

  Size get device => MediaQuery.of(context).size;

  ThemeData get theme => Theme.of(context);

  Widget buildContentView(BuildContext context) =>
      ResponsiveWidget(child: Container());

  @override
  void didPush() {}

  @override
  void didPopNext() {}

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }
}
