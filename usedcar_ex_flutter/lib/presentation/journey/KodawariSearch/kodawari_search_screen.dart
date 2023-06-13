import 'package:flutter/material.dart';

class KodawariSearchScreen extends StatefulWidget {
  const KodawariSearchScreen({super.key});

  @override
  State<KodawariSearchScreen> createState() => _KodawariSearchScreenState();
}

class _KodawariSearchScreenState extends State<KodawariSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBodyWidget(context),
      backgroundColor: Colors.amber,
    );
  }
}

Widget _buildBodyWidget(BuildContext context) {
  return _buildContentWidget(context);
}

Widget _buildContentWidget(BuildContext context) {
  return const Center(
    child: Text('Kodawari Search'),
  );
}
