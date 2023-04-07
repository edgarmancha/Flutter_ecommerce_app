import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shopmk/screens/itemdetails.dart';
import '../../../utils/utils.dart';

class Bicycles extends StatefulWidget {
  const Bicycles({super.key});

  @override
  State<Bicycles> createState() => _BicyclesState();
}

class _BicyclesState extends State<Bicycles> {
  String itemName = 'Bicycle with Electric motors';
  double itemPrice = 78.49;
  String itemDesc =
      'Introducing our latest bicycle model, the perfect choice for cycling enthusiasts and adventurers alike! Our bicycle features a lightweight and durable aluminum frame that can handle any terrain with ease. The 21-speed Shimano drivetrain provides smooth and reliable shifting, while the front suspension fork and rear shock absorber ensure a comfortable ride, even on rough roads. The bike is equipped with reliable and responsive disc brakes that provide excellent stopping power, even in wet or muddy conditions. With its sleek design and vibrant colors, this bicycle is sure to turn heads wherever you go. Whether you\'re commuting to work, exploring new trails, or simply enjoying a leisurely ride around town, our bicycle will help you do it all in style and comfort. Order yours today and experience the joy of cycling!';
  String itemCat = 'VEHICLE';
  String itemPhoto = 'assets/bicycle.png';

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
