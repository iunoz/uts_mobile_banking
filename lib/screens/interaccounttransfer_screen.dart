import 'package:flutter/material.dart';
import 'transfer_detail_screen.dart'; // Tambahkan import halaman baru

class InteraccounttransferScreen extends StatelessWidget {
  const InteraccounttransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Inter-Account Transfer",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF7EBDA6),
      ),
      body: Stack(
        children: [
          // Latar belakang gambar
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(children: [
              Container(
                color: Colors.white.withOpacity(0.5),
              ),
            ]),
          ),
          SingleChildScrollView(
            // Gunakan SingleChildScrollView di sini
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // List account cards (seperti sebelumnya)
                _buildAccountCard(
                  context,
                  "Ryan Hermanto",
                  "535230147",
                ),
                _buildAccountCard(
                  context,
                  "Irene Carl Lewis",
                  "535230185",
                ),
                _buildAccountCard(
                  context,
                  "Paquita Melawi",
                  "535230062",
                ),
                _buildAccountCard(
                  context,
                  "Panicia",
                  "535230059",
                ),
                _buildAccountCard(
                  context,
                  "Melfanny Leono",
                  "535230152",
                ),
                _buildAccountCard(
                  context,
                  "Gregorius Nathanyel Benedict",
                  "535230114",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membangun kartu akun
  Widget _buildAccountCard(
      BuildContext context, String accountName, String accountNumber) {
    return Card(
      color: Colors.teal.shade50, // Ganti warna kartu menjadi warna baru
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Tambahkan border radius
      ),
      child: ListTile(
        leading: const Icon(Icons.account_circle,
            size: 40, color: Colors.black), // Ganti dengan warna putih
        title: Text(
          accountName,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black), // Ubah warna teks menjadi putih
        ),
        subtitle: Text(
          "Account Number: $accountNumber",
          style: const TextStyle(
              color: Colors.black), // Ubah warna teks menjadi putih
        ),
        trailing: ElevatedButton(
          onPressed: () async {
            // Navigasi ke TransferDetailScreen dan dapatkan hasilnya
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TransferDetailScreen(
                  accountName: accountName,
                  accountNumber: accountNumber,
                ),
              ),
            );

            // Cek jika context masih valid sebelum menggunakannya
            if (context.mounted && result == true) {
              // Tampilkan notifikasi jika transfer berhasil
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Transfer telah berhasil.'),
                ),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(15), // Tambahkan border radius
            ),
            backgroundColor: const Color(0xFF7EBDA6), // Ganti dengan warna baru
          ),
          child: const Text(
            "Transfer",
            style: TextStyle(
              color: Colors.white, // Mengubah warna teks menjadi putih
            ),
          ),
        ),
      ),
    );
  }
}
