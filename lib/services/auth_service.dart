import 'package:http/http.dart' as http;
import 'package:untitled9/models/user_model.dart';

class AuthService {
  static const String _baseUrl = "http://194.164.76.172:3000/api/customer";

  Future<int> register(UserModel newUser) async {
    final url = Uri.parse("$_baseUrl/register");

    var request = http.MultipartRequest("POST", url)
      ..fields['fullname'] = newUser.fullName
      ..fields['phone_number'] = newUser.phoneNumber
      ..fields['email'] = newUser.email
      ..fields['password'] = newUser.password
      ..fields['confirm_password'] = newUser.confirmPassword
      ..headers.addAll({
        "Accept": "application/json",
      });

    try {
      print("🚀 Отправляем запрос...");
      print("Request URL: $url");
      print("Request Fields: ${request.fields}");

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: $responseBody");

      if (response.statusCode == 201 || response.statusCode == 200) {
        return 200;
      } else if (response.statusCode == 422) {
        print("Validation Errors: ${responseBody}");
        return 422;
      } else {
        print("❌ Ошибка сервера: ${response.statusCode}");
        return 500;
      }
    } catch (e) {
      print("⚠️ Exception: $e");
      return 500;
    }
  }
}
