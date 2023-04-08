import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import 'package:shopmk/screens/itemdetails.dart';

class Spoons extends StatefulWidget {
  const Spoons({Key? key})
      : super(key: key); // Pass key to the super constructor

  @override
  State<Spoons> createState() => _SpoonsState();
}

class _SpoonsState extends State<Spoons> {
  String itemName = 'Elegant Table Spoon 12 Set';
  double itemPrice = 10.99;
  String itemDesc =
      'Introducing the sleek and modern electric Spoons, a must-have for every kitchen! Boasting a sturdy and stylish stainless steel design, this Spoons is not only aesthetically pleasing, but also incredibly functional. With a powerful 1500 watt heating element, this electric Spoons can boil water in just a few minutes, making it perfect for busy mornings or those times when you just need a quick cup of tea. The large capacity of 1.7 liters means you can easily make enough hot water for several cups, without having to refill the Spoons.';
  String itemCat = 'KITCHEN';
  String itemPhoto = 'assets/spoons.png';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => (ItemDetailsPage(
                  itemCat: itemCat,
                  itemDesc: itemDesc,
                  itemPhoto: itemPhoto,
                  itemPrice: itemPrice,
                  itemName: itemName))),
        );
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // shadow color
                  spreadRadius: 0, // spread radius
                  blurRadius: 2, // blur radius
                  offset: const Offset(2, 0), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Stack(
                    children: [
                      Container(
                        height: 100,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                        ),
                        child: Image.asset(
                          itemPhoto,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return const Center(
                                child: Text('Error loading image'));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  itemName,
                  overflow: TextOverflow.ellipsis, // Add this line

                  style: SafeGoogleFont('Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                      color: Colors.black),
                  textAlign: TextAlign.left,
                ),
                Text(
                  itemDesc,
                  overflow: TextOverflow.ellipsis, // Add this line

                  style: SafeGoogleFont('Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      height: 1.5,
                      color: Colors.grey.shade600),
                  textAlign: TextAlign.left,
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      child: Text(
                        '\$ ${itemPrice.toStringAsFixed(2)}',
                        style: SafeGoogleFont('Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                            color: Colors.black),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.black.withOpacity(0.8)),
                child: Text(
                  itemCat,
                  style: SafeGoogleFont('Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                      color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }
}
