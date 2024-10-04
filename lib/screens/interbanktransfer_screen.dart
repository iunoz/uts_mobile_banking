import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InterbanktransferScreen extends StatefulWidget {
  const InterbanktransferScreen({super.key});

  @override
  _InterbankTransferScreenState createState() =>
      _InterbankTransferScreenState();
}

class _InterbankTransferScreenState extends State<InterbanktransferScreen> {
  final _accountController = TextEditingController();
  final _amountController = TextEditingController();
  String? _selectedBank;

  // dropdown list bank
  final List<String> _banks = [
    'BCA',
    'BRI',
    'CIMB NIAGA',
    'CITIBANK',
    'DANAMON',
    'MANDIRI',
    'MEGA',
    'PANIN',
    'PERMATA',
    'SEABANK',
    'UOB',
  ];

  final NumberFormat _currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  void _submitTransfer() {
    final accountNumber = _accountController.text;
    final amountText = _amountController.text;

    if (_selectedBank == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a bank.'),
        ),
      );
      return;
    }
    if (accountNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the recipient account number.'),
        ),
      );
      return;
    }
    if (amountText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the amount.'),
        ),
      );
      return;
    }

    final double amount = double.tryParse(amountText) ?? 0;
    final formattedAmount = _currencyFormat.format(amount);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Transfer of Rp$formattedAmount to account $accountNumber at $_selectedBank successful.'),
      ),
    );

    // Setelah submit, form akan direset
    _accountController.clear();
    _amountController.clear();
    setState(() {
      _selectedBank = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Interbank Transfer",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: _selectedBank,
              decoration: const InputDecoration(
                labelText: 'Bank',
                border: OutlineInputBorder(),
              ),
              items: _banks.map((String bank) {
                return DropdownMenuItem<String>(
                  value: bank,
                  child: Text(bank),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedBank = newValue;
                });
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _accountController,
              decoration: const InputDecoration(
                labelText: 'Recipient Account Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitTransfer,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
              child: const Text('Submit Transfer'),
            ),
          ],
        ),
      ),
    );
  }
}
