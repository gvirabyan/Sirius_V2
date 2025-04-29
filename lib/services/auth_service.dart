import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled9/models/user_model.dart';
import 'package:untitled9/screens/sign_up_screen.dart';

class AuthService {
  static const String _baseUrl = "http://194.164.76.172:3001/api/client/";
  static String token = '';

  Future<int> register(UserModel newUser) async {
    final url = Uri.parse("$_baseUrl/register");

    final body = jsonEncode({
      "name": newUser.name,
      "surname": newUser.surname,
      "phone_number": newUser.phoneNumber,
      "email": newUser.email,
      "password": newUser.password,
      "confirm_password": newUser.confirmPassword,
    });

    try {
      print("📤 Отправка запроса...");
      print("URL: $url");
      print("Body: $body");

      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: body,
      );

      print("📥 Статус ответа: ${response.statusCode}");
      print("Ответ: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        final String token = jsonData['auth_token'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        return 200;
      } else if (response.statusCode == 422) {
        return 422;
      } else {
        return 500;
      }
    } catch (e) {
      print("⚠️ Ошибка запроса: $e");
      return 500;
    }
  }

  Future<int> login(String email, String password) async {
    final url = Uri.parse("http://194.164.76.172:3001/api/login");

    final body = jsonEncode({
      "email": email,
      "password": password,
    });

    try {
      print("📤 Login запрос отправлен...");
      print("URL: $url");
      print("Body: $body");

      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: body,
      );

      print("📥 Status: ${response.statusCode}");
      print("Response: ${response.body}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        final String token = jsonData['auth_token'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        print(token);
        return 200;
      } else if (response.statusCode == 401) {
        print("❌ Неверный логин или пароль");
        return 401;
      } else if (response.statusCode == 422) {
        print("⚠️ Ошибка валидации");
        return 422;
      } else {
        print("⚠️ Другая ошибка: ${response.statusCode}");
        return 500;
      }
    } catch (e) {
      print("❗ Исключение: $e");
      return 500;
    }
  }

  Future<void> logoutUser(context) async {
    final url = Uri.parse('http://194.164.76.172:3001/api/logout');
    print(token);
    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200 || true) {
        print('Logout successful');
        final prefs = await SharedPreferences.getInstance();
        prefs.remove('token');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignUpScreen()),
        );
      } else {
        print('Logout failed: ${response.body}');
      }
    } catch (e) {
      print('Logout error: $e');
    }
  }

  Future<bool> changePassword({
    required String email,
    required String newPassword,
    required String confirmPassword,
  }) async {
    final url = Uri.parse('http://194.164.76.172:3001/api/new-password');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'token': token,
          'email': email,
          'password': newPassword,
          'confirm_password': confirmPassword,
        }),
      );

      if (response.statusCode == 200) {
        print('Password changed successfully');
        return true;
      } else {
        print('Failed to change password: ${response.body}');
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
