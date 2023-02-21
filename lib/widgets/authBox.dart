import 'dart:ui';

import 'package:flutter/material.dart';

class AuthBox extends StatelessWidget {
  final String placeHolder;
  final bool coloured;
  final VoidCallback onPressed;
  const AuthBox(
      {required this.placeHolder,
      required this.onPressed,
      this.coloured = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: coloured
                ? Colors.blueAccent[700]
                : Colors.grey[700]!.withOpacity(0.5)),
        child: Center(
          child: Text(
            placeHolder,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
