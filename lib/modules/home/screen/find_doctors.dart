import 'package:flutter/material.dart';

class FindDoctorsPage extends StatelessWidget {
  final List<Doctor> doctors = [
    Doctor(
      name: "Dr. Shruti Kedia",
      specialty: "Tooths Dentist",
      experience: "7 Years experience",
      rating: "87%",
      reviews: "69 Patient Stories",
      availableTime: "10:00 AM tomorrow",
      image: "assets/images/2.png",
      isFavorite: true,
    ),
    Doctor(
      name: "Dr. Watamaniuk",
      specialty: "Tooths Dentist",
      experience: "9 Years experience",
      rating: "74%",
      reviews: "78 Patient Stories",
      availableTime: "12:00 AM tomorrow",
      image: "assets/images/1.png",
      isFavorite: false,
    ),
    Doctor(
      name: "Dr. Crownover",
      specialty: "Tooths Dentist",
      experience: "5 Years experience",
      rating: "59%",
      reviews: "86 Patient Stories",
      availableTime: "11:00 AM tomorrow",
      image: "assets/images/3.png",
      isFavorite: true,
    ),
    Doctor(
      name: "Dr. Balestra",
      specialty: "Tooths Dentist",
      experience: "6 Years experience",
      rating: "90%",
      reviews: "90 Patient Stories",
      availableTime: "9:00 AM tomorrow",
      image: "assets/images/1.png",
      isFavorite: false,
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
        title: Text("Find Doctors"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Dentist",
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
                  return DoctorCard(doctor: doctors[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Doctor {
  final String name;
  final String specialty;
  final String experience;
  final String rating;
  final String reviews;
  final String availableTime;
  final String image;
  final bool isFavorite;

  Doctor({
    required this.name,
    required this.specialty,
    required this.experience,
    required this.rating,
    required this.reviews,
    required this.availableTime,
    required this.image,
    required this.isFavorite,
  });
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({Key? key, required this.doctor}) : super(key: key);

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
                      Text(
                        doctor.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        doctor.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: doctor.isFavorite ? Colors.red : Colors.grey,
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
                      Text(doctor.reviews,
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Next Available",
                              style: TextStyle(color: Colors.green)),
                          Text(doctor.availableTime,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              alignment: Alignment.center,
                              backgroundColor: Colors.green),
                          child: Text("Book Now"),
                        ),
                      ),
                    ],
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
