import 'package:flutter/material.dart';

class Doctor {
  final String name;
  final String specialty;
  final String experience;
  final String rating;
  final String reviews;
  final String availableTime;
  final String image;
  bool isFavorite; // Like абалын өзгөртүү үчүн

  Doctor({
    required this.name,
    required this.specialty,
    required this.experience,
    required this.rating,
    required this.reviews,
    required this.availableTime,
    required this.image,
    this.isFavorite = false, // Default боюнча false (Like басылбаган)
  });
}

class FindDoctorsPage extends StatefulWidget {
  @override
  _FindDoctorsPageState createState() => _FindDoctorsPageState();
}

class _FindDoctorsPageState extends State<FindDoctorsPage> {
  final List<Doctor> doctors = [
    Doctor(
      name: "Dr. Tranquilli",
      specialty: "Specialist Medicine",
      experience: "6 Years experience",
      rating: "87%",
      reviews: "69 Patient Stories",
      availableTime: "10:00 AM tomorrow",
      image: "assets/images/2.png",
    ),
    Doctor(
      name: "Dr. Bonebrake",
      specialty: "Specialist Dentist",
      experience: "8 Years experience",
      rating: "59%",
      reviews: "82 Patient Stories",
      availableTime: "12:00 AM tomorrow",
      image: "assets/images/1.png",
    ),
    Doctor(
      name: "Dr. Luke Whitesell",
      specialty: "Specialist Cardiology",
      experience: "7 Years experience",
      rating: "57%",
      reviews: "76 Patient Stories",
      availableTime: "11:00 AM tomorrow",
      image: "assets/images/3.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("My Doctors"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return DoctorCard(
                    doctor: doctors[index],
                    onFavoriteToggle: () {
                      setState(() {
                        doctors[index].isFavorite = !doctors[index].isFavorite;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  final VoidCallback onFavoriteToggle;

  const DoctorCard({
    Key? key,
    required this.doctor,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                doctor.image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          doctor.name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          doctor.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: doctor.isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: onFavoriteToggle,
                      ),
                    ],
                  ),
                  Text(
                    doctor.specialty,
                    style: TextStyle(color: Colors.blue),
                  ),
                  Text(
                    doctor.experience,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.green, size: 16),
                      SizedBox(width: 4),
                      Text(doctor.rating),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          doctor.reviews,
                          style: TextStyle(color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        "Next Available",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          doctor.availableTime,
                          style: TextStyle(color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text("Book Now",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
