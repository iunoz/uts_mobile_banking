import 'package:flutter/material.dart';
import 'package:uts_mobile_banking/widgets/page_transition.dart';
import '../widgets/custom_button.dart';
import 'login_screen.dart';
import '../widgets/animation_lottie.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true; //buat hidden text
  bool _obscureConfirmPassword = true;
  bool _isSuccess = false; //track success state

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    setState(() {
      _isSuccess = true; //update success state
    });

    //delay sampe animasi selesai
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Register",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF7EBDA6),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login_screen_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 20.0,
                  ), //jarak dari sisi layar
                  padding: const EdgeInsets.all(16.0), //padding internal kotak
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            "Full Name",
                            style: TextStyle(
                                color: Color.fromARGB(255, 97, 97, 97),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Enter your full name!",
                            labelStyle: TextStyle(
                              fontSize: 14,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your full name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 25),
                        const Center(
                          child: Text(
                            "Phone Number",
                            style: TextStyle(
                                color: Color.fromARGB(255, 97, 97, 97),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: "Enter your Phone Number!",
                            labelStyle: TextStyle(
                              fontSize: 14,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            //jika kosong error
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            //cek jika phone number itu angka
                            if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return 'Please enter a valid phone number (digits only)';
                            }
                            if (value.length < 11 || value.length > 13) {
                              return 'Phone number must be between 11 and 13 digits';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 25),
                        const Center(
                          child: Text(
                            "Email",
                            style: TextStyle(
                                color: Color.fromARGB(255, 97, 97, 97),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: "Enter your Email!",
                            labelStyle: TextStyle(
                              fontSize: 14,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            //jika kosong error
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            //pengecekan penulisan email
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 25),
                        const Center(
                          child: Text(
                            "Password",
                            style: TextStyle(
                                color: Color.fromARGB(255, 97, 97, 97),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            labelText: "Enter your Password!",
                            labelStyle: const TextStyle(
                              fontSize: 14,
                            ),
                            filled: true,
                            fillColor: Colors.white,
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
                            border: const OutlineInputBorder(),
                          ),
                          validator: (value) {
                            //jika pw kosong
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            //panjang gabole kurang dr 6
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 25),
                        const Center(
                          child: Text(
                            "Confirm Password",
                            style: TextStyle(
                              color: Color.fromARGB(255, 97, 97, 97),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: _obscureConfirmPassword,
                          decoration: InputDecoration(
                            labelText: "Re-enter your Password!",
                            labelStyle: const TextStyle(
                              fontSize: 14,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: IconButton(
                              icon: Icon(_obscureConfirmPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _obscureConfirmPassword =
                                      !_obscureConfirmPassword;
                                });
                              },
                            ),
                            border: const OutlineInputBorder(),
                          ),
                          validator: (value) {
                            //tdk bole kosong confirmpassword
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            //disamain ama pw
                            if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 25),
                        Center(
                          child: CustomButton(
                            buttonText: 'Register',
                            destination:
                                const LoginScreen(), // Set the destination
                            color: const Color(0xFF7EBDA6),
                            borderRadius: 18,
                            textColor: Colors.white,
                            transitionType: PageTransitionType.slideRight,
                            customNavigation: () {
                              if (_formKey.currentState!.validate()) {
                                //ketika form valid maka handle register jalan
                                _handleRegister();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          //tampilin lottie jika sukses
          if (_isSuccess)
            const Center(
              child: AnimationLottie(
                animationPath: 'assets/animations/goodgood.json',
                width: 250,
                height: 250,
              ),
            ),
        ],
      ),
    );
  }
}
