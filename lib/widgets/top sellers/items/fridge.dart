import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../../../utils/utils.dart';
import 'package:shopmk/screens/itemdetails.dart';

class Fridge extends StatefulWidget {
  const Fridge({Key? key})
      : super(key: key); // Pass key to the super constructor

  @override
  State<Fridge> createState() => _FridgeState();
}

class _FridgeState extends State<Fridge> {
  String itemName =
      'Midea 43 Liters Refrigerator, HS-65L Inside Condenser R600A Gas - Silver';
  double itemPrice = 108.49;
  String itemDesc =
      "Introducing our latest refrigerator model, the perfect appliance to keep your food fresh and organized! Our refrigerator features a spacious and versatile interior that can accommodate all your groceries, from fruits and vegetables to dairy and meat products. The adjustable shelves and door bins allow you to customize the storage space to fit your needs, while the humidity-controlled crisper drawers keep your produce fresh and crisp for longer. Our refrigerator is also equipped with a built-in water and ice dispenser that provides clean and refreshing water and ice cubes on demand, without the need for constant refilling or bulky pitchers. The digital temperature control panel and LED display make it easy to monitor and adjust the temperature settings, while the energy-efficient design ensures lower electricity bills and a reduced carbon footprint. With its sleek and modern design and reliable performance, our refrigerator is the perfect choice for any household or office. Order yours today and experience the convenience and comfort of a well-stocked and organized fridge!";
  String itemCat = 'ELECTRONICS';
  String itemPhoto = 'assets/fridge.png';

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
