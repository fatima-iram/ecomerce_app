import 'classes.dart';
import 'package:flutter/material.dart';
import 'product_screen.dart';
import 'package:provider/provider.dart';
import 'cartProvider.dart';

class Productdetail extends StatefulWidget {
  final Product pro;
  const Productdetail({super.key, required this.pro});
  // bool isBought =isBought,

  @override
  State<Productdetail> createState() => _ProductdetailState();
}

class _ProductdetailState extends State<Productdetail> {
  bool isBought = false;
  @override
  Widget build(BuildContext context) {
    final pro = widget.pro;

    return Scaffold(
        appBar: AppBar(title: Text(pro.product_name)),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Center(child: Image.network(pro.imageURL, height: 160)),
              const SizedBox(height: 13),
              Text(pro.product_name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              Text(pro.description, style: const TextStyle(fontSize: 18)),
              Text('₹${pro.price}', style: const TextStyle(fontSize: 17)),
              const SizedBox(height: 11),
              // bool isBought = !isBought,
              Center(
                child: ElevatedButton(
                  onPressed: isBought
                      ? null
                      : () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addToCart(widget.pro);
                          setState(() {
                            isBought = true;
                          });
                        },
                  child: Text(isBought ? 'BOUGHT' : 'BUY'),
                ),
              )
            ],
          ),
        ));
  }
}
