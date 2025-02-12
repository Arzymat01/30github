import 'package:doctor_consultant/components/my_bottom.dart';
import 'package:doctor_consultant/modules/auth/login/screen/login.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/splash1.png",
      "title": "Find Trusted Doctors",
      "description":
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old."
    },
    {
      "image": "assets/images/splash2.png",
      "title": "Choose Best Doctors",
      "description":
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old."
    },
    {
      "image": "assets/images/splash3.png",
      "title": "Easy Appointments",
      "description":
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old."
    },
  ];

  void _nextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/baground.png',
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _onboardingData.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return OnboardingPage(
                      image: _onboardingData[index]["image"]!,
                      title: _onboardingData[index]["title"]!,
                      description: _onboardingData[index]["description"]!,
                      onNext: _nextPage,
                      onSkip: _previousPage,
                      isLastPage: index == _onboardingData.length - 1,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final VoidCallback onNext;
  final VoidCallback onSkip;
  final bool isLastPage;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.onNext,
    required this.onSkip,
    required this.isLastPage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Positioned(
                left: 0,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Color(0xFF0EBE7F),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              ClipOval(
                child: Image.asset(
                  image,
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: 295,
            height: 54,
            child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0EBE7F),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                isLastPage ? "Get Started" : "Next",
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: onSkip,
            child: const Text(
              "Skip",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
