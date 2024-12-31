import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.screen_rotation),
            title: Text('Go to Screen 1'),
            onTap: () {
              Navigator.pushNamed(context, '/screen1');
            },
          ),
          ListTile(
            leading: Icon(Icons.screen_search_desktop),
            title: Text('Go to Screen 2'),
            onTap: () {
              Navigator.pushNamed(context, '/screen2');
            },
          ),
          ListTile(
            leading: Icon(Icons.screen_lock_portrait),
            title: Text('Go to Screen 3'),
            onTap: () {
              Navigator.pushNamed(context, '/screen3');
            },
          ),
        ],
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
      ),
      body: Center(
        child: Text(
          'This is Screen 1',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
      ),
      body: Center(
        child: Text(
          'This is Screen 2',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 3'),
      ),
      body: Center(
        child: Text(
          'This is Screen 3',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
