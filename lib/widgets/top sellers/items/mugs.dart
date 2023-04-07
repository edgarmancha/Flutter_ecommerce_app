import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../../../utils/utils.dart';
import 'package:shopmk/screens/itemdetails.dart';

class Mugs extends StatefulWidget {
  const Mugs({super.key});

  @override
  State<Mugs> createState() => _MugsState();
}

class _MugsState extends State<Mugs> {
  String itemName = 'Ceramic Mugs';
  double itemPrice = 18.49;
  String itemDesc =
      "Introducing our collection of beautiful and functional mugs, perfect for sipping your favorite hot beverages in style! Each mug features a high-quality ceramic construction that ensures durability and heat retention, while the smooth and glossy finish adds a touch of elegance to your kitchenware collection. Our mugs come in a variety of sizes and designs, from classic white to colorful and quirky patterns, so you can choose the one that suits your taste and personality. The comfortable and ergonomic handles make it easy to hold and carry, and the wide base ensures stability on any surface. Our mugs are also dishwasher and microwave safe, making them a convenient and practical addition to your daily routine. Whether you're enjoying a cozy morning coffee or an afternoon tea break, our mugs will keep your beverages warm and your spirits high. Order yours today and elevate your drinking experience!";
  String itemCat = 'KITCHEN';
  String itemPhoto = 'assets/mugs.png';
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
