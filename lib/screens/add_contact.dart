// screens/add_contact_screen.dart

import 'package:contactapp/services/contact_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddContactScreen extends StatelessWidget {
  final _contactController = Get.find<ContactsService>();
  final firstName = ''.obs;
  final lastName = ''.obs;
  final phoneNumber = ''.obs;

  final _phoneNumberRehExp = RegExp(r'^[0-9]{10,14}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (val) {
                firstName.value = val;
              },
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              onChanged: (val) {
                lastName.value = val;
              },
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              onChanged: (val) {
                phoneNumber.value = val;
              },
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (_phoneNumberRehExp.hasMatch(phoneNumber.value)) {
                await _contactController.createContact(firstName.value, lastName.value, phoneNumber.value);
                  _contactController.fetchContacts();
                  Get.back();
                } else {
                  Get.snackbar('Error', 'Enter a valid phone number');
                }
                // Go back to the previous screen
              },
              child: Text('Save Contact'),
            ),
          ],
        ),
      ),
    );
  }
}
