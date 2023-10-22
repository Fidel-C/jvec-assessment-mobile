import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/contact.dart';
import 'contact_list_screen.dart';

class EditContactScreen extends StatefulWidget {
  final Contact? contact;
  final Function(Contact) onContactUpdated;

  EditContactScreen({required this.contact, required this.onContactUpdated});

  @override
  _EditContactScreenState createState() => _EditContactScreenState();
}

class _EditContactScreenState extends State<EditContactScreen> {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController phoneNumberController;

  _EditContactScreenState()
      : firstNameController = TextEditingController(),
        lastNameController = TextEditingController(),
        phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the text controllers with the current contact's information
    firstNameController.text = widget.contact!.firstName;
    lastNameController.text = widget.contact!.lastName;
    phoneNumberController.text = widget.contact!.phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final String newFirstName = firstNameController.text;
                final String newLastName = lastNameController.text;
                final String newPhoneNumber = phoneNumberController.text;

                // Check if all fields are filled
                if (newFirstName.isNotEmpty &&
                    newLastName.isNotEmpty &&
                    newPhoneNumber.isNotEmpty) {
                  final updatedContact = Contact(
                    firstName: newFirstName,
                    lastName: newLastName,
                    phoneNumber: newPhoneNumber,
                  );

                  widget.onContactUpdated(
                      updatedContact); // Callback to notify contact updated
                    Get.to(ContactListScreen()); // Return to the previous screen
                } else {
                  // Show an error message or validation message if any field is empty
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please fill in all fields.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
