// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:shopmk/widgets/top%20sellers/items/bicycle.dart';
import 'package:shopmk/widgets/top%20sellers/items/fridge.dart';
import 'package:shopmk/widgets/top%20sellers/items/microwave.dart';
import 'package:shopmk/widgets/top%20sellers/items/mugs.dart';
import 'items/item.dart';
import 'items/pots.dart';
import 'items/spoons.dart';

class TopSellers extends StatefulWidget {
  const TopSellers({super.key});

  @override
  State<TopSellers> createState() => _TopSellersState();
}

class _TopSellersState extends State<TopSellers> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Expanded(child: Kettle()),
            SizedBox(width: 10),
            Expanded(child: Spoons()),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Expanded(child: Pots()),
            SizedBox(width: 10),
            Expanded(child: Bicycles()),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Expanded(child: Mugs()),
            SizedBox(width: 10),
            Expanded(child: Microwave()),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Expanded(child: Fridge()),
            SizedBox(width: 10),
            Expanded(child: Spoons()),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
