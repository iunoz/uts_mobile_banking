import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bills App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: BillsScreen(),
    );
  }
}

class BillsScreen extends StatelessWidget {
  const BillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bills"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          children: [
            buildBillCard(context, FontAwesomeIcons.bolt, 'Electricity', true),
            buildBillCard(context, FontAwesomeIcons.tint, 'Water', true),
            buildBillCard(
                context, FontAwesomeIcons.fileInvoiceDollar, 'Tax', false),
            buildBillCard(context, FontAwesomeIcons.school, 'School', true),
            buildBillCard(context, FontAwesomeIcons.phone, 'Home Phone', false),
            buildBillCard(context, FontAwesomeIcons.hospital, 'BPJS', true),
          ],
        ),
      ),
    );
  }

  Card buildBillCard(
      BuildContext context, IconData icon, String title, bool hasBill) {
    return Card(
      child: GestureDetector(
        onTap: () {
          print("Tapped on: $title, hasBill: $hasBill"); // Debugging print
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(hasBill ? 'Bill Details' : 'No Bills'),
                content: Text(hasBill
                    ? 'Here are the details for $title.'
                    : 'There are no bills for $title.'),
                actions: <Widget>[
                  TextButton(
                    child: Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(icon, size: 50, color: Colors.blue),
            SizedBox(height: 10),
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
