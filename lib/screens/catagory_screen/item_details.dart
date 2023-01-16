import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline))
        ],
      ),
    );
  }
}
