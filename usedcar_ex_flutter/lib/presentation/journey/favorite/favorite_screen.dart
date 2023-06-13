import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBodyWidget(context),
      backgroundColor: Colors.cyan,
    );
  }
}

Widget _buildBodyWidget(BuildContext context) {
  return _buildContentWidget(context);
}

Widget _buildContentWidget(BuildContext context) {
  return const Center(
    child: Text('Favorite Screen'),
  );
}
