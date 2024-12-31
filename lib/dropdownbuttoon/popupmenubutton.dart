import 'package:flutter/material.dart';

class Popupmenubutton extends StatefulWidget {
  const Popupmenubutton({super.key});

  @override
  State<Popupmenubutton> createState() => _PopupmenubuttonState();
}

class _PopupmenubuttonState extends State<Popupmenubutton> {
  int selectdmenu = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Popup Menu Button'),
        ),
        body: PopupMenuButton<int>(onSelected: (int result) {
          setState(() {
            selectdmenu = result;
          });
        }, itemBuilder: (context) {
          return <PopupMenuItem<int>>[
            PopupMenuItem<int>(
              value: 1,
              child: ListTile(
                leading: Icon(Icons.info),
                title: Text('About Us'),
              ),
            ),
            PopupMenuItem<int>(
              value: 2,
              child: ListTile(
                leading: Icon(Icons.phone),
                title: Text('Contact Us'),
              ),
            ),
            PopupMenuItem<int>(
              value: 1,
              child: ListTile(
                leading: Icon(Icons.info),
                title: Text('About Us'),
              ),
            ),
            PopupMenuItem<int>(
              value: 3,
              child: ListTile(
                leading: Icon(Icons.privacy_tip),
                title: Text('Privacy Policy'),
              ),
            )
          ];
        }));
  }
}
