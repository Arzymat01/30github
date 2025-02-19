import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopularDoctor extends StatefulWidget {
  const PopularDoctor({super.key});

  @override
  State<PopularDoctor> createState() => _PopularDoctorState();
}

class _PopularDoctorState extends State<PopularDoctor> {
  TextEditingController _searchcon = TextEditingController();
  final List<Map<String, String>> popularDoctors = [
    {
      'name': 'Dr. Truluck Nik',
      'specialty': 'Medicine Specialist',
      'image': 'assets/images/popular1.png'
    },
    {
      'name': 'Dr. Tranquilli',
      'specialty': 'Pathology Specialist',
      'image': 'assets/images/popular2.png'
    },
    {
      'name': 'Dr. Truluck Nik',
      'specialty': 'Medicine Specialist',
      'image': 'assets/images/popular3.png'
    },
    {
      'name': 'Dr. Someone',
      'specialty': 'Surgery Specialist',
      'image': 'assets//images/popular4.png'
    },
  ];

  final List<Map<String, dynamic>> categoryDoctors = [
    {
      'name': 'Dr. Pediatrician',
      'specialty': 'Specialist Cardiologist',
      'image': 'assets/images/popular5.png',
      'rating': 2.4,
      'views': 2475,
      'liked': true
    },
    {
      'name': 'Dr. Mistry Brick',
      'specialty': 'Specialist Dentist',
      'image': 'assets/images/popular6.png',
      'rating': 2.8,
      'views': 2893,
      'liked': false
    },
    {
      'name': 'Dr. Ether Wall',
      'specialty': 'Specialist Cancer',
      'image': 'assets/images/popular7.png',
      'rating': 2.7,
      'views': 2754,
      'liked': true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/baground.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 30,
                    ),
                  )
                ],
              ),
              TextField(
                controller: _searchcon,
                decoration: InputDecoration(
                  hintText: "Search...",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: _searchcon.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.close, color: Colors.black),
                          onPressed: () {
                            setState(() {
                              _searchcon.clear();
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
              Text('Popular Doctor',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularDoctors.length,
                  itemBuilder: (context, index) {
                    return DoctorCard(popularDoctors[index]);
                  },
                ),
              ),
              SizedBox(height: 20),
              Text('Category',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: categoryDoctors.length,
                  itemBuilder: (context, index) {
                    return CategoryDoctorCard(categoryDoctors[index]);
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
  final Map<String, String> doctor;
  DoctorCard(this.doctor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(doctor['image']!,
                height: 100, width: 120, fit: BoxFit.cover),
          ),
          SizedBox(height: 5),
          Text(doctor['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(doctor['specialty']!,
              style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}

class CategoryDoctorCard extends StatelessWidget {
  final Map<String, dynamic> doctor;
  CategoryDoctorCard(this.doctor);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(doctor['image']!,
              width: 50, height: 50, fit: BoxFit.cover),
        ),
        title: Text(doctor['name']!,
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle:
            Text(doctor['specialty']!, style: TextStyle(color: Colors.grey)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 16),
                Text('${doctor['rating']}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Text('(${doctor['views']} views)',
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
