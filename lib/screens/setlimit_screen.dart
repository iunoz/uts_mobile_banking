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

  // Untuk format angka
  final NumberFormat _currencyFormat =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);

  final TextEditingController _cashLimitController = TextEditingController();
  final TextEditingController _sumiTransferLimitController =
      TextEditingController();
  final TextEditingController _interbankLimitController =
      TextEditingController();
  final TextEditingController _debitLimitController = TextEditingController();

  static const double _minLimit = 10000;
  static const double _maxLimit = 10000000;

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

      _cashLimitController.text = _cashLimit.toString();
      _sumiTransferLimitController.text = _sumiTransferLimit.toString();
      _interbankLimitController.text = _interbankLimit.toString();
      _debitLimitController.text = _debitLimit.toString();
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

  void _onLimitInputChanged(String value, String type) {
    double? newValue = double.tryParse(value);
    if (newValue != null) {
      setState(() {
        switch (type) {
          case 'cash':
            if (newValue >= _minLimit && newValue <= _maxLimit) {
              _cashLimit = newValue;
            }
            break;
          case 'sumi':
            if (newValue >= _minLimit && newValue <= _maxLimit) {
              _sumiTransferLimit = newValue;
            }
            break;
          case 'interbank':
            if (newValue >= _minLimit && newValue <= _maxLimit) {
              _interbankLimit = newValue;
            }
            break;
          case 'debit':
            if (newValue >= _minLimit && newValue <= _maxLimit) {
              _debitLimit = newValue;
            }
            break;
        }
      });
    }
  }

  void _onTextFieldEditingComplete(String type) {
    double? newValue = double.tryParse(_cashLimitController.text);
    if (newValue != null) {
      setState(() {
        if (newValue >= _minLimit && newValue <= _maxLimit) {
          switch (type) {
            case 'cash':
              _cashLimit = newValue;
              break;
            case 'sumi':
              _sumiTransferLimit = newValue;
              break;
            case 'interbank':
              _interbankLimit = newValue;
              break;
            case 'debit':
              _debitLimit = newValue;
              break;
          }
        } else {
          switch (type) {
            case 'cash':
              _cashLimitController.text = _cashLimit.toString();
              break;
            case 'sumi':
              _sumiTransferLimitController.text = _sumiTransferLimit.toString();
              break;
            case 'interbank':
              _interbankLimitController.text = _interbankLimit.toString();
              break;
            case 'debit':
              _debitLimitController.text = _debitLimit.toString();
              break;
          }
        }
      });
    }
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
              // Limit untuk tarik tunai
              CustomSlider(
                title: 'Cash Withdrawal Limit',
                currentLimit: _cashLimit,
                onChanged: (value) {
                  setState(() {
                    _cashLimit = value;
                    _cashLimitController.text = value.toString();
                  });
                },
              ),
              TextField(
                controller: _cashLimitController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Cash Withdrawal Limit',
                ),
                onChanged: (value) => _onLimitInputChanged(value, 'cash'),
                onEditingComplete: () => _onTextFieldEditingComplete('cash'),
              ),
              const SizedBox(height: 10),
              // Limit untuk transfer antar rekening
              CustomSlider(
                title: 'SUMI Inter-Account Transfer Limit',
                currentLimit: _sumiTransferLimit,
                onChanged: (value) {
                  setState(() {
                    _sumiTransferLimit = value;
                    _sumiTransferLimitController.text = value.toString();
                  });
                },
              ),
              TextField(
                controller: _sumiTransferLimitController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter SUMI Transfer Limit',
                ),
                onChanged: (value) => _onLimitInputChanged(value, 'sumi'),
                onEditingComplete: () => _onTextFieldEditingComplete('sumi'),
              ),
              const SizedBox(height: 10),
              // Limit untuk transfer antar bank
              CustomSlider(
                title: 'Interbank Transfer Limit',
                currentLimit: _interbankLimit,
                onChanged: (value) {
                  setState(() {
                    _interbankLimit = value;
                    _interbankLimitController.text = value.toString();
                  });
                },
              ),
              TextField(
                controller: _interbankLimitController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Interbank Limit',
                ),
                onChanged: (value) => _onLimitInputChanged(value, 'interbank'),
                onEditingComplete: () =>
                    _onTextFieldEditingComplete('interbank'),
              ),
              const SizedBox(height: 10),
              // Limit untuk transaksi debit
              CustomSlider(
                title: 'Debit Transaction Limit',
                currentLimit: _debitLimit,
                onChanged: (value) {
                  setState(() {
                    _debitLimit = value;
                    _debitLimitController.text = value.toString();
                  });
                },
              ),
              TextField(
                controller: _debitLimitController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Debit Transaction Limit',
                ),
                onChanged: (value) => _onLimitInputChanged(value, 'debit'),
                onEditingComplete: () => _onTextFieldEditingComplete('debit'),
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
                child: const Text('Set Limits'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
