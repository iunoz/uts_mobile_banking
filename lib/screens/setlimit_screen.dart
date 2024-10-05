import 'package:flutter/material.dart';
import 'package:uts_mobile_banking/widgets/slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class SetLimitScreen extends StatefulWidget {
  const SetLimitScreen({super.key});

  @override
  SetLimitPageState createState() => SetLimitPageState();
}

class SetLimitPageState extends State<SetLimitScreen> {
  double _cashLimit = 100000;
  double _sumiTransferLimit = 100000;
  double _interbankLimit = 100000;
  double _debitLimit = 100000;

  final NumberFormat _currencyFormat =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);

  @override
  void initState() {
    super.initState();
    _loadLimits();
  }

  Future<void> _loadLimits() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _cashLimit = prefs.getDouble('cashLimit') ?? 100000;
      _sumiTransferLimit = prefs.getDouble('sumiTransferLimit') ?? 100000;
      _interbankLimit = prefs.getDouble('interbankLimit') ?? 100000;
      _debitLimit = prefs.getDouble('debitLimit') ?? 100000;
    });
  }

  Future<void> _saveLimits() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('cashLimit', _cashLimit);
    await prefs.setDouble('sumiTransferLimit', _sumiTransferLimit);
    await prefs.setDouble('interbankLimit', _interbankLimit);
    await prefs.setDouble('debitLimit', _debitLimit);
  }

  void _showLimitsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Limits Set'),
          content: Text(
            'Cash Withdrawal Limit: ${_currencyFormat.format(_cashLimit)}\n'
            'SUMI Inter-Account Transfer Limit: ${_currencyFormat.format(_sumiTransferLimit)}\n'
            'Interbank Limit: ${_currencyFormat.format(_interbankLimit)}\n'
            'Debit Transaction Limit: ${_currencyFormat.format(_debitLimit)}',
          ),
          actions: <Widget>[
            TextButton(
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
        title: const Text('Set Limit'),
        centerTitle: true,
        backgroundColor: const Color(0xFF7EBDA6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSlider(
                title: 'Cash Withdrawal Limit',
                currentLimit: _cashLimit,
                onChanged: (value) {
                  setState(() {
                    _cashLimit = value;
                  });
                },
              ),
              CustomSlider(
                title: 'SUMI Inter-Account Transfer Limit',
                currentLimit: _sumiTransferLimit,
                onChanged: (value) {
                  setState(() {
                    _sumiTransferLimit = value;
                  });
                },
              ),
              CustomSlider(
                title: 'Interbank Transfer Limit',
                currentLimit: _interbankLimit,
                onChanged: (value) {
                  setState(() {
                    _interbankLimit = value;
                  });
                },
              ),
              CustomSlider(
                title: 'Debit Transaction Limit',
                currentLimit: _debitLimit,
                onChanged: (value) {
                  setState(() {
                    _debitLimit = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF7EBDA6),
                ),
                onPressed: () {
                  _saveLimits();
                  _showLimitsDialog();
                },
                child: const Text('Set Limit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
