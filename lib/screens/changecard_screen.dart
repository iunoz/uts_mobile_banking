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
        backgroundColor: const Color.fromARGB(255, 116, 199, 191),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.diamond),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          color:
              const Color.fromARGB(255, 172, 223, 218), // Warna latar belakang
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Colors.black), // Border untuk kotak
                    borderRadius: BorderRadius.circular(
                        10), // Membuat kotak jadi melengkung
                  ),
                  padding: const EdgeInsets.all(16.0), // Padding di dalam kotak
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
                                  print("Kartu hilang dipilih");
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 177, 235, 229),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                        color: Colors.black, width: 1),
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
                                print("Kartu rusak dipilih");
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 177, 235, 229),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(
                                      color: Colors.black, width: 1),
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
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black), // Border untuk kotak luar
                    borderRadius:
                        BorderRadius.circular(10), // Membuat sudut melengkung
                  ),
                  padding: const EdgeInsets.all(16.0), // Padding di dalam kotak
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
                                color:
                                    Colors.black), // Border untuk area gambar
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 177, 235, 229)),
                        child: const Center(
                          child:
                              Icon(Icons.image, size: 50, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(16),
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
                      Container(
                          height: 30,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color: Color.fromARGB(255, 177, 235, 229)),
                          padding: EdgeInsets.all(
                              5), //padding biar tulisannya agak tengah (gak mepet border)
                          child: Text(
                            "Example: Sumi Bank - Kelapa Gading",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      print("Form submitted");
                    },
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
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(backgroundColor: Colors.green, radius: 5),
                        SizedBox(width: 5),
                        Text("Validation accepted"),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        CircleAvatar(backgroundColor: Colors.red, radius: 5),
                        SizedBox(width: 5),
                        Text("Validation rejected"),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        CircleAvatar(backgroundColor: Colors.yellow, radius: 5),
                        SizedBox(width: 5),
                        Text("Validation rejected"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
