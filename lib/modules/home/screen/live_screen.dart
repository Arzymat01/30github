import 'package:flutter/material.dart';

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
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildCommentItem(
                    'Everhart Tween', 'Thanks for sharing doctor', '❤️'),
                _buildCommentItem('Bonebrake Mash',
                    'They treat immune system disorders', '💬'),
                _buildCommentItem(
                    'Handler Wack', 'This is the largest directory', '👍'),
                _buildCommentItem(
                    'Comfort Love', 'Depending on their education', '💡'),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon:
                        const Icon(Icons.chat_bubble, color: Colors.green),
                    hintText: 'Add a Comment...',
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentItem(String username, String comment, String emoji) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/user.png'),
            radius: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  comment,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Text(emoji, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
