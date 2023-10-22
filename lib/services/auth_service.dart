// auth_service.dart
import 'dart:convert';
import 'package:contactapp/screens/login.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class AuthService extends GetxController {
  final String baseUrl = "http://localhost:8000";
  Rx<User?> user = Rx<User?>(null);
  Rx<bool> loggedIn = Rx<bool>(false);
  RxMap<String, dynamic> token = <String, dynamic>{}.obs;

  Future<bool> register(String username, String first_name, String last_name,
      String email, String password, String password2) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/accounts/register/'),
        body: json.encode({
          'username': username,
          'first_name': first_name,
          'last_name': last_name,
          'email': email,
          'password': password,
          'password2': password2
        }),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 201) {
        print(response.statusCode);
        return true;
      }
      return false;
    } catch (e) {
      Get.snackbar('error', e.toString());
      return false;
    }
  }

  Future<bool> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/accounts/token/'),
        body: json.encode({
          'username': username,
          'password': password,
        }),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        token.value = jsonDecode(response.body);

        loggedIn.value = true;

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  void logout() {
    token(null);
    loggedIn.value = false;
    Get.offAll(LoginScreen());
  }
}
