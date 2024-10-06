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
        backgroundColor: const Color(0xFF7EBDA6),
        title: const Text(
          "Notification",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.5),
          ),
          ListView(
            padding: const EdgeInsets.all(10),
            children: [
              _buildNotificationItem(
                  context, // Pass context here
                  "09/09/24 15:30",
                  "Request to change card due to losing card has been sent. Please wait for further information. We would text you back.",
                  Colors.red[100]!,
                  "Your card replacement request has been processed and will take 3-5 business days."),
              _buildNotificationItem(
                  context,
                  "09/09/24 15:30",
                  "Start at 17.00 untill 19.00, we're on maintanance. App start to use again at 19.05.",
                  Colors.orange[100]!,
                  "The terms and conditions have been updated to enhance the security of your account."),
              _buildNotificationItem(
                  context,
                  "09/09/24 15:30",
                  "Update your application to improve service and security.",
                  Colors.orange[100]!,
                  "Make sure to update the app to the latest version to enjoy new features and enhanced security."),
              _buildNotificationItem(
                  context,
                  "09/09/24 15:30",
                  "Exciting promo! Enjoy Pizza Hut for only 150 thousand using your Sumi Bank debit card.",
                  Colors.green[100]!,
                  "Get a special deal at Pizza Hut using your Sumi Bank debit card for only 150k."),
              _buildNotificationItem(
                  context,
                  "09/09/24 15:30",
                  "Admin fee deduction of 15,000 applied to IRENE CARL LEWIS.",
                  Colors.yellow[100]!,
                  "Admin fee of 15,000 has been deducted from the account of IRENE CARL LEWIS."),
              _buildNotificationItem(
                  context,
                  "09/09/24 15:30",
                  "Buy 1 Get 1 with Sumi Bank debit card at Chatime, available for all variants and sizes.",
                  Colors.green[100]!,
                  "Use your BCA debit card to get Buy 1 Get 1 offers on all Chatime drinks!"),
              _buildNotificationItem(
                  context,
                  "09/09/24 15:30",
                  "Register now with an insurance agent from Sumi Bank",
                  Colors.green[100]!,
                  "Secure your future with Sumi Bank insurance. Contact an agent today for details."),
              _buildNotificationItem(
                  context,
                  "09/09/24 15:30",
                  "Holiday promo at Ayana Resort using Sumi Bank debit card.",
                  Colors.green[100]!,
                  "Enjoy your holiday at Ayana Resort with a special promo using your debit card."),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Color(0xFF7EBDA6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              buttonText: 'Home',
              destination: HomeScreen(),
              color: Color(0xFF7EBDA6),
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
              color: Color(0xFF7EBDA6),
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
              color: Color(0xFF7EBDA6),
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
              color: Color(0xFF7EBDA6),
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

  Widget _buildNotificationItem(BuildContext context, String date,
      String message, Color bgColor, String detailedInfo) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: bgColor.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: ExpansionTile(
            title: Text(
              date,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(message),
            backgroundColor: bgColor,
            maintainState: true,
            collapsedShape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.transparent),
            ),
            shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.transparent),
            ),
            tilePadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(detailedInfo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
