import 'package:cshack/globals.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key, required this.title});

  final String title;

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(widget.title),
      body: GridView.count(
        crossAxisCount: 2,
        children: [ShopItem(item: "קליק", price: 100)],
      ),
    );
  }
}

class ShopItem extends StatefulWidget {
  const ShopItem({super.key, required this.item, required this.price});

  final String item;
  final int price;

  @override
  State<ShopItem> createState() => _ShopItemState();
}

class _ShopItemState extends State<ShopItem> {
  bool _flag = false;
  Color _widgetColor = Colors.white;

  void _buyItem() {
    setState(() {
      _flag = true;
      _widgetColor = Colors.green;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: _widgetColor,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/klik.webp', height: 80),
            Text(widget.item),
            Text('\$${widget.price}', style: const TextStyle(fontSize: 20)),
            ElevatedButton(
                onPressed: _flag ? null : _buyItem, child: const Text("Buy"))
          ],
        ));
  }
}
