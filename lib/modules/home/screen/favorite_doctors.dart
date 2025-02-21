import 'package:flutter/material.dart';

class FavouriteDoctorsScreen extends StatelessWidget {
  const FavouriteDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Doctors"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search doctor...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return DoctorCard(doctor: doctors[index]);
                },
              ),
            ),
            SizedBox(height: 16),
            Text("Feature Doctor",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: featuredDoctors.length,
                itemBuilder: (context, index) {
                  return FeaturedDoctorCard(doctor: featuredDoctors[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.green),
              label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Library"),
        ],
      ),
    );
  }
}

class Doctor {
  final String name;
  final String specialty;
  final bool isFavorite;
  final String imageUrl;

  Doctor(
      {required this.name,
      required this.specialty,
      required this.isFavorite,
      required this.imageUrl});
}

List<Doctor> doctors = [
  Doctor(
      name: "Dr. Shouey",
      specialty: "Specialist Cardiology",
      isFavorite: true,
      imageUrl: "assets/doc1.png"),
  Doctor(
      name: "Dr. Christenfeld N",
      specialty: "Specialist Cancer",
      isFavorite: false,
      imageUrl: "assets/doc2.png"),
  Doctor(
      name: "Dr. Shouey",
      specialty: "Specialist Medicine",
      isFavorite: true,
      imageUrl: "assets/doc3.png"),
  Doctor(
      name: "Dr. Shouey",
      specialty: "Specialist Dentist",
      isFavorite: false,
      imageUrl: "assets/doc4.png"),
];

List<Doctor> featuredDoctors = [
  Doctor(
      name: "Dr. Crick",
      specialty: "\$50/h",
      isFavorite: false,
      imageUrl: "assets/doc5.png"),
  Doctor(
      name: "Dr. Strain",
      specialty: "\$29/h",
      isFavorite: false,
      imageUrl: "assets/doc6.png"),
  Doctor(
      name: "Dr. Lachinet",
      specialty: "\$30/h",
      isFavorite: true,
      imageUrl: "assets/doc7.png"),
];

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  DoctorCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
              radius: 30, backgroundImage: AssetImage(doctor.imageUrl)),
          SizedBox(height: 8),
          Text(doctor.name, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(doctor.specialty, style: TextStyle(color: Colors.green)),
          IconButton(
            icon: Icon(
              doctor.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: doctor.isFavorite ? Colors.red : Colors.grey,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

class FeaturedDoctorCard extends StatelessWidget {
  final Doctor doctor;

  FeaturedDoctorCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 5)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
              radius: 25, backgroundImage: AssetImage(doctor.imageUrl)),
          SizedBox(height: 8),
          Text(doctor.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          Text(doctor.specialty,
              style: TextStyle(color: Colors.green, fontSize: 12)),
        ],
      ),
    );
  }
}
