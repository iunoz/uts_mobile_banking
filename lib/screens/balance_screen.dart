import 'package:flutter/material.dart';
import '../widgets/ads_card.dart'; // Import the AdsCard widget

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({super.key});

  @override
  BalanceScreenState createState() => BalanceScreenState();
}

class BalanceScreenState extends State<BalanceScreen> {
  bool _isBalanceHidden = true; // Tracks visibility of the balance
  bool _isAccountNumberHidden = true; // Tracks visibility of the account number
  final TextEditingController _amountController =
      TextEditingController(); // Controller for amount input
  String _pin = ''; // Variable to store the PIN

  // Method to show the first dialog to enter the amount
  void _showAmountDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Save Money'),
          content: TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Amount to save (in Rupiah)',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: const Text('Back'),
            ),
            TextButton(
              onPressed: () {
                // Check if amount is entered
                if (_amountController.text.isNotEmpty) {
                  Navigator.of(context).pop(); // Close the amount dialog
                  _showPinDialog(); // Show the PIN dialog
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter a valid amount.'),
                    ),
                  );
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // Method to show the dialog for entering the PIN
  void _showPinDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Your PIN'),
          content: TextField(
            obscureText: true,
            onChanged: (value) {
              _pin = value; // Update PIN as user types
            },
            decoration: const InputDecoration(
              labelText: 'PIN',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: const Text('Back'),
            ),
            TextButton(
              onPressed: () {
                if (_pin.isNotEmpty) {
                  // Implement your PIN validation logic here

                  // Show notification after saving
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Rp ${_amountController.text} has been saved to emergency funds.',
                      ),
                    ),
                  );

                  // Clear input fields
                  _amountController.clear();
                  _pin = '';
                  Navigator.of(context).pop(); // Close the PIN dialog
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter your PIN.'),
                    ),
                  );
                }
              },
              child: const Text('Save'),
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
        title: const Text(
          "Balance",
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
              image: AssetImage('assets/images/bg.jpg'), // Background image
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Container(
                color: Colors.white.withOpacity(0.5),
              ),
              SingleChildScrollView(
                child: Padding(
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
                                'Account - 1234 5678 9123 4567',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    _isAccountNumberHidden
                                        ? '●●●●●●●●' // Hide account number if _isAccountNumberHidden is true
                                        : '4444.4444', // Show account number if _isAccountNumberHidden is false
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    icon: Icon(
                                      _isAccountNumberHidden
                                          ? Icons
                                              .visibility_off // Show "eye closed" icon if account number is hidden
                                          : Icons
                                              .visibility, // Show "eye open" icon if account number is visible
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isAccountNumberHidden =
                                            !_isAccountNumberHidden; // Toggle the account number visibility
                                      });
                                    },
                                  ),
                                ],
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
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    _isBalanceHidden
                                        ? '●●●●●●●●' // Hide balance if _isBalanceHidden is true
                                        : '4.000.000.000', // Show balance if _isBalanceHidden is false
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
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
                          onTap:
                              _showAmountDialog, // Show the amount dialog when tapped
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
                                imagePath:
                                    'assets/images/ad1.jpeg'), // Use the AdsCard widget
                            AdsCard(imagePath: 'assets/images/ad2.jpg'),
                            AdsCard(imagePath: 'assets/images/ad3.jpg'),
                          ],
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
