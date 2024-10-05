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

  void selectEmoney(String name) {
    setState(() {
      selectedEmoney = name;
    });
  }

  void confirmTopUp() {
    String phoneNumber = phoneController.text;
    if (selectedEmoney.isEmpty || phoneNumber.isEmpty) {
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
              "Are you sure you want to top up using $selectedEmoney for number $phoneNumber?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); //tutup window setelah tekan cancel
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // tutup dialog setelah tekan confirm
                _showPinDialog(); // tampilkan dialog input pin setelah tekan confirm
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
                obscureText: true, // supaya pin atm yg diinput ga keliatan
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // kalo tekan cancel, maka window input pin akan ditutup
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                String pin = pinController.text;
                if (pin.isNotEmpty) {
                  Navigator.of(context)
                      .pop(); // tutup window pin setelah input pin dan tekan confirm
                  _showAlertDialog(
                    // menampilkan window sukses top up setelah tekan confirm
                    'Success!',
                    'Top up using $selectedEmoney for number ${phoneController.text} successed',
                  );
                } else {
                  _showAlertDialog('Can Not Proccess',
                      'Please enter a valid PIN.'); // tampilkan window error jika pin tidak diinput
                }
              },
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
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
        title: const Text('Top up e-money'),
        backgroundColor: const Color(0xFF7EBDA6),
      ),
      body: Container(
        color: const Color.fromARGB(255, 229, 249, 246),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Expanded(
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
            const SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF7EBDA6),
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Input phone number/code:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Example: 085212345679",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: confirmTopUp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7EBDA6),
                ),
                child: const Text(
                  "Confirm for Top Up",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
