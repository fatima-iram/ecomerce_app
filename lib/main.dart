import 'package:flutter_application_1/product_screen.dart';
import 'package:provider/provider.dart';
import 'cartProvider.dart';
import 'classes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProductScreen(),
    );
  }
}
