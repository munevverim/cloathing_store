import 'package:flutter/material.dart';
import 'admin_panel.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';
import 'cart_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(ClothingStoreApp());
}

class ClothingStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/cart': (context) => CartScreen(cartItems: [],),
        '/profile': (context) => ProfileScreen(),
        '/admin': (context) => AdminPanel(),
      },
    );
  }
}
