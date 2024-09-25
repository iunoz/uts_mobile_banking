import 'package:flutter/material.dart';
import 'package:uts_mobile_banking/screens/bills_screen.dart';
import 'package:uts_mobile_banking/screens/interaccountTransfer_screen.dart';
import 'package:uts_mobile_banking/screens/interbanktransfer_screen.dart';
import 'package:uts_mobile_banking/screens/qris_screen.dart';
import 'package:uts_mobile_banking/screens/topupemoney_screen.dart';
import 'package:uts_mobile_banking/screens/transferhistory_screen.dart';
import 'package:uts_mobile_banking/screens/virtualaccount_screen.dart';
import '../widgets/custom_button.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';
import 'balance_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool _isBalanceHidden = true;

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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: const Color.fromARGB(255, 249, 234, 234),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome Back,',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Gregorius Nathanyel Benedict',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text(
                          'Rp',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 10),
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
                                ? Icons
                                    .visibility_off // Show "eye closed" icon if balance is hidden
                                : Icons
                                    .visibility, // Show "eye open" icon if balance is visible
                          ),
                          onPressed: () {
                            setState(() {
                              _isBalanceHidden =
                                  !_isBalanceHidden; // Toggle the balance visibility
                            });
                          },
                        ),
                      ],
                    ),
                    const CustomButton(
                      buttonText: 'More',
                      destination: BalanceScreen(),
                      color: Color.fromARGB(255, 249, 234, 234),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, //buat 2 kolom
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: const [
                  // Tombol untuk ChangeCardScreen
                  CustomButton(
                    buttonText: 'Top Up E-Money',
                    destination: TopupemoneyScreen(),
                    color: Color.fromARGB(255, 192, 248, 214),
                    icon: Icons.credit_card_rounded,
                  ),
                  // Tombol untuk NotificationScreen
                  CustomButton(
                    buttonText: 'Transfer History',
                    destination: TransferHistoryScreen(),
                    color: Color.fromARGB(255, 192, 248, 214),
                    icon: Icons.history,
                  ),
                  // Tombol untuk ProfileScreen
                  CustomButton(
                    buttonText: 'Interbank Transfer',
                    destination: InterbanktransferScreen(),
                    color: Color.fromARGB(255, 192, 248, 214),
                    icon: Icons.account_balance,
                  ),
                  CustomButton(
                    buttonText: 'Inter-account Transfer',
                    destination: InteraccounttransferScreen(),
                    color: Color.fromARGB(255, 192, 248, 214),
                    icon: Icons.balance,
                  ),
                  CustomButton(
                    buttonText: 'Virtual Account',
                    destination: VirtualaccountScreen(),
                    color: Color.fromARGB(255, 192, 248, 214),
                    icon: Icons.account_box,
                  ),
                  CustomButton(
                    buttonText: 'Bills',
                    destination: BillsScreen(),
                    color: Color.fromARGB(255, 192, 248, 214),
                    icon: Icons.receipt,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.teal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              buttonText: 'Home',
              destination: HomeScreen(),
              color: Colors.teal,
              icon: Icons.home,
              textColor: Colors.white,
              iconColor: Colors.white,
              usePushReplacement: true,
            ),
            CustomButton(
              buttonText: 'QRIS',
              destination: QrisScreen(),
              color: Colors.teal,
              icon: Icons.qr_code,
              textColor: Colors.white,
              iconColor: Colors.white,
              usePushReplacement: true,
            ),
            CustomButton(
              buttonText: 'Notif',
              destination: NotificationScreen(),
              color: Colors.teal,
              icon: Icons.notifications,
              textColor: Colors.white,
              iconColor: Colors.white,
              usePushReplacement: true,
            ),
            CustomButton(
              buttonText: 'Profile',
              destination: ProfileScreen(),
              color: Colors.teal,
              icon: Icons.account_circle_rounded,
              textColor: Colors.white,
              iconColor: Colors.white,
              usePushReplacement: true,
            ),
          ],
        ),
      ),
    );
  }
}
