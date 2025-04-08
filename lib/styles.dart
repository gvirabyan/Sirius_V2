import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle headline = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blueAccent,
  );

  static const TextStyle myStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w100, // Thin weight
    color: Colors.black87,
    fontFamily: 'Roboto Thin', // Correct way
  );
}
