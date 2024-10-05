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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_screen_bg.jpeg'),
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
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                //Gambar dengan Hero Widget
                const Hero(
                  tag: 'loginImage',
                  child: CircleAvatar(
                    radius: 85,
                    backgroundImage: AssetImage('lib/Anime Hijau.jpg'),
                  ),
                ),
                const SizedBox(height: 50),
                const Text(
                  "Email/Phone Number",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Ubah menjadi warna hitam
                  ),
                ),
                const SizedBox(height: 5),
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Enter your Email/Phone Number!",
                    filled: true,
                    fillColor: Colors
                        .white, // Mengganti dengan warna putih untuk teks field
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Ubah menjadi warna hitam
                  ),
                ),
                const SizedBox(height: 5),
                TextField(
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: "Enter your Password!",
                    filled: true,
                    fillColor: Colors
                        .white, // Mengganti dengan warna putih untuk teks field
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.black, // Ubah menjadi warna hitam
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
                //login button
                const SizedBox(height: 30),
                const Center(
                  child: CustomButton(
                    buttonText: 'LOGIN',
                    destination: HomeScreen(showAnimation: true),
                    color: Colors.teal, // Ganti dengan warna teal
                    usePushReplacement: true,
                    borderRadius: 18,
                    transitionType: PageTransitionType.fade,
                  ),
                ),

                //klik register
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
                          color: Colors.teal,
                          decoration: TextDecoration
                              .underline, // Membuat teks "Register" menjadi underline
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
