import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shopmk/screens/itemdetails.dart';

import '../../../utils/utils.dart';

class Pots extends StatefulWidget {
  const Pots({super.key});

  @override
  State<Pots> createState() => _PotsState();
}

class _PotsState extends State<Pots> {
  String itemName = 'Non-Stick Pots set.';
  double itemPrice = 18.49;
  String itemDesc =
      'Introducing our non-stick pot, the perfect addition to your kitchen cookware collection! This pot features a durable, non-stick interior that makes cooking and cleaning a breeze. With its large capacity, you can cook up delicious meals for your family and friends. The ergonomic handles ensure a comfortable grip, and the tempered glass lid allows you to monitor your food without losing heat or flavor. Our non-stick pot is compatible with all stovetops, including induction cooktops, and is oven safe up to 350°F. Whether you\'re simmering a savory stew or boiling pasta, our non-stick pot is a versatile and reliable kitchen essential that will help you create delicious meals with ease. Order yours today and start cooking like a pro!';
  String itemCat = 'KITCHEN';
  String itemPhoto = 'assets/pots.png';

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
      child: Expanded(
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
                          child: Image.asset(itemPhoto),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    itemName,
                    overflow: TextOverflow.ellipsis, // Add this line

                    style: SafeGoogleFont('Poppins',
                        fontSize: 20,
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
      ),
    );
  }
}
