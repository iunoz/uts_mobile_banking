import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'home_screen.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  final bool registrationSuccessful;

  const LoginScreen({super.key, this.registrationSuccessful = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "LOGIN",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (registrationSuccessful)
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Registration Successful! Please log in.',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            const CustomButton(
              buttonText: 'Register',
              destination: RegisterScreen(),
              color: Colors.greenAccent,
            ),
            const CustomButton(
              buttonText: 'Login',
              destination: HomeScreen(),
              color: Colors.greenAccent,
              usePushReplacement: true,
            ),
          ],
        ),
      ),
    );
  }
}
