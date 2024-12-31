import 'package:flutter/material.dart';

class CustomAnimatedButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomAnimatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: _isPressed ? Colors.blueAccent : Colors.blue,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: _isPressed
              ? [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(2, 2),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 8,
                    offset: const Offset(4, 4),
                  ),
                ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: Text(
          widget.text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
