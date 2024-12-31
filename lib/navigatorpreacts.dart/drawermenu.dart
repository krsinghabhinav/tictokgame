import 'package:flutter/material.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          'Welcome to the Home Screen!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class Scr1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          'This is Screen 1',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class Scr2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          'This is Screen 2',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class Scr3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 3'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          'This is Screen 3',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.screen_share),
            title: Text('Screen 1'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/scr1');
            },
          ),
          ListTile(
            leading: Icon(Icons.screen_lock_portrait),
            title: Text('Screen 2'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/scr2');
            },
          ),
          ListTile(
            leading: Icon(Icons.screen_rotation),
            title: Text('Screen 3'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/scr3');
            },
          ),
        ],
      ),
    );
  }
}
