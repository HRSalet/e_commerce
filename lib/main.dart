import 'dart:io';
import 'package:e_commerce/home.dart';
import 'package:e_commerce/login.dart';
import 'package:e_commerce/register.dart';
import 'package:e_commerce/shopping_cart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCZElJxBq9fNoBSH9BJajguKKkbEdC9U5Y",
        appId: "1:1038284791392:android:4b46e9dc2cd237e50cad05",
        messagingSenderId: "1038284791392",
        projectId: "ecommerce-78d3c",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (context) => const MyLogin(),
        'register': (context) => const MyRegister(),
        'homescreen': (context) => MyHomeScreen(),
        'shopping': (context) => ShoppingCart(products: [], category: '')
      },
    );
  }
}
