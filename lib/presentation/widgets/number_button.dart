import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const NumberButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(24.0),
          textStyle: TextStyle(fontSize: 24),
        ),
        child: Text(label),
      ),
    );
  }
}
