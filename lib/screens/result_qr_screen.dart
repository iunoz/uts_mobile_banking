import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; //utk format tanggal
import 'package:uts_mobile_banking/widgets/page_transition.dart';
import 'dart:math'; //untuk generate transaction id
import '../widgets/animation_lottie.dart';
import '../widgets/custom_button.dart';
import 'home_screen.dart';

class ResultQrScreen extends StatefulWidget {
  final String qrResult;

  const ResultQrScreen({super.key, required this.qrResult});

  @override
  // ignore: library_private_types_in_public_api
  _ResultQrScreenState createState() => _ResultQrScreenState();
}

class _ResultQrScreenState extends State<ResultQrScreen> {
  final String transactionId = _generateTransactionId();
  final DateTime scanDateTime = DateTime.now();
  bool isPaid = false; //buat nandain payment status

  //random transaction id
  static String _generateTransactionId() {
    const length = 12; //panjang transaction
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rand = Random();
    return List.generate(length, (index) => chars[rand.nextInt(chars.length)])
        .join();
  }

  void _handlePayment() {
    setState(() {
      isPaid = true;
    });

    //delay ke homescreen setelah animasi dijalanin
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'QRIS Payment',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF7EBDA6),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'To:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.qrResult,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(), //divider buat kasih garis
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Transaction ID:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    transactionId,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Date & Time:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    DateFormat('yyyy-MM-dd – HH:mm:ss').format(scanDateTime),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: CustomButton(
                      buttonText: 'Pay',
                      destination: const HomeScreen(),
                      color: const Color(0xFF7EBDA6),
                      textColor: Colors.white,
                      usePushAndRemoveUntil: true,
                      transitionType: PageTransitionType.fade,
                      customNavigation: _handlePayment, //handle payment logic
                    ),
                  ),
                  const SizedBox(height: 2),

                  //tampilin animasi jika sudah pay
                  if (isPaid)
                    const AnimationLottie(
                      animationPath: 'assets/animations/paymentsuccess.json',
                      width: 250,
                      height: 250,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
