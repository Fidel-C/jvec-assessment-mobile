import 'package:contactapp/models/contact.dart';
import 'package:contactapp/screens/contact_list_screen.dart';
import 'package:contactapp/screens/edit_contact.dart';
import 'package:contactapp/services/contact_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactDetailScreen extends StatelessWidget {
  final Contact? contact;
  ContactsService contactsController = Get.find<ContactsService>();

  ContactDetailScreen({Key? key, required this.contact}) : super(key: key);

  Future<void> _confirmDelete(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button for close
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete this contact?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                // Handle delete action here
                contactsController
                    .deleteContact(contact); // Adjust this to your logic
                Navigator.of(dialogContext).pop();
                Get.back();
                // Close the dialog
                // Optionally, navigate back to the previous screen or perform any necessary actions.
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: contact != null
          ? Column(
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        size: 150,
                        color: Colors.brown,
                      ),
                      SizedBox(height: 16),
                      Text(
                        '${contact!.firstName} ${contact!.lastName}',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        contact!.phoneNumber,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        updated(Contact? val) {
                          contactsController.updateContact(contact!.id,
                              val!.firstName, val.lastName, val.phoneNumber);
                        
                        }

                        Get.to(EditContactScreen(
                            contact: contact, onContactUpdated: updated));
                      },
                      icon: Icon(Icons.edit),
                    ),
                    SizedBox(width: 16),
                    IconButton(
                      onPressed: () {
                        _confirmDelete(context); // Show the confirmation dialog
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ],
            )
          : Center(
              child: Text("No contact selected."),
            ),
    );
  }
}
