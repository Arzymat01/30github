import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectTimeScreen extends StatefulWidget {
  const SelectTimeScreen({super.key});

  @override
  State<SelectTimeScreen> createState() => _SelectTimeScreenState();
}

class _SelectTimeScreenState extends State<SelectTimeScreen> {
  bool isLiked = false; // Класстын ичинде жарыялоо керек

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/baground.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Card(
                  color: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/2.png'),
                    ),
                    title: Text('Dr. Shruti Kedia'),
                    subtitle: Text('Upasana Dental Clinic, salt lake'),
                    trailing: IconButton(
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isLiked =
                              !isLiked; // Бул жерде `setState` туура иштейт
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _dateButton('Today, 23 Feb', false),
                    _dateButton('Tomorrow, 24 Feb', true),
                    _dateButton('Thu, 25 Feb', false),
                  ],
                ),
                SizedBox(height: 16),
                Center(child: Text('No slots available')),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0EBE7F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 90),
                    child: Center(
                      child: Text('Next availability on Wed, 24 Feb',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Center(child: Text('OR')),
                SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xFF0EBE7F)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 90),
                    child: Text(
                      'Contact Clinic',
                      style: TextStyle(
                        color: Color(0xFF0EBE7F),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _dateButton(String text, bool isSelected) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        child: ElevatedButton(
          onPressed: isSelected ? () {} : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected ? Color(0xFF0EBE7F) : Colors.grey[300],
            foregroundColor: isSelected ? Colors.white : Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
