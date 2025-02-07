import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 16),
              _buildSearchBar(),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildLiveDoctorItem("assets/images/image1.png"),
                    _buildLiveDoctorItem("assets/images/image2.png"),
                    _buildLiveDoctorItem("assets/images/image3.png"),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildCategoryIcons(),
              const SizedBox(height: 16),
              _buildPopularDoctors(),
              const SizedBox(height: 16),
              _buildFeatureDoctors(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Hi Handwerker!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            Text("Find Your Doctor",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ],
        ),
        CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage("assets/images/doc0.png"),
        )
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search...",
        prefixIcon: Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildLiveDoctorItem(String imagePath) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(imagePath, width: 150, fit: BoxFit.cover),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text("LIVE",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
        Icon(Icons.play_circle_fill, color: Colors.white, size: 40),
      ],
    );
  }
}

Widget _buildCategoryIcons() {
  List<String> icons = [
    "assets/icons/koz.png",
    "assets/icons/tish.png",
    "assets/icons/heaert.png",
    "assets/icons/bel.png",
  ];

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: icons.map((icon) => SvgPicture.asset(icon, width: 50)).toList(),
  );
}

Widget _buildPopularDoctors() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _buildDoctorCard("Dr. Fillerup Grab", "Medicine Specialist"),
      _buildDoctorCard("Dr. Blessing", "Dentist Specialist"),
    ],
  );
}

Widget _buildDoctorCard(String name, String specialty) {
  return Container(
    width: 150,
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset("assets/images/doc0.png",
              height: 100, fit: BoxFit.cover),
        ),
        const SizedBox(height: 5),
        Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(specialty, style: TextStyle(color: Colors.grey)),
      ],
    ),
  );
}

Widget _buildFeatureDoctors() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _buildFeatureDoctor("Dr. Crick", "\$25.00/hr", 3.7),
      _buildFeatureDoctor("Dr. Strain", "\$22.00/hr", 3.0),
      _buildFeatureDoctor("Dr. Lachinet", "\$29.00/hr", 2.9),
    ],
  );
}

Widget _buildFeatureDoctor(String name, String price, double rating) {
  return Container(
    width: 100,
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
    ),
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset("assets/images/doc3.png",
              height: 60, fit: BoxFit.cover),
        ),
        Text(name, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        Text(price, style: TextStyle(color: Colors.green)),
        Text("⭐ $rating", style: TextStyle(color: Colors.orange)),
      ],
    ),
  );
}
