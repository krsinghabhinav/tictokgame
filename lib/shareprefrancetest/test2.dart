import 'package:flutter/material.dart';

class settingtheme extends StatefulWidget {
  final bool isDarkMode;
  final Color themeColor;
  final ValueChanged<Color> onColorChanged;
  final ValueChanged<bool> onDarkModeChanged;
  settingtheme({
    super.key,
    required this.isDarkMode,
    required this.themeColor,
    required this.onColorChanged,
    required this.onDarkModeChanged,
  });

  @override
  State<settingtheme> createState() => _settingthemeState();
}

class _settingthemeState extends State<settingtheme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Setting Theme'),
        ),
        body: ListView(
          children: [
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: widget.isDarkMode,
              onChanged: widget.onDarkModeChanged,
              secondary: const Icon(Icons.dark_mode),
            )
          ],
        ));
  }
}
