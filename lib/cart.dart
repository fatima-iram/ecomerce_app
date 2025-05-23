import 'package:flutter/material.dart';
import 'classes.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});
  static List<Product> cartItems = [];

  static void addToCart(Product pro) {
    cartItems.add(pro);
  }

  static void removeFromCart(Product pro) {
    cartItems.remove(pro);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(45 - 98),
      appBar: AppBar(
        title: const Text("CART"),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text("Your cart is empty"))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  leading: const Icon(Icons.shopping_cart),
                  title: Text(item.product_name),
                  subtitle: Text("₹${item.price}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () {
                      Cart.removeFromCart(item);
                    },
                  ),
                );
              },
            ),
    );
  }
}
