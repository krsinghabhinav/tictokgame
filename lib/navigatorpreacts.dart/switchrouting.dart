import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    NavigatorScreen(navigatorKey: GlobalKey<NavigatorState>(), tabName: 'Home'),
    NavigatorScreen(
        navigatorKey: GlobalKey<NavigatorState>(), tabName: 'Search'),
    NavigatorScreen(
        navigatorKey: GlobalKey<NavigatorState>(), tabName: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class NavigatorScreen extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabName;

  NavigatorScreen({required this.navigatorKey, required this.tabName});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (settings) {
        Widget page;
        if (settings.name == '/') {
          page = MainTabScreen(tabName: tabName);
        } else if (settings.name == '/details') {
          page = DetailsScreen(tabName: tabName);
        } else {
          page = MainTabScreen(tabName: tabName);
        }
        return MaterialPageRoute(builder: (context) => page);
      },
    );
  }
}

class MainTabScreen extends StatelessWidget {
  final String tabName;

  MainTabScreen({required this.tabName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$tabName Tab'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/details');
          },
          child: Text('Go to Details in $tabName Tab'),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final String tabName;

  DetailsScreen({required this.tabName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details in $tabName Tab'),
      ),
      body: Center(
        child: Text(
          'This is the details screen for the $tabName tab.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
