// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopmk/categories.dart';
import 'package:shopmk/screens/cart.dart';
import 'package:shopmk/screens/checkout.dart';
import 'package:shopmk/screens/itemdetails.dart';
import 'package:shopmk/screens/signin.dart';
import 'package:shopmk/screens/signup.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     statusBarColor: Colors.white, systemNavigationBarColor: Colors.white));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SignInPage(),
        '/signUp': (context) => const SignUpPage(),
        '/categories': (context) => const Categories(),
        '/cart': (context) => const CartPage(),
        '/checkout': (context) => const CheckoutPage(),
        '/items': (context) => ItemDetailsPage(
              itemCat: '',
              itemDesc: '',
              itemName: '',
              itemPrice: '' as double,
              itemPhoto: '',
            ),
      },
      // home: const MainNavigation(),
    );
  }
}
