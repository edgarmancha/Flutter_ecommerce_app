import 'package:flutter/material.dart';
import '../categories.dart';
import '../myappbar.dart';
import '../utils/utils.dart';
import '../widgets/top sellers/topseller.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MyAppBar(title: 'ShopMK'),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            //search bar
            Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4)),
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  const Icon(Icons.search),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Search ShopMK',
                    style: SafeGoogleFont('Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        height: 1.5,
                        color: Colors.black.withOpacity(.7)),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            //categories
            const Categories(),
            const SizedBox(height: 15),
            Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recently Viewed',
                  style: SafeGoogleFont('Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                      color: Colors.black.withOpacity(.7)),
                )),
            //top sellers
            const SizedBox(height: 5),
            Expanded(
              child: SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: const [
                      TopSellers(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
