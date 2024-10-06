import 'package:flutter/material.dart';
import '../widgets/ads_card.dart'; // Import the AdCard widget

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({super.key});

  @override
  BalanceScreenState createState() => BalanceScreenState();
}

class BalanceScreenState extends State<BalanceScreen> {
  bool _isBalanceHidden =
      true; // This boolean will track whether the balance is hidden or shown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Balance Screen'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Account - 1234 5678 9101',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Total Balance',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text(
                          'Rp',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          _isBalanceHidden
                              ? '●●●●●●●●' // Hide balance if _isBalanceHidden is true
                              : '4.000.000.000', // Show balance if _isBalanceHidden is false
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Icon(
                            _isBalanceHidden
                                ? Icons
                                    .visibility_off // Show "eye closed" icon if balance is hidden
                                : Icons
                                    .visibility, // Show "eye open" icon if balance is visible
                          ),
                          onPressed: () {
                            setState(() {
                              _isBalanceHidden =
                                  !_isBalanceHidden; // Toggle the balance visibility
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                leading: const Icon(Icons.savings),
                title: const Text('Save for an emergency'),
                onTap: () {
                  // Implement saving navigation or functionality here
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Ads',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            // Swipeable Ads Section
            SizedBox(
              height: 150, // Set the height of the PageView
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: const [
                  AdsCard(
                      adTitle: 'Ad 1',
                      color: Colors.red), // Use the AdsCard widget
                  AdsCard(adTitle: 'Ad 2', color: Colors.blue),
                  AdsCard(adTitle: 'Ad 3', color: Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
