import 'package:flutter/material.dart';
import 'package:uts_mobile_banking/widgets/slider.dart';

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
                  backgroundColor:
                      const Color(0xFF7EBDA6), // Set the text color
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'Limits set: \nCash Withdrawal Limit: Rp ${_cashLimit.round()}\nSUMI Inter-Account Transfer Limit: Rp ${_sumiTransferLimit.round()}\nInterbank Limit: Rp ${_interbankLimit.round()}\nDebit Transaction Limit: Rp ${_debitLimit.round()}'),
                  ));
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
