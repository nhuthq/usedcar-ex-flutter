import 'package:flutter/material.dart';

class RecentSearchScreen extends StatefulWidget {
  const RecentSearchScreen({super.key});

  @override
  State<RecentSearchScreen> createState() => _RecentSearchScreenState();
}

class _RecentSearchScreenState extends State<RecentSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBodyWidget(context),
      backgroundColor: Colors.green,
    );
  }
}

Widget _buildBodyWidget(BuildContext context) {
  return _buildContentWidget(context);
}

Widget _buildContentWidget(BuildContext context) {
  return const Center(
    child: Text('Recent Screen'),
  );
}
