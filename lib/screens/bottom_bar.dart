import 'package:flutter/material.dart';
import 'package:flutter_bttm_bar/main.dart';
import 'package:flutter_bttm_bar/screens/cart.dart';
import 'package:flutter_bttm_bar/screens/categories.dart';
import 'package:flutter_bttm_bar/screens/user.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int selectedIndex = 0;

  final List _pages = [
    const MyHomePage(),
    const CategoryScreen(),
    const CartScreen(),
    const UserScreen()
  ];
  void _selectedPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex], //harus dinamic, bukan [0]
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ThemeData().scaffoldBackgroundColor,
          showSelectedLabels:
              false, //utk mengghilangkan labelnya, saat selected
          // showUnselectedLabels:
          //     false, //utk mengghilangkan labelnya, saat unselected

          type: BottomNavigationBarType
              .fixed, //utk tampilan bottom bar kelihatan(tdk shifting)
          currentIndex: selectedIndex,
          onTap: _selectedPage,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                    selectedIndex == 0 ? IconlyBold.home : IconlyLight.home)
                // ignore: prefer_const_constructors
                ,
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(selectedIndex == 1
                    ? IconlyBold.category
                    : IconlyLight.category),
                label: 'Categories'),
            BottomNavigationBarItem(
                icon:
                    Icon(selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
                label: 'Cart'),
            const BottomNavigationBarItem(
                icon: Icon(IconlyLight.user3), label: 'User'),
          ]),
    );
  }
}
