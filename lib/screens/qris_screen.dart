import 'package:flutter/material.dart';
import 'package:uts_mobile_banking/widgets/page_transition.dart';
import '../widgets/custom_button.dart';
import 'profile_screen.dart';
import 'notification_screen.dart';
import 'home_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'generate_qr_screen.dart';
import 'result_qr_screen.dart';

class QrisScreen extends StatefulWidget {
  const QrisScreen({super.key});

  @override
  State<QrisScreen> createState() => _QrisScreenState();
}

class _QrisScreenState extends State<QrisScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isFlashOn = false;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  //function utk pembuatan QR view
  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen((scanData) {
      final qrResult = scanData.code!;

      //validasi QR code (8 hingga 15 digits, spti norek di Indo)
      if (RegExp(r'^\d{8,15}$').hasMatch(qrResult)) {
        controller.pauseCamera(); //pause kamera sebelum navigasi
        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => ResultQrScreen(qrResult: qrResult),
          ),
        ).then((_) {
          controller.resumeCamera(); //resume kamera setelah kembali
        });
      } else {
        _showInvalidQrAlert(); //tampilkan alert untuk QR code yang tidak valid
      }
    });
  }

  //function untuk menampilkan alert
  void _showInvalidQrAlert() {
    controller?.pauseCamera(); //pause kamera saat alert ditampilkan

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Invalid QR Code",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(),
            ],
          ),
          content: const Text(
            "Can't process the payment. QR code is invalid.",
          ),
          actions: [
            TextButton(
              child: const Text(
                "OK",
                style: TextStyle(
                  color: Color(0xFF7EBDA6),
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                controller
                    ?.resumeCamera(); //resume kamera setelah alert ditutup
              },
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
          "QRIS",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF7EBDA6),
      ),
      body: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: const Color(0xFF7EBDA6),
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: MediaQuery.of(context).size.width * 0.8,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller?.toggleFlash();
                    setState(() {
                      isFlashOn = !isFlashOn;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7EBDA6),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15),
                  ),
                  child: Icon(
                    isFlashOn ? Icons.flash_on : Icons.flash_off,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller?.pauseCamera(); //pause kamera sebelum navigasi
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GenerateQRScreen(),
                      ),
                    ).then((_) {
                      controller
                          ?.resumeCamera(); //resume kamera setelah kembali
                    });
                  },
                  child: const CustomButton(
                    buttonText: 'QR',
                    destination: GenerateQRScreen(),
                    color: Color(0xFF7EBDA6),
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    usePushReplacement: false,
                    borderRadius: 15,
                    iconSize: 20,
                    textSize: 15,
                    transitionType: PageTransitionType.fade,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Color(0xFF7EBDA6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              destination: HomeScreen(),
              color: Color(0xFF7EBDA6),
              icon: Icons.home,
              textColor: Colors.white,
              iconColor: Colors.white,
              usePushReplacement: true,
              borderRadius: 18,
              iconSize: 25,
              transitionType: PageTransitionType.slideRight,
            ),
            CustomButton(
              destination: QrisScreen(),
              color: Color(0xFF7EBDA6),
              icon: Icons.qr_code,
              textColor: Colors.white,
              iconColor: Colors.white,
              usePushReplacement: true,
              borderRadius: 18,
              iconSize: 25,
            ),
            CustomButton(
              destination: NotificationScreen(),
              color: Color(0xFF7EBDA6),
              icon: Icons.notifications,
              textColor: Colors.white,
              iconColor: Colors.white,
              usePushReplacement: true,
              borderRadius: 18,
              iconSize: 25,
              transitionType: PageTransitionType.slideLeft,
            ),
            CustomButton(
              destination: ProfileScreen(),
              color: Color(0xFF7EBDA6),
              icon: Icons.account_circle_rounded,
              textColor: Colors.white,
              iconColor: Colors.white,
              usePushReplacement: true,
              borderRadius: 18,
              iconSize: 25,
              transitionType: PageTransitionType.slideLeft,
            ),
          ],
        ),
      ),
    );
  }
}
