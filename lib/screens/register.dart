import 'package:contactapp/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:contactapp/services/auth_service.dart';

class RegistrationScreen extends StatelessWidget {
  final AuthService authService = Get.find<AuthService>();

  @override
  Widget build(BuildContext context) {
    final username = ''.obs;
    final firstName = ''.obs;
    final lastName = ''.obs;
    final email = ''.obs;
    final password = ''.obs;
    final confirmPassword = ''.obs;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              onChanged: (value) {
                username.value = value;
              },
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextFormField(
              onChanged: (value) {
                firstName.value = value;
              },
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextFormField(
              onChanged: (value) {
                lastName.value = value;
              },
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextFormField(
              onChanged: (value) {
                email.value = value;
              },
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              onChanged: (value) {
                password.value = value;
              },
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextFormField(
              onChanged: (value) {
                confirmPassword.value = value;
              },
              decoration: InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Handle registration logic here
                // You can use the values of username, firstName, lastName, email, password, and confirmPassword.
                if (username.isNotEmpty &&
                    firstName.isNotEmpty &&
                    lastName.isNotEmpty &&
                    email.isNotEmpty &&
                    password.isNotEmpty &&
                    confirmPassword.isNotEmpty) {
                  // Perform registration logic here

                  // After registration, you can navigate to the login screen
                  var res = await authService.register(
                      username.value,
                      firstName.value,
                      lastName.value,
                      email.value,
                      password.value,
                      confirmPassword.value);
                  if (res == true) {
                    Get.snackbar(
                        'Successful', 'Registration Successful, you may login.');
                    Get.to(LoginScreen());
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Please fill in all fields.Or try a different email,username and password.'),
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
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
