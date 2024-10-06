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
          Container(
            color: Colors.white.withOpacity(0.5),
          ),
          //konten utama di home
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    color: Colors.teal.shade50,
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
                            color: Color(0xFF7EBDA6),
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
                  Container(
                    padding:
                        const EdgeInsets.all(10.0), // padding untuk container
                    decoration: BoxDecoration(
                      color: const Color(0xFF7EBDA6).withOpacity(
                          0.5), // warna background dengan transparansi
                      borderRadius: BorderRadius.circular(
                          15), // sudut melengkung pada container
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // posisi bayangan
                        ),
                      ],
                    ),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 14,
                      childAspectRatio: 1.0,
                      children: [
                        CustomButton(
                          buttonText: 'Top Up\nE-Money',
                          destination: const TopupemoneyScreen(),
                          color: Colors.teal.shade50,
                          icon: Icons.credit_card_rounded,
                          borderRadius: 50,
                          transitionType: PageTransitionType.fade,
                          iconSize: 30,
                          textSize: 10,
                        ),
                        CustomButton(
                          buttonText: 'Transfer\nHistory',
                          destination: const TransferHistoryScreen(),
                          color: Colors.teal.shade50,
                          icon: Icons.history,
                          borderRadius: 50,
                          transitionType: PageTransitionType.fade,
                          iconSize: 30,
                          textSize: 10,
                        ),
                        CustomButton(
                          buttonText: 'Interbank\nTransfer',
                          destination: const InterbanktransferScreen(),
                          color: Colors.teal.shade50,
                          icon: Icons.account_balance,
                          borderRadius: 50,
                          transitionType: PageTransitionType.fade,
                          iconSize: 30,
                          textSize: 10,
                        ),
                        CustomButton(
                          buttonText: 'Account\nTransfer',
                          destination: const InteraccounttransferScreen(),
                          color: Colors.teal.shade50,
                          icon: Icons.balance,
                          borderRadius: 50,
                          transitionType: PageTransitionType.fade,
                          iconSize: 30,
                          textSize: 10,
                        ),
                        CustomButton(
                          buttonText: 'Virtual\nAccount',
                          destination: const VirtualAccountScreen(),
                          color: Colors.teal.shade50,
                          icon: Icons.account_box,
                          borderRadius: 50,
                          transitionType: PageTransitionType.fade,
                          iconSize: 30,
                          textSize: 10,
                        ),
                        CustomButton(
                          buttonText: 'Bills',
                          destination: const BillsScreen(),
                          color: Colors.teal.shade50,
                          icon: Icons.receipt,
                          borderRadius: 50,
                          transitionType: PageTransitionType.fade,
                          iconSize: 30,
                          textSize: 10,
                        ),
                      ],
                    ),
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
                destination: HomeScreen(),
                color: Color(0xFF7EBDA6),
                icon: Icons.home,
                textColor: Colors.white,
                iconColor: Colors.white,
                usePushReplacement: true,
                iconSize: 25,
                borderRadius: 15,
              ),
            ),
            Flexible(
              child: CustomButton(
                destination: QrisScreen(),
                color: Color(0xFF7EBDA6),
                icon: Icons.qr_code,
                textColor: Colors.white,
                iconColor: Colors.white,
                usePushReplacement: true,
                borderRadius: 15,
                iconSize: 25,
                transitionType: PageTransitionType.slideLeft,
              ),
            ),
            Flexible(
              child: CustomButton(
                destination: NotificationScreen(),
                color: Color(0xFF7EBDA6),
                icon: Icons.notifications,
                textColor: Colors.white,
                iconColor: Colors.white,
                usePushReplacement: true,
                borderRadius: 15,
                iconSize: 25,
                transitionType: PageTransitionType.slideLeft,
              ),
            ),
            Flexible(
              child: CustomButton(
                destination: ProfileScreen(),
                color: Color(0xFF7EBDA6),
                icon: Icons.account_circle_rounded,
                textColor: Colors.white,
                iconColor: Colors.white,
                usePushReplacement: true,
                borderRadius: 15,
                iconSize: 25,
                transitionType: PageTransitionType.slideLeft,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
