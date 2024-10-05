import 'package:flutter/material.dart';

class VirtualAccountScreen extends StatelessWidget {
  const VirtualAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "VIRTUAL ACCOUNT",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select Virtual Account:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: const [
                  InstitutionTile(institutionName: 'PLN'),
                  InstitutionTile(institutionName: 'Education'),
                  InstitutionTile(institutionName: 'Telecom'),
                  InstitutionTile(institutionName: 'Tax'),
                  InstitutionTile(institutionName: 'Installments'),
                  InstitutionTile(institutionName: 'Insurance'),
                  InstitutionTile(institutionName: 'PDAM'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InstitutionTile extends StatelessWidget {
  final String institutionName;

  const InstitutionTile({required this.institutionName, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      child: ListTile(
        title: Text(
          institutionName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Navigasi ke detail pembayaran untuk institusi yang dipilih
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PaymentDetailScreen(institutionName: institutionName),
            ),
          );
        },
      ),
    );
  }
}

class PaymentDetailScreen extends StatelessWidget {
  final String institutionName;

  const PaymentDetailScreen({required this.institutionName, super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> virtualAccounts =
        _getVirtualAccounts(institutionName);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment for $institutionName",
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: virtualAccounts.length,
          itemBuilder: (context, index) {
            return VirtualAccountTile(
              institutionName: virtualAccounts[index]['name']!,
              virtualAccountCode: virtualAccounts[index]['code']!,
            );
          },
        ),
      ),
    );
  }

  List<Map<String, String>> _getVirtualAccounts(String institutionName) {
    switch (institutionName) {
      case 'PLN':
        return [
          {'name': 'PLN Jakarta', 'code': '12345'},
          {'name': 'PLN Iconpay', 'code': '67890'},
          {'name': 'PLN Postpaid', 'code': '28790'},
          {'name': 'PLN Batam', 'code': '33456'},
        ];
      case 'Education':
        return [
          {'name': 'Universitas Tarumanagara', 'code': '18888'},
          {'name': 'Universitas Indonesia', 'code': '37483'},
          {'name': 'Universitas Trisakti', 'code': '64222'},
          {'name': 'Universitas Lampung', 'code': '67890'},
          {'name': 'Universitas Esa Unggul', 'code': '29384'},
          {'name': 'Universitas Kristen Indonesia', 'code': '94802'},
        ];
      case 'Telcom':
        return [
          {'name': '3 Pascabayar', 'code': '33333'},
          {'name': 'BBT Ofon', 'code': '44444'},
          {'name': 'Indosat Ooredoo', 'code': '53432'},
          {'name': 'Metra New', 'code': '23456'},
          {'name': 'Smartfren E-SIM', 'code': '98389'},
          {'name': 'Smartfren Pascabayar', 'code': '28934'},
          {'name': 'Teleplus Comunikasi', 'code': '36473'},
        ];
      case 'Tax':
        return [
          {'name': 'PBB DKI', 'code': '12678'},
          {'name': 'Pajak/PNBP/Cukai', 'code': '86539'},
          {'name': 'SAMSAT DIGITAL NASIONAL', 'code': '19902'},
          {'name': 'Tilang KEJARI JAKPUS', 'code': '29034'},
          {'name': 'e-PBB', 'code': '30291'},
          {'name': 'Dishub Kota Palu', 'code': '28491'},
        ];
      case 'Installments':
        return [
          {'name': 'Aeon Card', 'code': '89783'},
          {'name': 'Astra Credit Companies', 'code': '12567'},
          {'name': 'BPR AGUNG SEJAHTERA', 'code': '89076'},
          {'name': 'BPR Artha Galunggung', 'code': '19283'},
          {'name': 'BPR BKK Ungaran', 'code': '67895'},
          {'name': 'BPR Bangunarta', 'code': '34684'},
          {'name': 'BPR Batanghari', 'code': '13478'},
          {'name': 'BPR BKK Jateng', 'code': '35789'},
          {'name': 'BPR Banda Raya', 'code': '34679'},
          {'name': 'BPR GUNUNG RINGGIT', 'code': '46831'},
        ];

      case 'Insurance':
        return [
          {'name': 'AJ CAR 23777, PT', 'code': '20182'},
          {'name': 'ASURANSI UMUM MEGA', 'code': '17893'},
          {'name': 'AVRIST', 'code': '17894'},
          {'name': 'ACA Financial IND', 'code': '78541'},
          {'name': 'ACA Mandiri', 'code': '28109'},
          {'name': 'Allianz Non H2H', 'code': '57834'},
          {'name': 'Askrindo', 'code': '57905'},
          {'name': 'Asuransi Astra', 'code': '34890'},
          {'name': 'Asuransi Bintang, PT', 'code': '21478'},
          {'name': 'Asuransi Wahana Tata. PT', 'code': '47906'},
          {'name': 'Chubb Life Insurance Indonesia, PT', 'code': '13789'},
        ];
      case 'PDAM':
        return [
          {'name': 'Air Bersih', 'code': '30298'},
          {'name': 'PAM Kota Bandung', 'code': '30291'},
          {'name': 'PAM Nasional', 'code': '30982'},
          {'name': 'PDAM Kota Bogor', 'code': '20192'},
          {'name': 'PDAM Kota Surabaya', 'code': '10923'},
          {'name': 'PAM AETRA TANGGERANG', 'code': '45839'},
        ];

      default:
        return [];
    }
  }
}

class VirtualAccountTile extends StatelessWidget {
  final String institutionName;
  final String virtualAccountCode;

  const VirtualAccountTile({
    required this.institutionName,
    required this.virtualAccountCode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      child: ListTile(
        title: Text(
          institutionName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Virtual Account Code: $virtualAccountCode',
          style: const TextStyle(color: Colors.black),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          //Navigasi ke halaman input nomor VA
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VirtualAccountInputScreen(
                institutionName: institutionName,
                virtualAccountCode: virtualAccountCode,
              ),
            ),
          );
        },
      ),
    );
  }
}

class VirtualAccountInputScreen extends StatelessWidget {
  final String institutionName;
  final String virtualAccountCode;

  const VirtualAccountInputScreen({
    required this.institutionName,
    required this.virtualAccountCode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController vaNumberController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Pay $institutionName"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter Virtual Account Number for $institutionName',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: vaNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Virtual Account Number',
                hintText: 'Enter the correct VA number',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String vaNumber = vaNumberController.text;
                if (vaNumber.isNotEmpty) {
                  // Proses pembayaran di sini
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Payment Confirmation'),
                      content: Text(
                          'Are you sure you want to proceed with the payment to $institutionName using the Virtual Account Code: $virtualAccountCode and the entered Virtual Account Number: $vaNumber?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Lanjutkan pembayaran
                            Navigator.pop(context);
                            // Tambahkan logika untuk melanjutkan pembayaran di sini
                          },
                          child: const Text('Continue'),
                        ),
                      ],
                    ),
                  );
                } else {
                  // Feedback jika VA number kosong
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Virtual Account Number cannot be empty'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: const Text('Continue Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
