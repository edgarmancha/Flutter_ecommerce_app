// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopmk/myappbar.dart';
import 'package:shopmk/screens/paymentsreceived.dart';

import '../utils/utils.dart';
import '../widgets/pageroute.dart';
import 'cart.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final _numberController = TextEditingController();
    final _cvvController = TextEditingController();
    final _expiryController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MyAppBar(title: 'Checkout'),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Consumer<CartModel>(
                builder: (context, cartModel, child) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 130,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: cartModel.cartItems.length,
                            itemBuilder: (context, index) {
                              final cartItem = cartModel.cartItems[index];
                              final item = cartItem.item;
                              return Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 120,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.black.withOpacity(0.3),
                                          image: DecorationImage(
                                              image: AssetImage(item.itemPhoto),
                                              fit: BoxFit.contain)),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: 25,
                                                    padding:
                                                        const EdgeInsets.all(3),
                                                    decoration:
                                                        const BoxDecoration(
                                                            color:
                                                                Colors.black),
                                                    child: Text(
                                                      '\$ ${item.itemPrice.toStringAsFixed(2)}',
                                                      style: SafeGoogleFont(
                                                          'Poppins',
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          height: 1.5,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    height: 25,
                                                    padding:
                                                        const EdgeInsets.all(3),
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape: BoxShape
                                                                .rectangle,
                                                            color:
                                                                Colors.indigo),
                                                    child: InkWell(
                                                      onTap: () {
                                                        Provider.of<CartModel>(
                                                                context,
                                                                listen: false)
                                                            .removeItem(cartItem
                                                                .item.itemName);
                                                      },
                                                      child: const Icon(
                                                        Icons.delete,
                                                        size: 18,
                                                        color: Colors.white,
                                                      ),
                                                    )),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(3),
                                                    decoration:
                                                        const BoxDecoration(
                                                            color:
                                                                Colors.black),
                                                    child: Text(
                                                      item.itemName,
                                                      overflow: TextOverflow
                                                          .ellipsis, // Add this line

                                                      style: SafeGoogleFont(
                                                          'Poppins',
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          height: 1.5,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(3),
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Colors.white),
                                                  child: Text(
                                                    'x${cartItem.count}',
                                                    style: SafeGoogleFont(
                                                        'Poppins',
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        height: 1.5,
                                                        color: Colors.indigo),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ]),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Payment Methods',
                              style: SafeGoogleFont('Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5,
                                  color: Colors.black.withOpacity(.5)),
                            )),
                        Column(
                          children: [
                            TextFormField(
                              controller: _nameController,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Name on Card';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                errorStyle: TextStyle(
                                    color: Colors.indigo.withOpacity(0.7)),
                                labelText: 'Name',
                                labelStyle: SafeGoogleFont('Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                    color: Colors.black.withOpacity(.5)),
                              ),
                            ),
                            TextFormField(
                              controller: _numberController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Card Number';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                errorStyle: TextStyle(
                                    color: Colors.indigo.withOpacity(0.7)),
                                labelText: 'Card Number',
                                labelStyle: SafeGoogleFont('Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                    color: Colors.black.withOpacity(.5)),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _expiryController,
                                    keyboardType: TextInputType.datetime,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Expiry date';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      errorStyle: TextStyle(
                                          color:
                                              Colors.indigo.withOpacity(0.7)),
                                      labelText: '01/2023',
                                      labelStyle: SafeGoogleFont('Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          height: 1.5,
                                          color: Colors.black.withOpacity(.5)),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TextFormField(
                                    controller: _cvvController,
                                    obscureText: true,
                                    keyboardType: TextInputType.visiblePassword,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'CVV';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      errorStyle: TextStyle(
                                          color:
                                              Colors.indigo.withOpacity(0.7)),
                                      labelText: 'CVV',
                                      labelStyle: SafeGoogleFont('Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          height: 1.5,
                                          color: Colors.black.withOpacity(.5)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Saved Cards',
                                  style: SafeGoogleFont('Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      height: 1.5,
                                      color: Colors.black.withOpacity(.5)),
                                )),
                            const SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black
                                          .withOpacity(0.4), // shadow color
                                      spreadRadius: 0, // spread radius
                                      blurRadius: 2, // blur radius
                                      offset: const Offset(
                                          0, 2), // changes position of shadow
                                    ),
                                  ],
                                  color: Colors.white),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Card Number',
                                                  style: SafeGoogleFont(
                                                      'Poppins',
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      height: 1.5,
                                                      color: Colors.black
                                                          .withOpacity(.5)),
                                                )),
                                            Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  '1234 **** **** 8956',
                                                  style: SafeGoogleFont(
                                                      'Poppins',
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      height: 1.5,
                                                      color: Colors.black
                                                          .withOpacity(.5)),
                                                )),
                                            const SizedBox(height: 10),
                                            Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Name on Card',
                                                  style: SafeGoogleFont(
                                                      'Poppins',
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      height: 1.5,
                                                      color: Colors.black
                                                          .withOpacity(.5)),
                                                )),
                                            Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Kaweng Mancha',
                                                  style: SafeGoogleFont(
                                                      'Poppins',
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      height: 1.5,
                                                      color: Colors.black
                                                          .withOpacity(.5)),
                                                )),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Expiry',
                                                  style: SafeGoogleFont(
                                                      'Poppins',
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      height: 1.5,
                                                      color: Colors.black
                                                          .withOpacity(.5)),
                                                )),
                                            Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  '05/2025',
                                                  style: SafeGoogleFont(
                                                      'Poppins',
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      height: 1.5,
                                                      color: Colors.black
                                                          .withOpacity(.5)),
                                                )),
                                            const SizedBox(height: 10),
                                            Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'CVV',
                                                  style: SafeGoogleFont(
                                                      'Poppins',
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      height: 1.5,
                                                      color: Colors.black
                                                          .withOpacity(.5)),
                                                )),
                                            Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  '***',
                                                  style: SafeGoogleFont(
                                                      'Poppins',
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      height: 1.5,
                                                      color: Colors.black
                                                          .withOpacity(.5)),
                                                )),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
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
                              Navigator.of(context).push(CustomPageRoute(
                                widget: PaymentReceived(
                                  totalAmount: cartModel.grandTotal,
                                ),
                              ));
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
