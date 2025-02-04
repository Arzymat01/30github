import 'package:doctor_consultant/constants/color.dart';
import 'package:doctor_consultant/modules/diagonstics%20/screen/diagonstics%20_screen.dart';
import 'package:doctor_consultant/modules/favoirite/screen/favorite_screen.dart';
import 'package:doctor_consultant/modules/home/screen/home_scrren.dart';
import 'package:doctor_consultant/modules/messages/screen/messages_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
      backgroundColor: Colors.black,
      body: _pages[_selectedIndex],
      bottomNavigationBar: _buildCustomBottomNavigationBar(),
    );
  }

  Widget _buildCustomBottomNavigationBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.borderBottom, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(3, (index) => _buildNavItem(index)),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final List<String> assetPaths = [
      'assets/icons/content.svg',
      'assets/icons/finance.svg',
      'assets/icons/setting.svg',
    ];
    final List<String> labels = [
      'Content',
      'Finance',
      'Settings',
    ];

    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF3A47D5) : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              assetPaths[index],
              width: 22.w,
              color: Colors.white,
            ),
            if (isSelected) ...[
              const SizedBox(width: 8),
              Text(
                labels[index],
                style: TextStyle(
                  fontFamily: 'Tomorrow',
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
