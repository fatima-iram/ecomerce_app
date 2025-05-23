import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'classes.dart';
import 'product_screen.dart';
import 'cartProvider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),
      body: cart.cartItems.isEmpty
          ? const Center(child: Text("OOPS! Your cart is empty."))
          : ListView.builder(
              itemCount: cart.cartItems.length,
              itemBuilder: (context, index) {
                final product = cart.cartItems[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: Image.network(
                      product.imageURL,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(product.product_name),
                    subtitle: Text('₹${product.price}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        cart.removeFromCart(product);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
