import 'package:flutter/material.dart';
import 'login_screen.dart';

class BlockCardScreen extends StatelessWidget {
  const BlockCardScreen({super.key});

  void showBlockConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Card Block Confirmation"),
          content: const Text(
              "Are you sure you want to block this card? This action cannot be undone."),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text("Confirm"),
              onPressed: () {
                // logika untuk memblokir kartu
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Card has been successfully blocked')),
                );

                // Pindah  ke halaman login
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
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
        title: const Text('Block Card'),
        backgroundColor: const Color(0xFF7EBDA6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Card for visual enhancement
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      "Card Blocking Terms and Conditions",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    // Adding bullet points and icons
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "1. ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal),
                          ),
                          TextSpan(
                            text:
                                "This action is irreversible. Once the card is blocked, it cannot be unblocked.\n",
                            style: TextStyle(fontSize: 16),
                          ),
                          TextSpan(
                            text: "2. ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal),
                          ),
                          TextSpan(
                            text:
                                "Make sure to review your recent transactions before blocking the card.\n",
                            style: TextStyle(fontSize: 16),
                          ),
                          TextSpan(
                            text: "3. ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal),
                          ),
                          TextSpan(
                            text:
                                "Blocking your card will prevent any further use, and a new card must be issued.\n",
                            style: TextStyle(fontSize: 16),
                          ),
                          TextSpan(
                            text: "4. ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal),
                          ),
                          TextSpan(
                            text:
                                "Contact customer service if you require assistance after blocking your card.\n",
                            style: TextStyle(fontSize: 16),
                          ),
                          TextSpan(
                            text: "5. ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal),
                          ),
                          TextSpan(
                            text:
                                "Any pending transactions will still be processed before the card is fully blocked.",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
                "If your card is lost or there is suspicious activity, you can block your card here:",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              // Adding icon to button
              onPressed: () {
                showBlockConfirmationDialog(context);
              },
              icon: const Icon(Icons.block), //ikon block
              label: const Text(
                'Block Card',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[200],
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
