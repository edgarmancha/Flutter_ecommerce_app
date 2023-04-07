import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/utils.dart';

class Food extends StatefulWidget {
  const Food({super.key});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage('assets/food.jpg'),
                    fit: BoxFit.cover,
                    opacity: sqrt1_2),
                color: Colors.black.withOpacity(0.9),
                borderRadius: BorderRadius.circular(5)),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.all(4),
                color: Colors.black.withOpacity(0.5),
                child: Column(
                  children: [
                    Text(
                      'Food',
                      style: SafeGoogleFont('Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                          color: Colors.white),
                    ),
                    Text(
                      '21,103 Items',
                      style: SafeGoogleFont('Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          height: 1.5,
                          color: Colors.white),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
