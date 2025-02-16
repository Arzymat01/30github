import 'package:doctor_consultant/modules/home/screen/select_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Doctor {
  final String name;
  final String specialty;
  final String experience;
  final String rating;
  final String reviews;
  final String availableTime;
  final String image;
  bool isFavorite;

  Doctor({
    required this.name,
    required this.specialty,
    required this.experience,
    required this.rating,
    required this.reviews,
    required this.availableTime,
    required this.image,
    this.isFavorite = false,
  });
}

class FindDoctorsPage extends StatefulWidget {
  @override
  _FindDoctorsPageState createState() => _FindDoctorsPageState();
}

class _FindDoctorsPageState extends State<FindDoctorsPage> {
  TextEditingController _finnsearcgcontroller = TextEditingController();

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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/baground.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          CupertinoIcons.back,
                          color: Colors.grey[700],
                          size: 20,
                        ),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    'Find Doctors',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )
                ],
              ),
              SizedBox(height: 20),
              TextField(
                controller: _finnsearcgcontroller,
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: _finnsearcgcontroller.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            _finnsearcgcontroller.clear();
                          },
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onChanged: (text) {},
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
                          doctors[index].isFavorite =
                              !doctors[index].isFavorite;
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
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
                      Icon(Icons.star, color: Color(0xFF0EBE7F), size: 16),
                      SizedBox(width: 4),
                      Text(
                        doctor.rating,
                        style: TextStyle(
                          color: Color(0xFF0EBE7F),
                        ),
                      ),
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
                            color: Color(0xFF0EBE7F),
                            fontWeight: FontWeight.bold),
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectTimeScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0EBE7F),
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
