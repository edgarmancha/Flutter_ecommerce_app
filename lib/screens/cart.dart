import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopmk/screens/checkout.dart';

import '../myappbar.dart';
import '../utils/utils.dart';

class Item {
  final String itemName;
  final double itemPrice;
  final String itemDesc;
  final String itemPhoto;
  final String itemCat;

  Item({
    required this.itemName,
    required this.itemPrice,
    required this.itemDesc,
    required this.itemPhoto,
    required this.itemCat,
  });
}

class CartModel extends ChangeNotifier {
  void removeItem(String itemName) {
    _cartItems.removeWhere((cartItem) => cartItem.item.itemName == itemName);
    notifyListeners();
  }

  List<CartItem> _cartItems = [];
  int get cartItemCount {
    return _cartItems.length;
  }

  // Calculate the subtotal of all items in the cart
  double get subtotal {
    return _cartItems.fold(
        0, (sum, cartItem) => sum + (cartItem.item.itemPrice * cartItem.count));
  }

  // Calculate the grand total
  double get grandTotal {
    final double taxRate = 0.07; // 7% tax rate
    final double deliveryFee = 5;
    return subtotal * (1 + taxRate) + deliveryFee;
  }

  List<CartItem> get cartItems => _cartItems;

  void addItem(Item item) {
    // Check if the item is already in the cart
    final cartItemIndex = _cartItems
        .indexWhere((cartItem) => cartItem.item.itemName == item.itemName);

    if (cartItemIndex == -1) {
      // If the item is not in the cart, add a new CartItem
      _cartItems.add(CartItem(item: item));
    } else {
      // If the item is already in the cart, increment its count
      _cartItems[cartItemIndex].count++;
    }

    notifyListeners();
  }

  // Add any other methods for cart functionality
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Your Items',
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Consumer<CartModel>(
              builder: (context, cartModel, child) {
                return ListView.builder(
                  itemCount: cartModel.cartItems.length,
                  itemBuilder: (context, index) {
                    CartItem cartItem = cartModel.cartItems[index];
                    Item item = cartItem.item;
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Container(
                        // margin: const EdgeInsets.only(bottom: 5),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.4), // shadow color
                              spreadRadius: 0, // spread radius
                              blurRadius: 2, // blur radius
                              offset: const Offset(
                                  0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.indigo.withOpacity(0.05)),
                                height: 75,
                                width: 75,
                                child: Image.asset(item.itemPhoto)),
                            const SizedBox(width: 20),
                            Expanded(
                              flex: 7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.itemName,
                                    overflow:
                                        TextOverflow.ellipsis, // Add this line
                                    style: SafeGoogleFont('Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        height: 1.5,
                                        color: Colors.indigo),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.black),
                                    child: Text(
                                      '\$ ${item.itemPrice.toStringAsFixed(2)}',
                                      style: SafeGoogleFont('Poppins',
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          height: 1.5,
                                          color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.black),
                                    child: Text(
                                      item.itemCat,
                                      style: SafeGoogleFont('Poppins',
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          height: 1.5,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.indigo),
                                      child: InkWell(
                                        onTap: () {
                                          Provider.of<CartModel>(context,
                                                  listen: false)
                                              .removeItem(
                                                  cartItem.item.itemName);
                                        },
                                        child: const Icon(
                                          Icons.delete,
                                          size: 18,
                                          color: Colors.white,
                                        ),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Consumer<CartModel>(
            builder: (context, cartModel, child) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Coupon Code',
                      style: SafeGoogleFont('Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                          color: Colors.black.withOpacity(1)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.shade300),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'AXD5722',
                                style: SafeGoogleFont('Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                    color: Colors.black.withOpacity(0.2)),
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                height: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black.withOpacity(01)),
                                child: Text(
                                  'Check Code',
                                  style: SafeGoogleFont('Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      height: 1.5,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: SafeGoogleFont('Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              color: Colors.black.withOpacity(1)),
                        ),
                        Text(
                          '\$${cartModel.subtotal.toStringAsFixed(2)}',
                          style: SafeGoogleFont('Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              color: Colors.black.withOpacity(1)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Fee',
                          style: SafeGoogleFont('Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              color: Colors.black.withOpacity(1)),
                        ),
                        Text(
                          '\$5',
                          style: SafeGoogleFont('Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              color: Colors.black.withOpacity(1)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tax',
                          style: SafeGoogleFont('Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              color: Colors.black.withOpacity(1)),
                        ),
                        Text(
                          '7%',
                          style: SafeGoogleFont('Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              color: Colors.black.withOpacity(1)),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Grand Total',
                          style: SafeGoogleFont('Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              color: Colors.black.withOpacity(1)),
                        ),
                        Text(
                          '\$${cartModel.grandTotal.toStringAsFixed(2)}',
                          style: SafeGoogleFont('Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              color: Colors.black.withOpacity(1)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        (const CheckoutPage())),
                              );
                            },
                            child: Container(
                              height: 40,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black),
                              child: Text(
                                'Checkout',
                                style: SafeGoogleFont('Poppins',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                    color: Colors.white.withOpacity(1)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class CartItem {
  final Item item;
  int count;

  CartItem({required this.item, this.count = 1});
}
