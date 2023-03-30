import 'package:flutter/material.dart';
import 'database_manager.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key, required this.title});

  final String title;

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) async{
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          ShopItem(item)
        ],
      ),
    );
  }
}

class ShopItem extends StatelessWidget {
  const ShopItem({super.key, required this.item});
  final String item;
  @override
  Widget build(BuildContext context) {

    );
  }
}

