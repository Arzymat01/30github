import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorDetailsPage extends StatelessWidget {
  const DoctorDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title:
            const Text('Doctor Details', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            NetworkImage('https://via.placeholder.com/150'),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Dr. Pediatrician',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            const Text('Specialist Cardiologist',
                                style: TextStyle(color: Colors.grey)),
                            const SizedBox(height: 8),
                            Row(
                              children: const [
                                Icon(Icons.star, color: Colors.amber, size: 20),
                                Icon(Icons.star, color: Colors.amber, size: 20),
                                Icon(Icons.star, color: Colors.amber, size: 20),
                                Icon(Icons.star_half,
                                    color: Colors.amber, size: 20),
                                Icon(Icons.star_border,
                                    color: Colors.amber, size: 20),
                                SizedBox(width: 10),
                                Text('\$28.00/hr',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.green)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(FontAwesomeIcons.heart,
                            color: Colors.red),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildInfoCard('100', 'Running'),
                  _buildInfoCard('500', 'Ongoing'),
                  _buildInfoCard('700', 'Patient'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Services',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1. Patient care should be the number one priority.'),
                  Text(
                      '2. If you run your practice, you know how frustrating.'),
                  Text('3. That’s why some of appointment reminder system.'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[200],
                ),
                child: const Center(
                  child: Text('Google Map Placeholder'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String count, String label) {
    return Column(
      children: [
        Text(count,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
