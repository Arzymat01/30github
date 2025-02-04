import 'package:doctor_consultant/components/my_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyBottomNavigationBar(),
        ),
      );
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'assets/images/loading.png',
          width: 398.w,
          height: 398.h,
        ),
      ),
    );
  }
}
