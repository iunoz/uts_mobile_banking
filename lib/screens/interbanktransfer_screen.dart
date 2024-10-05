import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InterbanktransferScreen extends StatefulWidget {
  const InterbanktransferScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InterbankTransferScreenState createState() =>
      _InterbankTransferScreenState();
}

class _InterbankTransferScreenState extends State<InterbanktransferScreen> {
  final _accountController = TextEditingController();
  final _amountController = TextEditingController();
  final _messageController = TextEditingController();
  String? _selectedBank;

  // dropdown list bank
  final Map<String, String> _banks = {
    'BCA': 'assets/images/bca.jpg',
    'BRI': 'assets/images/bri.jpg',
    'CIMB NIAGA': 'assets/images/cimbniaga.jpg',
    'CITIBANK': 'assets/images/citibank.jpg',
    'DANAMON': 'assets/images/danamon.jpg',
    'MANDIRI': 'assets/images/mandiri.jpg',
    'MEGA': 'assets/images/mega.jpg',
    'PANIN': 'assets/images/panin.jpg',
    'PERMATA': 'assets/images/permata.jpg',
    'SEABANK': 'assets/images/seabank.jpg',
    'UOB': 'assets/images/uob.jpg',
  };

  final Map<String, String> _accountNames = {
    '535230059': 'Panicia',
    '535230062': 'Paquita Melawi',
    '535230114': 'Gregorius Natanyel Benedict',
    '535230147': 'Ryan Hermanto',
    '535230152': 'Melfanny Leono',
    '535230185': 'Irene Carl Lewis',
  };

  final NumberFormat _currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  double _interbankLimit = 100000;
  final double _minimumTransfer = 10000;

  @override
  void initState() {
    super.initState();
    _loadInterbankLimit();
  }

  Future<void> _loadInterbankLimit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _interbankLimit = prefs.getDouble('interbankLimit') ?? 100000;
    });
  }

  void _submitTransfer() {
    final accountNumber = _accountController.text;
    final amountText = _amountController.text;
    final message = _messageController.text;

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

    if (amount < _minimumTransfer) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'The transfer amount must be at least ${_currencyFormat.format(_minimumTransfer)}.'),
        ),
      );
      return;
    }
    if (amount > _interbankLimit) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Transfer amount exceeds the limit of ${_currencyFormat.format(_interbankLimit)}.'),
        ),
      );
      return;
    }

    final formattedAmount = _currencyFormat.format(amount);

    // Untuk tanggal dan jam waktu transfer
    final DateTime now = DateTime.now();
    final String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    final String formattedTime = DateFormat('HH:mm:ss').format(now);
    final recipientName = _accountNames[accountNumber] ?? accountNumber;

    // Menampilkan dialog berhasil
    _showDialog(
      'Transfer Successful',
      '$formattedDate $formattedTime\n'
          'Bank: $_selectedBank\n'
          'To: $accountNumber\n'
          '$recipientName\n'
          'Amount: $formattedAmount\n'
          '${message.isNotEmpty ? 'Message: $message' : ''}',
    );

    // Setelah submit, form akan direset
    _accountController.clear();
    _amountController.clear();
    _messageController.clear();
    setState(() {
      _selectedBank = null;
    });
  }

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
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
          "Interbank Transfer",
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
              items: _banks.entries.map((entry) {
                return DropdownMenuItem<String>(
                  value: entry.key,
                  child: Row(
                    children: [
                      Image.asset(
                        entry.value,
                        width: 24, // Adjust width as needed
                        height: 24, // Adjust height as needed
                      ),
                      const SizedBox(width: 8),
                      Text(entry.key),
                    ],
                  ),
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
            TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                labelText: 'Message (optional)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitTransfer,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF7EBDA6),
              ),
              child: const Text('Submit Transfer'),
            ),
          ],
        ),
      ),
    );
  }
}
