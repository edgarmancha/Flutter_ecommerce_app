import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../../../utils/utils.dart';
import 'package:shopmk/screens/itemdetails.dart';

class Microwave extends StatefulWidget {
  const Microwave({super.key});

  @override
  State<Microwave> createState() => _MicrowaveState();
}

class _MicrowaveState extends State<Microwave> {
  String itemName = 'Microwave';
  double itemPrice = 42.99;
  String itemDesc =
      "Introducing our latest microwave model, the perfect addition to your kitchen appliances! Our microwave features a sleek and modern design that blends seamlessly with any decor, while its compact size makes it ideal for small kitchens or dorm rooms. With its powerful 700-watt output and multiple power levels, you can quickly and easily heat up your favorite meals and snacks, from leftover pizza to popcorn. The easy-to-use digital control panel and LED display make it simple to set the cooking time and monitor the progress, while the defrost function lets you thaw frozen foods in no time. Our microwave also comes with a glass turntable that ensures even heating and easy cleaning, as well as a child safety lock that prevents accidental operation. With its reliable performance and user-friendly features, our microwave is the perfect choice for busy families and individuals who value convenience and efficiency. Order yours today and start enjoying delicious meals and snacks in a flash!";
  String itemCat = 'ELECTRONICS';
  String itemPhoto = 'assets/microwave.png';

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
