import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: const Color(0xFF7EBDA6),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.teal.shade50,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                        'https://static.vecteezy.com/system/resources/previews/009/384/393/non_2x/credit-card-clipart-design-illustration-free-png.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Card Type",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "SIGMA Xpresi",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Card Number",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "1234 5678 9123 4567",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Action buttons
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Set Limit Button
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.teal.withOpacity(0.2),
                            border: Border.all(
                              color: Colors.teal,
                              width: 1,
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              print("Set Limit button pressed");
                            },
                            icon: const Icon(Icons.attach_money),
                            color: Colors.teal,
                            iconSize: 24, // Adjust icon size
                            padding: const EdgeInsets.all(12),
                          ),
                        ),
                        const Text('Set Limit'),
                      ],
                    ),
                    // Block Card Button
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red.withOpacity(0.2),
                            border: Border.all(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              print("Block Card button pressed");
                            },
                            icon: const Icon(Icons.block),
                            color: Colors.red,
                            iconSize: 24,
                            padding: const EdgeInsets.all(12),
                          ),
                        ),
                        const Text('Block Card'),
                      ],
                    ),
                    // Change Card Button
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue.withOpacity(0.2),
                            border: Border.all(
                              color: Colors.blue,
                              width: 1,
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              print("Change Card button pressed");
                            },
                            icon: const Icon(Icons.credit_card),
                            color: Colors.blue,
                            iconSize: 24,
                            padding: const EdgeInsets.all(12),
                          ),
                        ),
                        const Text('Change Card'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
