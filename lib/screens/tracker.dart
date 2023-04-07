// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopmk/myappbar.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../utils/utils.dart';
import 'cart.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({Key? key}) : super(key: key);

  @override
  _TrackPageState createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> with TickerProviderStateMixin {
  List<String> deliverySteps = [
    'Sorting',
    'Packaging',
    'Packing',
    'On its way to you',
    'Delivered',
  ];

  @override
  Widget build(BuildContext context) {
    var cartModel = Provider.of<CartModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MyAppBar(title: 'Tracker'),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Text(
                'Your Purchases',
                style: SafeGoogleFont('Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    color: Colors.indigo.withOpacity(1)),
              )),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cartModel.cartItems.length,
              itemBuilder: (context, index) {
                CartItem cartItem = cartModel.cartItems[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.indigo.withOpacity(0.08)),
                    height: 75,
                    width: 75,
                    child: Column(
                      children: [
                        Image.asset(
                          cartItem.item.itemPhoto,
                          height: 60,
                        ),
                        Text(
                          cartItem.item.itemName,
                          overflow: TextOverflow.ellipsis,
                          style: SafeGoogleFont('Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: deliverySteps.length,
              itemBuilder: (context, index) {
                return TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.15,
                  isFirst: index == 0,
                  isLast: index == deliverySteps.length - 1,
                  indicatorStyle: IndicatorStyle(
                    width: 40,
                    height: 40,
                    indicator: _buildIndicator(index),
                    indicatorXY: 0.2,
                  ),
                  endChild: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.indigo.withOpacity(0.4)),
                      child: Text(
                        deliverySteps[index],
                        style: SafeGoogleFont('Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                            color: Colors.black),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator(int index) {
    IconData iconData;
    switch (index) {
      case 0:
        iconData = Icons.sort;
        break;
      case 1:
        iconData = Icons.archive;
        break;
      case 2:
        iconData = Icons.backpack;
        break;
      case 3:
        iconData = Icons.local_shipping;
        break;
      case 4:
        iconData = Icons.done_all;
        break;
      default:
        iconData = Icons.help;
    }

    return RotatingIcon(
      iconData: iconData,
      vsync: this,
    );
  }
}

class RotatingIcon extends StatefulWidget {
  final IconData iconData;
  final TickerProvider vsync;

  const RotatingIcon({
    Key? key,
    required this.iconData,
    required this.vsync,
  }) : super(key: key);

  @override
  _RotatingIconState createState() => _RotatingIconState();
}

class _RotatingIconState extends State<RotatingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: widget.vsync,
    );

    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animationController.value * 2 * 3.141592653589793,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.indigo,
            ),
            child: Icon(
              widget.iconData,
              size: 20,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
