import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'shareprefrancetest/shareprefarnce.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;
  Color _themeColor = Colors.blue;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('isDarkMode') ?? false;
      int? colorValue = prefs.getInt('themeColor');
      if (colorValue != null) {
        _themeColor = Color(colorValue);
      }
    });
  }

  Future<void> _savePreferences(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    }
  }

  void _updateThemeColor(Color color) {
    setState(() {
      _themeColor = color;
      _savePreferences('themeColor', color.value);
    });
  }

  void _toggleDarkMode(bool isDarkMode) {
    setState(() {
      _isDarkMode = isDarkMode;
      _savePreferences('isDarkMode', isDarkMode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: _isDarkMode ? Brightness.dark : Brightness.light,
        primaryColor: _themeColor,
      ),
      home: SettingsPage(
        isDarkMode: _isDarkMode,
        themeColor: _themeColor,
        onThemeColorChanged: _updateThemeColor,
        onDarkModeToggled: _toggleDarkMode,
      ),
    );
  }
}
