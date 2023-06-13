import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBodyWidget(context),
      backgroundColor: Colors.grey,
    );
  }
}

Widget _buildBodyWidget(BuildContext context) {
  return _buildContentWidget(context);
}

Widget _buildContentWidget(BuildContext context) {
  return const Center(
    child: Text('Search Screen'),
  );
}
