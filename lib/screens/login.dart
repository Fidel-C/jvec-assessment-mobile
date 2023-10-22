import 'package:contactapp/screens/contact_list_screen.dart';
import 'package:contactapp/screens/register.dart';
import 'package:contactapp/services/auth_service.dart';
import 'package:contactapp/services/contact_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  String username = '';
  String password = '';

  LoginScreen({super.key});
   AuthService authController = Get.put(AuthService());
  ContactsService contactsController = Get.put(ContactsService());

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock,
                size: 100.0,
                color: Colors.brown,
              ),
              SizedBox(height: 20.0),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                onChanged: (val) {
                  username = val;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (val) {
                    password = val;
                  }),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  var res = await authController.login(username, password);
                  if (res == true) {
                    await contactsController.fetchContacts();
                    Get.off(ContactListScreen());
                  } else {
                    Get.snackbar('Invalid Login Credentials',
                        'Incorrect username or password',
                        colorText: Colors.white, backgroundColor: Colors.red);
                  }
                },
                child: Text('Login'),
              ),
              SizedBox(
                height: 40,
              ),
              TextButton(
                  onPressed: () {
                    Get.to(RegistrationScreen());
                  },
                  child: const Text('Yet to Signup? Regster here!'))
            ],
          ),
        ),
      ),
    );
  }
}
