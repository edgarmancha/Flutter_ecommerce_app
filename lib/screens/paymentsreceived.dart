import 'package:flutter/material.dart';
import 'package:shopmk/screens/tracker.dart';

import '../utils/utils.dart';

class PaymentReceived extends StatefulWidget {
  final double totalAmount;

  PaymentReceived({required this.totalAmount});

  @override
  _PaymentReceivedState createState() => _PaymentReceivedState();
}

class _PaymentReceivedState extends State<PaymentReceived>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animationController.forward();

    Future.delayed(const Duration(seconds: 7), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) =>
            const TrackPage(), // Replace with the desired new page
      ));
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotationTransition(
                turns: _animationController,
                child: const Icon(
                  Icons.check_circle,
                  size: 100,
                  color: Colors.indigo,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Payment Received!',
                style: SafeGoogleFont('Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    color: Colors.black.withOpacity(1)),
              ),
              const SizedBox(height: 20),
              Divider(color: Colors.black.withOpacity(0.5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Text(
                      'Cart Amount',
                      style: SafeGoogleFont('Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                          color: Colors.black.withOpacity(1)),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '\$${widget.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const CircularProgressIndicator(
                color: Colors.indigo,
              )
            ],
          ),
        ),
      ),
    );
  }
}
