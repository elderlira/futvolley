import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  final String title;

  const ItemPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text("Item em construção 🚧", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
