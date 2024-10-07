import 'package:flutter/material.dart';
import '../widgets/emoney_option.dart';

class TopupemoneyScreen extends StatefulWidget {
  const TopupemoneyScreen({super.key});

  @override
  TopupemoneyScreenState createState() => TopupemoneyScreenState();
}

class TopupemoneyScreenState extends State<TopupemoneyScreen> {
  String selectedEmoney = '';
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController topUpAmountController = TextEditingController();

  void selectEmoney(String name) {
    setState(() {
      selectedEmoney = name;
    });
  }

  void confirmTopUp() {
    String phoneNumber = phoneController.text;
    String topUpAmount = topUpAmountController.text;
    if (selectedEmoney.isEmpty || phoneNumber.isEmpty || topUpAmount.isEmpty) {
      _showAlertDialog("Can Not Process",
          "Please select e-money and input phone number or code");
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Top Up"),
          content: Text(
              "Are you sure you want to top up $topUpAmount using $selectedEmoney for number $phoneNumber?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showPinDialog();
              },
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  void _showPinDialog() {
    final TextEditingController pinController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Enter your ATM PIN:"),
              const SizedBox(height: 10),
              TextField(
                controller: pinController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter PIN",
                ),
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                String pin = pinController.text;
                if (pin.isNotEmpty) {
                  Navigator.of(context).pop();
                  _showAlertDialog(
                    'Success!',
                    'Top up using in amount ${topUpAmountController.text} for $selectedEmoney for number ${phoneController.text} succeeded',
                  );
                  _resetForm();
                } else {
                  _showAlertDialog(
                      'Can Not Process', 'Please enter a valid PIN.');
                }
              },
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  void _resetForm() {
    setState(() {
      selectedEmoney = '';
      phoneController.clear();
      topUpAmountController.clear();
    });
  }

  void _showAlertDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
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
        backgroundColor: const Color(0xFF7EBDA6),
        title: const Text(
          "Top Up E Money",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.5),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 350,
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: [
                        EmoneyOption(
                          name: "ShopeePay",
                          imagePath: "assets/images/spay.jpg",
                          onTap: () => selectEmoney("ShopeePay"),
                          isSelected: selectedEmoney == "ShopeePay",
                        ),
                        EmoneyOption(
                          name: "DANA",
                          imagePath: "assets/images/dana.png",
                          onTap: () => selectEmoney("DANA"),
                          isSelected: selectedEmoney == "DANA",
                        ),
                        EmoneyOption(
                          name: "Gopay",
                          imagePath: "assets/images/gopay.png",
                          onTap: () => selectEmoney("Gopay"),
                          isSelected: selectedEmoney == "Gopay",
                        ),
                        EmoneyOption(
                          name: "AstraPay",
                          imagePath: "assets/images/astrapay.jpg",
                          onTap: () => selectEmoney("AstraPay"),
                          isSelected: selectedEmoney == "AstraPay",
                        ),
                        EmoneyOption(
                          name: "OVO",
                          imagePath: "assets/images/ovo.png",
                          onTap: () => selectEmoney("OVO"),
                          isSelected: selectedEmoney == "OVO",
                        ),
                        EmoneyOption(
                          name: "I.Saku",
                          imagePath: "assets/images/i.saku.png",
                          onTap: () => selectEmoney("I.Saku"),
                          isSelected: selectedEmoney == "I.Saku",
                        ),
                        EmoneyOption(
                          name: "Link Aja",
                          imagePath: "assets/images/linkaja.png",
                          onTap: () => selectEmoney("Link Aja"),
                          isSelected: selectedEmoney == "Link Aja",
                        ),
                        EmoneyOption(
                          name: "eTOLL",
                          imagePath: "assets/images/etoll.png",
                          onTap: () => selectEmoney("eTOLL"),
                          isSelected: selectedEmoney == "eTOLL",
                        ),
                        EmoneyOption(
                          name: "Flazz",
                          imagePath: "assets/images/flazz.png",
                          onTap: () => selectEmoney("Flazz"),
                          isSelected: selectedEmoney == "Flazz",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      labelText: "Input phone number/code:",
                      labelStyle: TextStyle(
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: "Example: 085212345679",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: topUpAmountController,
                    decoration: const InputDecoration(
                      labelText: "Input amount to top-up:",
                      labelStyle: TextStyle(
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: "Example: 100000",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: confirmTopUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7EBDA6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                      ),
                      child: const Text(
                        "Confirm for Top Up",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
