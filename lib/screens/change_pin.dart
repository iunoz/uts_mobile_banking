import 'package:flutter/material.dart';

class ChangePinScreen extends StatefulWidget {
  const ChangePinScreen({super.key});

  @override
  _ChangePinScreenState createState() => _ChangePinScreenState();
}

class _ChangePinScreenState extends State<ChangePinScreen> {
  final _oldPinController = TextEditingController();
  final _newPinController = TextEditingController();
  final _confirmPinController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _oldPinController.dispose();
    _newPinController.dispose();
    _confirmPinController.dispose();
    super.dispose();
  }

  void _changePin() {
    if (_formKey.currentState!.validate()) {
      // Tambahkan logika untuk mengubah PIN di sini
      if (_newPinController.text == _confirmPinController.text) {
        // Logika perubahan PIN sukses
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              "PIN successfully changed.",
              style: TextStyle(color: Colors.white), // Warna teks hitam
            ),
            backgroundColor: const Color(0xFF7EBDA6), // Warna latar hijau
            duration: const Duration(seconds: 5), // Durasi 5 detik
            behavior: SnackBarBehavior.floating, // Membuat SnackBar mengambang
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Border radius 15
            ),
          ),
        );
        // Navigasi kembali setelah PIN berhasil diubah
        Navigator.pop(context);
      } else {
        // Jika PIN baru dan konfirmasi tidak sama
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              "New PIN and confirmation do not match.",
              style: TextStyle(color: Colors.white), // Warna teks hitam
            ),
            backgroundColor: const Color(0xFF7EBDA6), // Warna latar hijau
            duration: const Duration(seconds: 5), // Durasi 5 detik
            behavior: SnackBarBehavior.floating, // Membuat SnackBar mengambang
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Border radius 15
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Change PIN",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF7EBDA6),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Container(
                color: Colors.white.withOpacity(0.5),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Input untuk PIN lama
                      TextFormField(
                        controller: _oldPinController,
                        decoration: const InputDecoration(
                          labelText: 'Old PIN',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true, // Agar input tidak terlihat
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your old PIN';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      // Input untuk PIN baru
                      TextFormField(
                        controller: _newPinController,
                        decoration: const InputDecoration(
                          labelText: 'New PIN',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true, // Agar input tidak terlihat
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your new PIN';
                          }
                          if (value.length < 4) {
                            return 'The new PIN must consist of 4 digits.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      // Input untuk konfirmasi PIN baru
                      TextFormField(
                        controller: _confirmPinController,
                        decoration: const InputDecoration(
                          labelText: 'Confirm New PIN',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true, // Agar input tidak terlihat
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your new PIN';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      // Tombol konfirmasi perubahan PIN
                      ElevatedButton(
                        onPressed: _changePin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7EBDA6),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                        ),
                        child: const Text(
                          'Confirm Changes',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
