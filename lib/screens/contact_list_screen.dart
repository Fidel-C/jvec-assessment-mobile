import 'package:contactapp/screens/contact_detail_screen.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Contacts'),
        elevation: 0,
        backgroundColor: Colors.brown,
      ),
      body: Container(
        child: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.person),
            title: Text(index.toString()),
            trailing: IconButton(
              icon: const Icon(Icons.more),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ContactDetail();
                }));
              },
            ),
            style: ListTileStyle.drawer,
          );

        },
        separatorBuilder: (context, index) {
          return Divider(height: 20,color: Colors.grey,);
        },
        ),
      ),
    );
  }
}
