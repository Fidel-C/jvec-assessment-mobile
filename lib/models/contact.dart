import 'package:flutter/material.dart';

class Contact {
  final String first_name;
  final String last_name;
  final String phone_number;

  Contact(
      {required this.first_name,
      required this.last_name,
      required this.phone_number});

  fromJson(Map<String, dynamic> data) {
    return Contact(
        first_name: data['first_name'],
        last_name: data['last_name'],
        phone_number: data['phone_number']);
  }
}
                                                                                    