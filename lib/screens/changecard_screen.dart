import 'package:flutter/material.dart';

class ChangeCardScreen extends StatefulWidget {
  const ChangeCardScreen({super.key});

  @override
  State<ChangeCardScreen> createState() => _ChangeCardScreenState();
}

class _ChangeCardScreenState extends State<ChangeCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Card'),
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
              16.0), // Similar to your previous padding style
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card replacement reason
              const Text(
                "Alasan ingin melakukan penggantian kartu:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        print("Kartu hilang dipilih");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.teal, // Change to backgroundColor
                      ),
                      child: const Text("Kartu hilang"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        print("Kartu rusak dipilih");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                      ),
                      child: const Text("Kartu rusak"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Upload damaged card evidence
              const Text(
                "Upload bukti kartu yang rusak:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Icon(Icons.image, size: 50, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),
              // Input nearest bank branch
              const Text(
                "Kantor cabang bank terdekat:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan nama cabang bank',
                ),
              ),
              const SizedBox(height: 20),
              // Submit button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    print("Form submitted");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),
                  child: const Text("Submit"),
                ),
              ),
              const SizedBox(height: 20),
              // Validation status
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(backgroundColor: Colors.green, radius: 5),
                      SizedBox(width: 5),
                      Text("Validasi diterima"),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      CircleAvatar(backgroundColor: Colors.red, radius: 5),
                      SizedBox(width: 5),
                      Text("Validasi ditolak"),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      CircleAvatar(backgroundColor: Colors.yellow, radius: 5),
                      SizedBox(width: 5),
                      Text("Belum divalidasi"),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
