import 'package:flutter/material.dart';
import 'package:uts_mobile_banking/screens/block_card_screen.dart';
import 'package:uts_mobile_banking/widgets/page_transition.dart';
import 'login_screen.dart';
import 'change_pin.dart'; // Import halaman change_pin
import 'changecard_screen.dart';
import 'setlimit_screen.dart';
import '../widgets/custom_button.dart';
import 'qris_screen.dart';
import 'notification_screen.dart';
import 'home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _showLogoutConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout Confirmation"),
          content: const Text("Do you want to log out?"),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 98, 98, 98),
                foregroundColor: Colors.white,
              ),
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text("Log Out"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (Route<dynamic> route) => false,
                );
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
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF7EBDA6),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _showLogoutConfirmationDialog();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Container(
                color: Colors.white.withOpacity(0.5),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Card information
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.teal.shade50,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Card type
                            const Text(
                              "Card Type",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),

                            // Card name
                            const Text(
                              "EMERALD Debit",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),

                            // Card image
                            const SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors
                                    .white, // Add a background color if needed
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 5,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              clipBehavior:
                                  Clip.antiAlias, // Untuk sisi rounded
                              child: Image.asset(
                                'assets/images/kartudebit.png',
                                fit: BoxFit.cover,
                              ),
                            ),

                            // Cardholder name
                            const SizedBox(height: 20),
                            const Text(
                              "Cardholder Name",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),

                            // Cardholder name value
                            const Text(
                              "Gregorius Nathanyel Benedict",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),

                            // Card number
                            const SizedBox(height: 20),
                            const Text(
                              "Card Number",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),

                            // Card number value
                            const Text(
                              "1234 5678 9123 4567",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Actions Row
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: _buildActionColumn(
                              icon: Icons.attach_money,
                              label: "Set\nLimit",
                              color: const Color(0xFF02854f),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SetLimitScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 16), // Space between columns
                          Expanded(
                            child: _buildActionColumn(
                              icon: Icons.block,
                              label: "Block\nCard",
                              color: const Color(0xFFd8210b),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const BlockCardScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 16), // Space between columns
                          Expanded(
                            child: _buildActionColumn(
                              icon: Icons.credit_card,
                              label: "Change Card",
                              color: const Color(0xFFd99a3d),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ChangeCardScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 16), // Space between columns
                          Expanded(
                            child: _buildActionColumn(
                              icon: Icons.lock,
                              label: "Change Pin",
                              color: const Color(0xFF009baa),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ChangePinScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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

Column _buildActionColumn({
  required IconData icon,
  required String label,
  required Color color,
  required VoidCallback onTap,
}) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          color: color.withOpacity(0.2),
          border: Border.all(
            color: color,
            width: 1,
          ),
        ),
        child: IconButton(
          onPressed: onTap,
          icon: Icon(icon),
          color: color,
          iconSize: 24,
          padding: const EdgeInsets.all(12),
        ),
      ),
      const SizedBox(height: 5),
      Text(
        label,
        style: TextStyle(
          color: color,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );
}
