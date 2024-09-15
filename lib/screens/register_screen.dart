import 'package:flutter/material.dart';
import '../widgets/custom_button.dart'; // Import CustomButton
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurePassword = true; //awal hidden text di set true
  bool _obscureConfirmPassword = true; //ini juga sama

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "REGISTER",
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
              const Text("Full Name",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              const TextField(
                decoration: InputDecoration(
                  labelText: "Enter your full name!",
                  filled: true,
                  fillColor: Color.fromARGB(255, 192, 248, 214),
                ),
              ),
              const SizedBox(height: 25),
              const Text("Phone Number",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              const TextField(
                decoration: InputDecoration(
                  labelText: "Enter your Phone Number!",
                  filled: true,
                  fillColor: Color.fromARGB(255, 192, 248, 214),
                ),
              ),
              const SizedBox(height: 25),
              const Text("Email",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              const TextField(
                decoration: InputDecoration(
                  labelText: "Enter your Email!",
                  filled: true,
                  fillColor: Color.fromARGB(255, 192, 248, 214),
                ),
              ),
              const SizedBox(height: 25),
              const Text("Password",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              TextField(
                obscureText:
                    _obscurePassword, //text jadi hidden karna di set true diawal
                decoration: InputDecoration(
                  labelText: "Enter your Password!",
                  filled: true,
                  fillColor: const Color.fromARGB(255, 192, 248, 214),
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword
                        ? Icons.visibility_off
                        : Icons
                            .visibility), //awal mula icon mata tertutup (jd text hidden)
                    onPressed: () {
                      setState(() {
                        _obscurePassword =
                            !_obscurePassword; //mengubah state jadi mata terbuka (text tdk hidden)
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text("Confirm Password",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              TextField(
                obscureText: _obscureConfirmPassword,
                decoration: InputDecoration(
                  labelText: "Re-enter your Password!",
                  filled: true,
                  fillColor: const Color.fromARGB(255, 192, 248, 214),
                  suffixIcon: IconButton(
                    icon: Icon(_obscureConfirmPassword
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Center(
                child: CustomButton(
                  buttonText: 'REGISTER',
                  destination: LoginScreen(
                    registrationSuccessful: true,
                  ),
                  color: Color.fromARGB(255, 192, 248, 214),
                  usePushAndRemoveUntil: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
