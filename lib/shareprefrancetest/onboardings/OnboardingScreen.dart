import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  // List of onboarding pages
  final List<Widget> _pages = [
    _buildOnboardingPage('Welcome to the App!',
        'Discover new features and enjoy the experience.', Icons.star),
    _buildOnboardingPage('Stay Organized',
        'Keep all your notes and tasks in one place.', Icons.list),
    _buildOnboardingPage('Get Started Now',
        'Begin your journey by creating your first note!', Icons.check),
  ];

  // Create the content for each onboarding screen
  static Widget _buildOnboardingPage(
      String title, String description, IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 100, color: Colors.blue),
        SizedBox(height: 20),
        Text(title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(description,
            textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
      ],
    );
  }

  // Check if the user has completed onboarding
  _onboardingComplete() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(
        'completed_onboarding', true); // Store that onboarding is complete
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Onboarding')),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return _pages[index];
        },
      ),
      bottomSheet: _currentPage == _pages.length - 1
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  _onboardingComplete(); // Save flag that onboarding is complete
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: Text('Get Started'),
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _pageController.animateToPage(
                        _currentPage + 1,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    child: Text('Next'),
                  ),
                ],
              ),
            ),
    );
  }
}
