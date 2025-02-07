import 'package:doctor_consultant/constants/color.dart';
import 'package:doctor_consultant/modules/diagonstics%20/screen/diagonstics%20_screen.dart';
import 'package:doctor_consultant/modules/favoirite/screen/favorite_screen.dart';
import 'package:doctor_consultant/modules/home/screen/home_scrren.dart';
import 'package:doctor_consultant/modules/messages/screen/messages_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = [
    HomeScrren(),
    FavoriteScreen(),
    DiagonsticsScreen(),
    MessagesScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: _buildCustomBottomNavigationBar(),
    );
  }

  Widget _buildCustomBottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(4, (index) => _buildNavItem(index)),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final List<String> assetPaths = [
      'assets/icons/icon1.svg',
      'assets/icons/icon2.svg',
      'assets/icons/icon3.svg',
      'assets/icons/icon4.svg',
    ];

    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Color(0xFF0EBE7E) : Colors.transparent,
        ),
        child: SvgPicture.asset(
          assetPaths[index],
          width: 22,
          height: 22,
          colorFilter: ColorFilter.mode(
            isSelected ? Colors.white : Colors.grey,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
