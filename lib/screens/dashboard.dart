import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopmk/myappbar.dart';
import 'package:shopmk/widgets/categories.dart';
import 'package:shopmk/widgets/top%20sellers/topseller.dart';

import '../utils/utils.dart';
import '../widgets/bottom_navbar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> sliderImages = [
      'https://i.pinimg.com/originals/02/cf/cf/02cfcffac595c832c514d58704cd82ce.jpg',
      'https://i.pinimg.com/originals/08/99/bc/0899bc36fb4c78b87362dc8801a87375.jpg'
    ];

    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      backgroundColor: Colors.white,
      appBar: const MyAppBar(title: 'ShopMK'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
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

            //slider
            Column(
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Exciting Offers',
                      style: SafeGoogleFont('Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                          color: Colors.indigo.withOpacity(.7)),
                    )),
              ],
            ),
            //top sellers
            const SizedBox(height: 15),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: 130,
                // aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlayInterval: const Duration(seconds: 7),
              ),
              items: sliderImages.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
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
                      color: Colors.indigo.withOpacity(.7)),
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
