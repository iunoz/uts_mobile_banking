import 'package:flutter/material.dart';
import 'package:uts_mobile_banking/widgets/page_transition.dart';
import 'qris_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import '../widgets/custom_button.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          _buildNotificationItem(
              "09/09/24 15:30",
              "Funds received through BI-Fast service in the amount of 50,000,000 from JAKE SIM",
              Colors.green[100]!),
          _buildNotificationItem(
              "09/09/24 15:30",
              "Transfer successfully made to the account of JENO LEE in the amount of 200,000,000",
              Colors.red[100]!),
          _buildNotificationItem(
              "09/09/24 15:30",
              "Transfer successfully made to the account of KAMARI in the amount of 10,000",
              Colors.orange[100]!),
          _buildNotificationItem(
              "09/09/24 15:30",
              "Transfer successfully made to the account of KAMARI in the amount of 10,000",
              Colors.orange[100]!),
          _buildNotificationItem(
              "09/09/24 15:30",
              "Admin fee deduction of 15,000 applied to IRENE CARL LEWIS",
              Colors.yellow[100]!),
        ],
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
              borderRadius: 18,
              iconSize: 22,
              transitionType: PageTransitionType.slideRight,
            ),
            CustomButton(
              buttonText: 'QRIS',
              destination: QrisScreen(),
              color: Colors.teal,
              icon: Icons.qr_code,
              textColor: Colors.white,
              iconColor: Colors.white,
              usePushReplacement: true,
              borderRadius: 18,
              iconSize: 22,
              transitionType: PageTransitionType.slideRight,
            ),
            CustomButton(
              buttonText: 'Notif',
              destination: NotificationScreen(),
              color: Colors.teal,
              icon: Icons.notifications,
              textColor: Colors.white,
              iconColor: Colors.white,
              usePushReplacement: true,
              iconSize: 22,
              borderRadius: 18,
            ),
            CustomButton(
              buttonText: 'Profile',
              destination: ProfileScreen(),
              color: Colors.teal,
              icon: Icons.account_circle_rounded,
              textColor: Colors.white,
              iconColor: Colors.white,
              usePushReplacement: true,
              borderRadius: 18,
              iconSize: 22,
              transitionType: PageTransitionType.slideLeft,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem(String date, String message, Color bgColor) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(date, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(message),
        ],
      ),
    );
  }
}
