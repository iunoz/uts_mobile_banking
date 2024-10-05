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
        title: const Text('Change Card'),
        backgroundColor: const Color.fromARGB(255, 116, 199, 191),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.diamond),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context)
            .size
            .height, // biar full screen soalnya dia gamau full screen
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Reason for requesting card replacement:",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
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
                                  backgroundColor:
                                      const Color.fromARGB(255, 177, 235, 229),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                      color: _selectedReason == "Lost Card"
                                          ? Colors
                                              .black // kalo dipilih bordernya warna hitam
                                          : const Color.fromARGB(
                                              255, 172, 223, 218),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  "Lost Card",
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _selectedReason = "Damaged Card";
                                  _isDamagedCardSelected = true;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 177, 235, 229),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                    color: _selectedReason == "Damaged Card"
                                        ? Colors.black
                                        : const Color.fromARGB(
                                            255, 172, 223, 218),
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: const Text(
                                "Damaged Card",
                                style: TextStyle(color: Colors.black),
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
                        border: Border.all(
                            color: _isDamagedCardSelected
                                ? Colors.black
                                : Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Upload proof of damaged card:",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: _isDamagedCardSelected
                                      ? Colors.black
                                      : Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 177, 235, 229),
                            ),
                            child: Stack(
                              children: [
                                _selectedImage != null
                                    ? Image.file(
                                        _selectedImage!,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      )
                                    : const Center(
                                        child: Icon(Icons.image,
                                            size: 50, color: Colors.grey),
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
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter the nearest bank in your area",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller:
                            _nearestBankController, // controller buat cek apakah bank sudah diisi
                        decoration: InputDecoration(
                          hintText: "Example: Sumi Bank - Kelapa Gading",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 177, 235, 229),
                          contentPadding: const EdgeInsets.all(10),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 177, 235, 229),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      side: const BorderSide(color: Colors.black, width: 1),
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.black),
                    ),
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
