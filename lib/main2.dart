import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictokgame/main.dart';
import 'package:tictokgame/shareprefrancetest/test2.dart';

void main() {
  runApp(ThemeApphanges());
}

class ThemeApphanges extends StatefulWidget {
  const ThemeApphanges({super.key});

  @override
  State<ThemeApphanges> createState() => _ThemeApphangesState();
}

class _ThemeApphangesState extends State<ThemeApphanges> {
  bool isDarkMode = false;
  Color themeColor = Colors.blue;
  @override
  void initState() {
    super.initState();
    loadingPrefrance();
  }

  Future<void> saveSharePrefarence(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();

    if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    }
  }

  void updateTheme(Color color) {
    setState(() {
      themeColor = color;
      saveSharePrefarence('themeColor', color.value);
    });
  }

  void toggleTheme(bool darkmode) {
    setState(() {
      isDarkMode = darkmode;
      saveSharePrefarence('darkMode', darkmode);
    });
  }

  Future<void> loadingPrefrance() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('darkMode') ?? false;
      // themeColor = Color(prefs.getInt('themeColor') ?? 0xFF2196F3);

      int colorValue = prefs.getInt('themeColor') ?? 0xFF2196F3;
      if (colorValue != null) {
        themeColor = Color(colorValue);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme App',
      theme: ThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        primaryColor: themeColor,
      ),
      home: settingtheme(
          isDarkMode: isDarkMode,
          themeColor: themeColor,
          onColorChanged: updateTheme,
          onDarkModeChanged: toggleTheme),
    );
  }
}
