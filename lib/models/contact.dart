// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// contact_model.dart
class Contact {
  final int? id;
  final String firstName;
  final String lastName;
  final String phoneNumber;

  Contact({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'] != null ? map['id'] as int : null,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      phoneNumber: map['phone_number'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) => Contact.fromMap(json.decode(source) as Map<String, dynamic>);
}
