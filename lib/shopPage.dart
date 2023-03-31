import 'package:cshack/globals.dart';
import 'package:cshack/utils.dart';
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
        children: [
          ShopItem(item: "קליק", price: 100, imageSrc: 'lib/klik.webp'),
          ShopItem(
              item: "שדרוג רועי",
              price: 50,
              imageSrc: 'lib/game/images/roee_with_hat.png',
              onPressed: () {
                roeeWithHat = true;
                saveString('roeeWithHat', "true");
              }),
          ShopItem(
              item: "שחקן סער",
              price: 50,
              imageSrc: 'lib/game/images/saar.png',
              onPressed: () {
                saarRegular = true;
                saveString('saarRegular', "true");
              }),
          ShopItem(
              item: "שדרוג סער",
              price: 50,
              imageSrc: 'lib/game/images/saar_with_hat.png',
              onPressed: () {
                saarWithHat = true;
                saveString('saarWithHat', "true");
              }),
          ShopItem(
              item: "שדרוג מיכל",
              price: 50,
              imageSrc: 'lib/game/images/michal_with_hat.png',
              onPressed: () {
                michalRegular = true;
                saveString('michalRegular', "true");
              }),
          ShopItem(
            item: "שדרוג האט זמן",
            price: 80,
            imageSrc: 'lib/powerup.png',
            onPressed: () {
              power1++;
              power2++;
            }
          ),
        ],
      ),
    );
  }
}

class ShopItem extends StatefulWidget {
  const ShopItem(
      {super.key,
      required this.item,
      required this.price,
      required this.imageSrc,
      this.onPressed});

  final String item;
  final int price;
  final String imageSrc;
  final onPressed;

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
            Image.asset(widget.imageSrc, height: 80),
            Text(widget.item),
            Text('\$${widget.price}', style: const TextStyle(fontSize: 20)),
            ElevatedButton(
                onPressed: () {
                  _flag ? null : _buyItem();
                  if (widget.onPressed != null) {
                    widget.onPressed();
                  }
                },
                child: const Text("Buy"))
          ],
        ));
  }
}
