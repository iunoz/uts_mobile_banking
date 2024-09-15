import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'home_screen.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  final bool registrationSuccessful;

  const LoginScreen({super.key, this.registrationSuccessful = false});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true; //awal hidden text di set true

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
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.registrationSuccessful)
                const Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    'Registration Successful! Please log in.',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              const Text(
                "Email/Phone Number",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  labelText: "Enter your Email/Phone Number!",
                  filled: true,
                  fillColor: const Color.fromARGB(255, 192, 248, 214),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "Password",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              TextField(
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: "Enter your Password!",
                  filled: true,
                  fillColor: const Color.fromARGB(255, 192, 248, 214),
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Center(
                child: CustomButton(
                  buttonText: 'LOGIN',
                  destination: const HomeScreen(),
                  color: Colors.greenAccent,
                  usePushReplacement: true,
                ),
              ),
              const SizedBox(height: 25),
              Center(
                child: CustomButton(
                  buttonText: "Don't Have Any Account? Register",
                  destination: const RegisterScreen(),
                  color: Colors.greenAccent,
                  usePushReplacement: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
