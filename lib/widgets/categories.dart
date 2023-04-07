import 'package:flutter/material.dart';
import 'package:shopmk/widgets/categories/electronics.dart';
import 'package:shopmk/widgets/categories/food.dart';
import 'package:shopmk/widgets/categories/furniture.dart';
import 'package:shopmk/widgets/categories/kitchen.dart';

import '../utils/utils.dart';
import 'categories/bathroom.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Top Categories',
            style: SafeGoogleFont('Poppins',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                height: 1.5,
                color: Colors.indigo.withOpacity(.7)),
          )),
      const SizedBox(height: 10),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Electronics(),
            SizedBox(
              width: 10,
            ),
            Furniture(),
            SizedBox(
              width: 10,
            ),
            Kitchen(),
            SizedBox(
              width: 10,
            ),
            Bathroom(),
            SizedBox(
              width: 10,
            ),
            Food(),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    ]);
  }
}
