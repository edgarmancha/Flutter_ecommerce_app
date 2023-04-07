// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopmk/myappbar.dart';
import '../utils/utils.dart';
import 'cart.dart';

class ItemDetailsPage extends StatefulWidget {
  double itemPrice;
  String itemDesc;
  String itemPhoto;
  String itemCat;
  String itemName;

  ItemDetailsPage(
      {super.key,
      required this.itemPrice,
      required this.itemCat,
      required this.itemName,
      required this.itemDesc,
      required this.itemPhoto});

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MyAppBar(title: 'Product Details'),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: SizedBox(
                      height: 180,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(widget.itemPhoto),
                          VerticalDivider(
                            color: Colors.black.withOpacity(0.2),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    // color: Colors.black.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(3),
                                    border: Border.all(
                                        width: .1, color: Colors.black)),
                                height: 50,
                                width: 50,
                                child: Image.asset(widget.itemPhoto),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                    // color: Colors.black.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(3),
                                    border: Border.all(
                                        width: .1, color: Colors.black)),
                                height: 50,
                                width: 50,
                                child: Image.asset(widget.itemPhoto),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                    // color: Colors.black.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(3),
                                    border: Border.all(
                                        width: .1, color: Colors.black)),
                                height: 50,
                                width: 50,
                                child: Image.asset(widget.itemPhoto),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 7,
                        width: 7,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        height: 7,
                        width: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            shape: BoxShape.rectangle,
                            color: Colors.black.withOpacity(0.7)),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        height: 7,
                        width: 7,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.itemName.toUpperCase(),
                          overflow: TextOverflow.ellipsis, // Add this line

                          style: SafeGoogleFont('Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                        Divider(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              height: 25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black),
                              child: Text(
                                widget.itemCat,
                                style: SafeGoogleFont('Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5,
                                    color: Colors.white),
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.favorite_outline,
                                  color: Colors.black,
                                ),
                                const SizedBox(width: 15),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  height: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.black.withOpacity(01)),
                                  child: Text(
                                    '\$ ${widget.itemPrice.toStringAsFixed(2)}',
                                    style: SafeGoogleFont('Poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        height: 1.5,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          widget.itemDesc,
                          style: SafeGoogleFont('Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              height: 1.5,
                              color: Colors.grey.shade700),
                        ),
                        Divider(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$ ${widget.itemPrice.toStringAsFixed(2)}',
                              style: SafeGoogleFont('Poppins',
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5,
                                  color: Colors.black),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              height: 25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black.withOpacity(01)),
                              child: Text(
                                '1,823 Reviews',
                                style: SafeGoogleFont('Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        Text(
                          'Have a coupon code? Check it here 👇',
                          style: SafeGoogleFont('Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              color: Colors.black.withOpacity(0.5)),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.shade300),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'What\'s your code?',
                                style: SafeGoogleFont('Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                    color: Colors.black.withOpacity(0.5)),
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
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 7,
                              child: Container(
                                alignment: Alignment.center,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(3)),
                                child: Text(
                                  'Buy Now @ ${widget.itemPrice}',
                                  style: SafeGoogleFont('Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      height: 1.5,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      Container(
                          height: 35,
                          width: 35,
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.red.withOpacity(01),
                              borderRadius: BorderRadius.circular(3)),
                          child: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          )),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3)),
                        child: Text(
                          '1',
                          style: SafeGoogleFont('Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                          width: 35,
                          height: 35,
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.green.withOpacity(01),
                              borderRadius: BorderRadius.circular(3)),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: InkWell(
                    onTap: () {
                      Provider.of<CartModel>(context, listen: false).addItem(
                        Item(
                          itemName: widget.itemName,
                          itemPrice: widget.itemPrice,
                          itemDesc: widget.itemDesc,
                          itemPhoto: widget.itemPhoto,
                          itemCat: widget.itemCat,
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(01),
                          borderRadius: BorderRadius.circular(3)),
                      child: Text(
                        'Add to Cart',
                        style: SafeGoogleFont('Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
