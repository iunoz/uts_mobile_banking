import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
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
    );
  }

  Widget _buildNotificationItem(String date, String message, Color bgColor) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(date, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(message),
        ],
      ),
    );
  }
}
