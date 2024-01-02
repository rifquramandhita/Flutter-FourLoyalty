import 'package:flutter/material.dart';
import 'package:four_loyalty/ui/commingsoon/commingsoon_page.dart';
import 'package:four_loyalty/ui/mycoupons/mycoupon_page.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  List<BottomNavigationBarItem> bottomNavigationMenu = [
    BottomNavigationBarItem(
      icon: Icon(Icons.discount),
      label: 'My Coupon',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Setting',
    )
  ];
  int _selectedIndex = 0;
  List<Widget> _widgetSelected = [
    MyCoupons_page(),
    CommingSoon_page(),
    CommingSoon_page(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetSelected.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavigationMenu,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
