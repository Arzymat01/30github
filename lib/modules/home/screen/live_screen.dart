import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorlifeScreen extends StatelessWidget {
  const DoctorlifeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/live.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 30,
            right: 20,
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/profil_live0.png'),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildCommentItem(
                  'Everhart Tween',
                  'Thanks for sharing doctor❤️',
                  'assets/images/profil_live1.png',
                ),
                _buildCommentItem(
                  'Bonebrake Mash',
                  'They treat immune system disorders',
                  'assets/images/profil_live2.png',
                ),
                _buildCommentItem(
                  'Handler Wack',
                  'This is the largest directory👍',
                  'assets/images/profil_live3.png',
                ),
                _buildCommentItem(
                  'Comfort Love',
                  'Depending on their education🙂',
                  'assets/images/profil_live4.png',
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Color(0xFF0EBE7E),
                          shape: BoxShape
                              .circle, // Контейнерди толугу менен тегерек кылат
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/messages.svg',
                        ),
                      ),
                      hintText: 'Add a Comment......',
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      suffixIcon: SizedBox(
                        child: SvgPicture.asset(
                          'assets/icons/emodzi.svg',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentItem(
    String username,
    String comment,
    String imagePath,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  comment,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
