import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bills App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const BillsScreen(),
    );
  }
}

class BillsScreen extends StatelessWidget {
  const BillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bills",
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
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  children: [
                    buildBillCard(context, FontAwesomeIcons.bolt, 'Electricity',
                        true, 120000),
                    buildBillCard(
                        context, FontAwesomeIcons.tint, 'Water', true, 50000),
                    buildBillCard(context, FontAwesomeIcons.fileInvoiceDollar,
                        'Tax', false, 0),
                    buildBillCard(context, FontAwesomeIcons.school, 'School',
                        true, 250000),
                    buildBillCard(context, FontAwesomeIcons.phone, 'Home Phone',
                        false, 0),
                    buildBillCard(context, FontAwesomeIcons.hospital, 'BPJS',
                        true, 150000),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card buildBillCard(BuildContext context, IconData icon, String title,
      bool hasBill, int amount) {
    return Card(
      child: GestureDetector(
        onTap: () {
          print(
              "Tapped on: $title, hasBill: $hasBill, amount: $amount"); // Debugging print
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(hasBill ? 'Bill Details' : 'No Bills'),
                content: hasBill
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Amount to pay: Rp $amount'),
                          const SizedBox(height: 10),
                          const Text('Would you like to pay now or later?'),
                        ],
                      )
                    : Text('There are no bills for $title.'),
                actions: <Widget>[
                  if (hasBill)
                    TextButton(
                      child: const Text('Later'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  if (hasBill)
                    TextButton(
                      child: const Text('Pay'),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close current dialog
                        _showPinModal(context, amount);
                      },
                    ),
                  TextButton(
                    child: const Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(icon, size: 50, color: const Color(0xFF7EBDA6)),
            const SizedBox(height: 10),
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  void _showPinModal(BuildContext context, int amount) {
    TextEditingController pinController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // to ensure it takes full height of keyboard
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Enter PIN to Pay Rp $amount',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: pinController,
                obscureText: true,
                keyboardType: TextInputType.number,
                maxLength: 6, // Assume a 6-digit PIN
                decoration: const InputDecoration(
                  labelText: 'PIN',
                  border: OutlineInputBorder(),
                  hintText: 'Enter your 6-digit PIN',
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (pinController.text.length == 6) {
                    Navigator.of(context).pop(); // Close the modal
                    _showPaymentSuccessDialog(context);
                  } else {
                    // Show a snackbar or dialog if PIN is invalid
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Invalid PIN. Please enter 6 digits.')),
                    );
                  }
                },
                child: const Text('Submit Payment'),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  void _showPaymentSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Payment Successful'),
          content: const Text('Your payment has been processed successfully!'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close success dialog
              },
            ),
          ],
        );
      },
    );
  }
}
