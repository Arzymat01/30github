import 'package:doctor_consultant/modules/home/screen/find_doctors.dart';
import 'package:doctor_consultant/modules/home/screen/live_screen.dart';
import 'package:doctor_consultant/modules/home/screen/popular_doctor.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 16),
              _buildSearchBar(),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Live Doctors',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildLiveDoctorItem(context, "assets/images/image1.png"),
                    _buildLiveDoctorItem(context, "assets/images/image2.png"),
                    _buildLiveDoctorItem(context, "assets/images/image3.png"),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    OrganWidjet(
                      color: Color(0xFF3154F4),
                      image: 'assets/icons/tish.png',
                    ),
                    SizedBox(width: 15),
                    OrganWidjet(
                      color: Color(0xFF0CC78E),
                      image: 'assets/icons/heart.png',
                    ),
                    SizedBox(width: 15),
                    OrganWidjet(
                      color: Color(0xFFFE8246),
                      image: 'assets/icons/koz.png',
                    ),
                    SizedBox(width: 15),
                    OrganWidjet(
                      color: Color(0xFFFF5251),
                      image: 'assets/icons/koz.png',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Popular Doctor',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FindDoctorsPage()),
                  );
                },
                child: _buildPopularDoctors(),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PopularDoctor()),
                  );
                },
                child: _buildFeatureDoctors(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      decoration: BoxDecoration(
        color: Color(0xFF0EBE7F),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Hi Handwerker!",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Find Your Doctor",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          CircleAvatar(
            radius: 30, // Сүрөт чоңураак
            backgroundImage: AssetImage("assets/images/doc0.png"),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: "Search...",
          prefixIcon: Icon(Icons.search),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.close, color: Colors.black),
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                    });
                  },
                )
              : null,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (text) {
          setState(() {}); // UI жаңыртуу үчүн
        },
      ),
    );
  }

  Widget _buildLiveDoctorItem(
    BuildContext context,
    String imagePath,
  ) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(imagePath,
                width: 150, height: 200, fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 25,
          right: 30,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorlifeScreen()),
                );
              },
              child: Text(
                "LIVE",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12, // Кичинекей текст
                ),
              ),
            ),
          ),
        ),
        Icon(Icons.play_circle_fill, color: Colors.white, size: 40),
      ],
    );
  }
}

class OrganWidjet extends StatelessWidget {
  final String image;
  final Color color;
  const OrganWidjet({
    super.key,
    required this.image,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 113,
        height: 119,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20), // Бурчтарды жумшартуу
        ),
        child: Image.asset(
          image,
        ),
      ),
    );
  }
}

Widget _buildPopularDoctors() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDoctorCard("Dr. Fillerup Grab", "Medicine Specialist"),
        _buildDoctorCard("Dr. Blessing", "Dentist Specialist"),
      ],
    ),
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
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
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
          Text(name,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          Text(price, style: TextStyle(color: Colors.green)),
          Text("⭐ $rating", style: TextStyle(color: Colors.orange)),
        ],
      ),
    ),
  );
}
