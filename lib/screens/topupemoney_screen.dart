import 'package:flutter/material.dart';
import '../widgets/emoney_option.dart';

class TopupemoneyScreen extends StatelessWidget {
  const TopupemoneyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top up e-money'),
        backgroundColor: const Color.fromARGB(255, 116, 199, 191),
      ),
      body: Container(
        color: const Color.fromARGB(255, 229, 249, 246), // Warna latar belakang
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                // Membuat grid 3x3
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  EmoneyOption(
                    name: "S Pay",
                    icon: Icons.account_balance_wallet,
                    onTap: () {},
                  ),
                  EmoneyOption(
                    name: "DANA",
                    icon: Icons.account_balance_wallet,
                    onTap: () {},
                  ),
                  EmoneyOption(
                    name: "Gopay",
                    icon: Icons.account_balance_wallet,
                    onTap: () {},
                  ),
                  EmoneyOption(
                    name: "AstraPay",
                    icon: Icons.account_balance_wallet,
                    onTap: () {},
                  ),
                  EmoneyOption(
                    name: "OVO",
                    icon: Icons.account_balance_wallet,
                    onTap: () {},
                  ),
                  EmoneyOption(
                    name: "GoPay",
                    icon: Icons.account_balance_wallet,
                    onTap: () {},
                  ),
                  EmoneyOption(
                    name: "Link Aja",
                    icon: Icons.account_balance_wallet,
                    onTap: () {},
                  ),
                  EmoneyOption(
                    name: "eTOLL",
                    icon: Icons.account_balance_wallet,
                    onTap: () {},
                  ),
                  EmoneyOption(
                    name: "Flazz",
                    icon: Icons.account_balance_wallet,
                    onTap: () {},
                  ),
                ],
              ),
            ),
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
                    "Input phone number/code:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: const Color.fromARGB(255, 177, 235, 229)),
                    padding: const EdgeInsets.all(5),
                    child: const Text(
                      "Example:085212345679",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 177, 235, 229),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.black, width: 1),
                  ),
                ),
                child: const Text(
                  "Confirm for Top Up",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
