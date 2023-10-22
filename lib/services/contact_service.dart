// contacts_service.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/contact.dart';
import 'auth_service.dart';

class ContactsService extends GetxController {
  final String baseUrl = "http://localhost:8000";
  RxList<Contact> contacts = <Contact>[].obs;
  AuthService authController = Get.put(AuthService());

  // Access the access token from AuthServiceController
  String getAccessToken() {
    return authController.token.value['access'];
  }

  Future<bool> fetchContacts() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/contacts/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${getAccessToken()}"
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        contacts.value = data.map((e) => Contact.fromMap(e)).toList();

        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> createContact(
      String firstName, String lastName, String phoneNumber) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/contacts/'),
        body: jsonEncode({
          'first_name': firstName,
          'last_name': lastName,
          'phone_number': phoneNumber,
        }),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer ${getAccessToken()}"
        },
      );

      if (response.statusCode == 201) {
        fetchContacts();
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  Future<bool> updateContact(
      int? id, String firstName, String lastName, String phoneNumber) async {
    try {
      final response = await http.patch(
        Uri.parse('$baseUrl/contacts/$id/update/'),
        body: json.encode({
          'first_name': firstName,
          'last_name': lastName,
          'phone_number': phoneNumber,
        }),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${getAccessToken()}"
        },
      );

      if (response.statusCode == 200) {
        fetchContacts(); // Refresh the contacts list
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteContact(Contact? contact) async {
    try {
      print(contact?.id);
      final response = await http.delete(
        Uri.parse('$baseUrl/contacts/${contact!.id}/delete/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${getAccessToken()}"
        },
      );

      if (response.statusCode == 204) {
        fetchContacts(); // Refresh the contacts list
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
