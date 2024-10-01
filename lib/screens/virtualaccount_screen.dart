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
            fontSize: 18,
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
              'Pilih Kode Virtual Account:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: const [
                  VirtualAccountTile(
                    institutionName: 'PLN',
                    virtualAccountCode: '12345',
                  ),
                  VirtualAccountTile(
                    institutionName: 'Telkom',
                    virtualAccountCode: '56789',
                  ),
                  VirtualAccountTile(
                    institutionName: 'Pendidikan',
                    virtualAccountCode: '18888',
                  ),
                  VirtualAccountTile(
                    institutionName: 'Pajak',
                    virtualAccountCode: '989898',
                  ),
                  VirtualAccountTile(
                    institutionName: 'Angsuran',
                    virtualAccountCode: '535230',
                  ),
                  VirtualAccountTile(
                    institutionName: 'Asuransi',
                    virtualAccountCode: '36789',
                  ),
                  VirtualAccountTile(
                    institutionName: 'PDAM',
                    virtualAccountCode: '89763',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VirtualAccountTile extends StatelessWidget {
  final String institutionName;
  final String virtualAccountCode;

  const VirtualAccountTile({
    required this.institutionName,
    required this.virtualAccountCode,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.account_balance_wallet,
          color: Colors.teal,
        ),
        title: Text(
          institutionName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Kode Virtual Account: $virtualAccountCode'),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.teal),
        onTap: () {
          // Ketika dipilih, pengguna akan diarahkan ke halaman input nomor VA
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VirtualAccountDetailScreen(
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

class VirtualAccountDetailScreen extends StatelessWidget {
  final String institutionName;
  final String virtualAccountCode;

  const VirtualAccountDetailScreen({
    required this.institutionName,
    required this.virtualAccountCode,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _vaNumberController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bayar $institutionName",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
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
            Text(
              'Masukkan Nomor Virtual Account untuk $institutionName',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _vaNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Nomor Virtual Account',
                hintText: 'Masukkan nomor VA yang sesuai',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                String vaNumber = _vaNumberController.text;
                if (vaNumber.isNotEmpty) {
                  // Lakukan proses pembayaran di sini
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Konfirmasi Pembayaran'),
                      content: Text(
                        'Anda akan melakukan pembayaran ke $institutionName dengan kode VA: $virtualAccountCode dan nomor VA: $vaNumber',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Batal'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Lanjutkan pembayaran
                            Navigator.pop(context);
                          },
                          child: const Text('Lanjutkan'),
                        ),
                      ],
                    ),
                  );
                } else {
                  // Jika VA number kosong, berikan feedback kepada pengguna
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Nomor Virtual Account tidak boleh kosong'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: const Text(
                'Lanjutkan Pembayaran',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
