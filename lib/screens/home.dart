import 'package:contactapp/screens/contact_list_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Container(
              child: Icon(
                Icons.book,
                color: Colors.brown,
                size: 200,
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ContactList();
                }));
              },
              child: const Text('Contacts',style: TextStyle(color: Colors.brown),)
              )
        ],
      ),
    );
  }
}
