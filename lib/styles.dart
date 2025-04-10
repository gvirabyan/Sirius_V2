import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle headline = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Color(0xFF252591),
  );
  static const TextStyle descripStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static const TextStyle myStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w100, // Thin weight
    color: Colors.black87,
    fontFamily: 'Roboto Thin', // Correct way
  );
  static const TextStyle myStyle2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const TextStyle inputHint = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  static ButtonStyle outlinedButton = ElevatedButton.styleFrom(
    foregroundColor: Colors.deepPurple,
    side: const BorderSide(color: Colors.deepPurple),

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // паддинг
  );

  static ButtonStyle filledButtonPurple = ElevatedButton.styleFrom(
    backgroundColor: Colors.deepPurple,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
  );
  static  InputDecoration inputDecorationStyle = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: const BorderSide(color: Colors.grey, width: 1),
    ),
  );

}


