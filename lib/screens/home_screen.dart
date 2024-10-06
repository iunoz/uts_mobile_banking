import 'package:flutter/material.dart';
import 'package:uts_mobile_banking/screens/bills_screen.dart';
import 'package:uts_mobile_banking/screens/interaccountTransfer_screen.dart';
import 'package:uts_mobile_banking/screens/interbanktransfer_screen.dart';
import 'package:uts_mobile_banking/screens/qris_screen.dart';
import 'package:uts_mobile_banking/screens/topupemoney_screen.dart';
import 'package:uts_mobile_banking/screens/transferhistory_screen.dart';
import 'package:uts_mobile_banking/screens/virtualaccount_screen.dart';
import 'package:uts_mobile_banking/widgets/page_transition.dart';
import '../widgets/custom_button.dart';
import '../widgets/animation_lottie.dart';
import '../widgets/automatic_ads.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';
import 'balance_screen.dart';

class HomeScreen extends StatefulWidget {
  final bool showAnimation; //parameter untuk mengontrol animasi
  const HomeScreen({super.key, this.showAnimation = false}); //default ke false

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool _isBalanceHidden = true;
  late bool _showAnimation;

  @override
  void initState() {
    super.initState();
    _showAnimation = widget.showAnimation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Screen",
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
          //background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.jpg',
              fit: BoxFit.cover, //buat image cover seluruh screen
            ),
          ),
          //konten utama di home
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    color: const Color.fromARGB(255, 192, 248, 214)
                        .withOpacity(0.8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Welcome Back,',
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Gregorius Nathanyel Benedict',
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text(
                                'Rp',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 8),
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
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isBalanceHidden = !_isBalanceHidden;
                                  });
                                },
                              ),
                            ],
                          ),
                          const CustomButton(
                            buttonText: 'More',
                            destination: BalanceScreen(),
                            color: Color.fromARGB(255, 192, 248, 214),
                            borderRadius: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const AutomaticAds(
                    imagePaths: [
                      'assets/images/ads1.jpeg',
                      'assets/images/ads2.jpeg',
                      'assets/images/ads3.jpeg',
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GridView.count(
                    shrinkWrap:
                        true, //buat GridView hanya ambil space yg penting
                    physics:
                        const NeverScrollableScrollPhysics(), //disable GridView scrolling
                    crossAxisCount: 2,
                    mainAxisSpacing: 14, // vertical spacing
                    crossAxisSpacing: 14, // horizontal spacing
                    childAspectRatio: 1.4, // Adjust aspect ratio
                    children: [
                      CustomButton(
                        buttonText: 'Top Up E-Money',
                        destination: const TopupemoneyScreen(),
                        color: const Color.fromARGB(248, 192, 248, 214)
                            .withOpacity(0.85),
                        icon: Icons.credit_card_rounded,
                        borderRadius: 35,
                        transitionType: PageTransitionType.fade,
                        iconSize: 22,
                        textSize: 14,
                      ),
                      CustomButton(
                        buttonText: 'Transfer History',
                        destination: const TransferHistoryScreen(),
                        color: const Color.fromARGB(255, 192, 248, 214)
                            .withOpacity(0.85),
                        icon: Icons.history,
                        borderRadius: 35,
                        transitionType: PageTransitionType.fade,
                        iconSize: 22,
                        textSize: 14,
                      ),
                      CustomButton(
                        buttonText: 'Interbank Transfer',
                        destination: const InterbanktransferScreen(),
                        color: const Color.fromARGB(255, 192, 248, 214)
                            .withOpacity(0.85),
                        icon: Icons.account_balance,
                        borderRadius: 35,
                        transitionType: PageTransitionType.fade,
                        iconSize: 22,
                        textSize: 14,
                      ),
                      CustomButton(
                        buttonText: 'Account Transfer',
                        destination: const InteraccounttransferScreen(),
                        color: const Color.fromARGB(255, 192, 248, 214)
                            .withOpacity(0.85),
                        icon: Icons.balance,
                        borderRadius: 35,
                        transitionType: PageTransitionType.fade,
                        iconSize: 22,
                        textSize: 14,
                      ),
                      CustomButton(
                        buttonText: 'Virtual Account',
                        destination: const VirtualAccountScreen(),
                        color: const Color.fromARGB(255, 192, 248, 214)
                            .withOpacity(0.85),
                        icon: Icons.account_box,
                        borderRadius: 35,
                        transitionType: PageTransitionType.fade,
                        iconSize: 22,
                        textSize: 14,
                      ),
                      CustomButton(
                        buttonText: 'Bills',
                        destination: const BillsScreen(),
                        color: const Color.fromARGB(255, 192, 248, 214)
                            .withOpacity(0.85),
                        icon: Icons.receipt,
                        borderRadius: 35,
                        transitionType: PageTransitionType.fade,
                        iconSize: 22,
                        textSize: 14,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (_showAnimation)
            Positioned.fill(
              child: Container(
                color: Colors.transparent,
                child: const AnimationLottie(
                  animationPath: 'assets/animations/confetti.json',
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Color(0xFF7EBDA6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: CustomButton(
                buttonText: 'Home',
                destination: HomeScreen(),
                color: Color(0xFF7EBDA6),
                icon: Icons.home,
                textColor: Colors.white,
                iconColor: Colors.white,
                usePushReplacement: true,
                iconSize: 22,
                borderRadius: 15,
              ),
            ),
            Flexible(
              child: CustomButton(
                buttonText: 'QRIS',
                destination: QrisScreen(),
                color: Color(0xFF7EBDA6),
                icon: Icons.qr_code,
                textColor: Colors.white,
                iconColor: Colors.white,
                usePushReplacement: true,
                borderRadius: 15,
                iconSize: 22,
                transitionType: PageTransitionType.slideLeft,
              ),
            ),
            Flexible(
              child: CustomButton(
                buttonText: 'Notif',
                destination: NotificationScreen(),
                color: Color(0xFF7EBDA6),
                icon: Icons.notifications,
                textColor: Colors.white,
                iconColor: Colors.white,
                usePushReplacement: true,
                borderRadius: 15,
                iconSize: 22,
                transitionType: PageTransitionType.slideLeft,
              ),
            ),
            Flexible(
              child: CustomButton(
                buttonText: 'Profile',
                destination: ProfileScreen(),
                color: Color(0xFF7EBDA6),
                icon: Icons.account_circle_rounded,
                textColor: Colors.white,
                iconColor: Colors.white,
                usePushReplacement: true,
                borderRadius: 15,
                iconSize: 22,
                transitionType: PageTransitionType.slideLeft,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
