import 'package:categrised_search/screens/nav_screens/nav_cart.dart';
import 'package:categrised_search/screens/nav_screens/nav_home.dart';
import 'package:categrised_search/screens/nav_screens/nav_profile.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentPage = 0;
  List<Widget> widgetOption = [
    NavHome(),
    NavCart(),
    NavProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOption.elementAt(currentPage),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
      ),
    );
  }
}
