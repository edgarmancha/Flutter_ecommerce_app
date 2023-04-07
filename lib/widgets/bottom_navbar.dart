import 'package:flutter/material.dart';
import 'package:shopmk/utils/utils.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: SafeGoogleFont('Poppins',
          fontSize: 12,
          fontWeight: FontWeight.normal,
          height: 1.5,
          color: Colors.black.withOpacity(.7)),
      selectedLabelStyle: SafeGoogleFont('Poppins',
          fontSize: 12,
          fontWeight: FontWeight.bold,
          height: 1.5,
          color: Colors.black.withOpacity(.7)),
      showUnselectedLabels: true,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.category),
          icon: Icon(Icons.category_outlined),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.account_circle),
          icon: Icon(Icons.account_circle_outlined),
          label: 'Accounts',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.settings),
          icon: Icon(Icons.settings_outlined),
          label: 'Settings',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.indigo,
      onTap: (index) => onTap(index),
    );
  }
}
