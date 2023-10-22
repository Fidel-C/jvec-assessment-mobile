import 'package:contactapp/screens/add_contact.dart';
import 'package:contactapp/screens/contact_detail_screen.dart';
import 'package:contactapp/services/contact_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/contact.dart';

class ContactListScreen extends StatelessWidget {
  final ContactsService controller = Get.find<ContactsService>();

  @override
  Widget build(BuildContext context) {
    // Create a reactive variable to monitor changes in the contact list
    final contactList = controller.contacts;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Contacts'),
        centerTitle: true,
        actions: [
          Obx(() {
            if (controller.authController.loggedIn.value) {
              return IconButton(
                onPressed: () {
                  controller.authController.logout();
                },
                icon: Icon(Icons.logout),
              );
            } else {
              return SizedBox.shrink();
            }
          }),
          IconButton(
              onPressed: () {
                controller.fetchContacts();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Obx(() {
        if (contactList.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: contactList.length,
          itemBuilder: (context, index) {
            final contact = contactList[index];
            return ListTile(
              leading: Icon(Icons.person),
              title: Text("${contact.firstName} ${contact.lastName}"),
              subtitle: Text(contact.phoneNumber),
              trailing: Icon(Icons.phone),
              onTap: () {
                Get.to(ContactDetailScreen(contact: contact));
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(AddContactScreen());
        },
      ),
    );
  }
}
