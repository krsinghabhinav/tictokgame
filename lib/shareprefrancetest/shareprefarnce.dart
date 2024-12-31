import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final bool isDarkMode;
  final Color themeColor;
  final ValueChanged<Color> onThemeColorChanged;
  final ValueChanged<bool> onDarkModeToggled;

  const SettingsPage({
    Key? key,
    required this.isDarkMode,
    required this.themeColor,
    required this.onThemeColorChanged,
    required this.onDarkModeToggled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: themeColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: isDarkMode,
            onChanged: onDarkModeToggled,
            secondary: const Icon(Icons.dark_mode),
          ),
          const SizedBox(height: 16),
          const Text(
            'Choose Theme Color',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildColorCircle(Colors.blue, context),
              _buildColorCircle(Colors.red, context),
              _buildColorCircle(Colors.green, context),
              _buildColorCircle(Colors.purple, context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildColorCircle(Color color, BuildContext context) {
    return GestureDetector(
      onTap: () => onThemeColorChanged(color),
      child: CircleAvatar(
        backgroundColor: color,
        radius: 24,
        child: themeColor == color
            ? const Icon(Icons.check, color: Colors.white)
            : null,
      ),
    );
  }
}
