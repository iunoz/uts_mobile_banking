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
import 'notification_screen.dart';
import 'profile_screen.dart';
import 'balance_screen.dart';

class HomeScreen extends StatefulWidget {
  final bool showAnimation; //parameter buat mengkontrol animation
  const HomeScreen(
      {super.key, this.showAnimation = false}); //buat default jd false

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
        backgroundColor: Colors.teal,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  color: const Color.fromARGB(255, 249, 234, 234),
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
                          color: Color.fromARGB(255, 249, 234, 234),
                          borderRadius: 20,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 14, // jarak antar tombol vertikal
                    crossAxisSpacing: 14, // jarak antar tombol horizontal
                    childAspectRatio: 1.3,
                    children: const [
                      CustomButton(
                        buttonText: 'Top Up E-Money',
                        destination: TopupemoneyScreen(),
                        color: Color.fromARGB(255, 192, 248, 214),
                        icon: Icons.credit_card_rounded,
                        borderRadius: 35,
                        transitionType: PageTransitionType.fade,
                        iconSize: 26,
                        textSize: 15,
                      ),
                      CustomButton(
                        buttonText: 'Transfer History',
                        destination: TransferHistoryScreen(),
                        color: Color.fromARGB(255, 192, 248, 214),
                        icon: Icons.history,
                        borderRadius: 35,
                        transitionType: PageTransitionType.fade,
                        iconSize: 26,
                        textSize: 15,
                      ),
                      CustomButton(
                        buttonText: 'Interbank Transfer',
                        destination: InterbanktransferScreen(),
                        color: Color.fromARGB(255, 192, 248, 214),
                        icon: Icons.account_balance,
                        borderRadius: 35,
                        transitionType: PageTransitionType.fade,
                        iconSize: 26,
                        textSize: 15,
                      ),
                      CustomButton(
                        buttonText: 'Account Transfer',
                        destination: InteraccounttransferScreen(),
                        color: Color.fromARGB(255, 192, 248, 214),
                        icon: Icons.balance,
                        borderRadius: 35,
                        transitionType: PageTransitionType.fade,
                        iconSize: 26,
                        textSize: 15,
                      ),
                      CustomButton(
                        buttonText: 'Virtual Account',
                        destination: VirtualAccountScreen(),
                        color: Color.fromARGB(255, 192, 248, 214),
                        icon: Icons.account_box,
                        borderRadius: 35,
                        transitionType: PageTransitionType.fade,
                        iconSize: 26,
                        textSize: 15,
                      ),
                      CustomButton(
                        buttonText: 'Bills',
                        destination: BillsScreen(),
                        color: Color.fromARGB(255, 192, 248, 214),
                        icon: Icons.receipt,
                        borderRadius: 35,
                        transitionType: PageTransitionType.fade,
                        iconSize: 26,
                        textSize: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (_showAnimation)
            Positioned.fill(
              child: Container(
                color: Colors.transparent,
                child: const AnimationLottie(
                  animationPath:
                      'assets/animations/confetti.json', // Specify your animation file path
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.teal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: CustomButton(
                buttonText: 'Home',
                destination: HomeScreen(),
                color: Colors.teal,
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
                color: Colors.teal,
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
                color: Colors.teal,
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
                color: Colors.teal,
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
