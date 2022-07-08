

import 'package:flutter/material.dart';

class UUFavoritePage extends StatefulWidget {
  const UUFavoritePage({Key? key}) : super(key: key);

  @override
  State<UUFavoritePage> createState() => _UUFavoritePageState();
}

class _UUFavoritePageState extends State<UUFavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("收藏"),
      ),
      body: const Center(
        child: Text("收藏内容"),
      ),
    );
  }
}
