import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChangeCardScreen extends StatefulWidget {
  const ChangeCardScreen({super.key});

  @override
  State<ChangeCardScreen> createState() => _ChangeCardScreenState();
}

class _ChangeCardScreenState extends State<ChangeCardScreen> {
  File? _selectedImage; // variabel buat nyimpen gambar yang dimasukin user
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _nearestBankController = TextEditingController();

  String? _selectedReason;
  bool _isDamagedCardSelected = false;

  Future<void> _pickImage() async {
    if (_selectedReason == null) {
      _showAlertDialog(
          'Can Not Proccess', 'Please select a reason before uploading image');
      return;
    }

    if (!_isDamagedCardSelected) {
      _showAlertDialog('Can Not Proccess',
          'Image upload is only available for damaged card selection');
      return;
    }

    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage =
            File(pickedImage.path); // masukin image yg udh dipilih user
      });
    }
  }

  void _removeImage() {
    setState(() {
      _selectedImage =
          null; // kalo user pencet tanda silang, maka gambar akan hilang
    });
  }

  void _submitForm() {
    if (_selectedReason == null) {
      _showAlertDialog('Can Not Proccess', 'Please Select the Reason');
      return;
    }

    if (_isDamagedCardSelected && _selectedImage == null) {
      _showAlertDialog(
          'Can Not Proccess', 'Please Upload proof for damaged card');
      return;
    }

    if (_nearestBankController.text.isEmpty) {
      _showAlertDialog('Error', 'Please enter the nearest bank in your area.');
      return;
    }

    void resetForm() {
      setState(() {
        _selectedImage = null;
        _nearestBankController.clear();
        _selectedReason = null;
        _isDamagedCardSelected = false;
      });
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Submission"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Reason: $_selectedReason"),
              Text("Nearest Bank: ${_nearestBankController.text}"),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Confirm"),
              onPressed: () {
                Navigator.of(context).pop();
                _showAlertDialog('Success',
                    'Request submitted successfully! Your request will be stored in notifications; please wait for further notifications from the nearest bank branch. thank you!');
                resetForm(); // jika sudah sukses maka semua input user akan di hapus atau direset
              },
            ),
          ],
        );
      },
    );
  }

  void _showAlertDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF7EBDA6),
          title: const Text(
            "Change Card",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.white,
          )),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.5),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.teal.shade50,
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Reason for requesting card replacement:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedReason = "Lost Card";
                                    _isDamagedCardSelected = false;
                                    _selectedImage = null;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _selectedReason ==
                                          "Lost Card"
                                      ? const Color(0xFF7EBDA6)
                                      : const Color(
                                          0xFF7EBDA6), // warna berubah saat dipilih
                                  elevation:
                                      _selectedReason == "Lost Card" ? 4 : 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  "Lost Card",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedReason = "Damaged";
                                    _isDamagedCardSelected = true;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _selectedReason == "Damaged"
                                      ? const Color(0xFF7EBDA6)
                                      : const Color(0xFF7EBDA6),
                                  elevation:
                                      _selectedReason == "Damaged" ? 4 : 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  "Damaged",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: _pickImage,
                    child: AbsorbPointer(
                      absorbing: !_isDamagedCardSelected,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.teal.shade50,
                          border: Border.all(
                            color: _isDamagedCardSelected
                                ? Colors.grey.shade300
                                : Colors.grey.shade300,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Upload proof of damaged card:",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: _isDamagedCardSelected
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: _selectedImage != null
                                        ? Image.file(
                                            _selectedImage!,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: double.infinity,
                                          )
                                        : const Center(
                                            child: Icon(Icons.image,
                                                size: 50,
                                                color: Color(0xFF7EBDA6)),
                                          ),
                                  ),
                                  if (_selectedImage != null)
                                    Positioned(
                                      top: 5,
                                      right: 5,
                                      child: GestureDetector(
                                        onTap: _removeImage,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.black54,
                                            shape: BoxShape.circle,
                                          ),
                                          padding: const EdgeInsets.all(4),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.teal.shade50,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter the nearest bank in your area",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _nearestBankController,
                          decoration: InputDecoration(
                            hintText: "Ex: Sumi Bank - Kelapa Gading",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.all(16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7EBDA6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 16),
                      ),
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
