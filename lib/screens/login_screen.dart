import 'package:flutter/material.dart';
import 'package:uts_mobile_banking/widgets/page_transition.dart';
import 'register_screen.dart';
import 'home_screen.dart';
import '../widgets/custom_button.dart';
import 'package:flutter/gestures.dart';

class LoginScreen extends StatefulWidget {
  final bool registrationSuccessful;

  const LoginScreen({super.key, this.registrationSuccessful = false});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true; //awal hidden text di set true

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF7EBDA6),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_screen_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                if (widget.registrationSuccessful)
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      'Registration Successful! Please log in.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                // Gambar dengan Hero Widget
                const Hero(
                  tag: 'loginImage',
                  child: CircleAvatar(
                    radius: 85,
                    backgroundImage:
                        AssetImage('assets/images/Anime Hijau.jpg'),
                  ),
                ),
                const SizedBox(height: 50),

                // Kotak input Email/No HP dan Password
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F2D6),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Email/Phone Number",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: "Enter your Email/Phone Number!",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          labelText: "Enter your Password!",
                          filled: true,
                          fillColor: Colors.white,
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Login button
                const SizedBox(height: 30),
                const Center(
                  child: CustomButton(
                    buttonText: 'Login',
                    textColor: Colors.white,
                    destination: HomeScreen(showAnimation: true),
                    color: Color(0xFF7EBDA6),
                    usePushReplacement: true,
                    borderRadius: 18,
                    transitionType: PageTransitionType.fade,
                  ),
                ),

                // Klik register
                const SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    text: "Don't have an account?",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: ' Register',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF7EBDA6),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterScreen()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
