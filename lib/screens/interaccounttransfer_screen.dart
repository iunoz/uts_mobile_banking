import 'package:flutter/material.dart';
import 'transfer_detail_screen.dart'; // Tambahkan import halaman baru

class InteraccounttransferScreen extends StatelessWidget {
  const InteraccounttransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Inter-account Transfer",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF7EBDA6), // Ganti dengan warna baru
      ),
      body: Container(
        // Tambahkan background image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'), // Path ke background image
            fit: BoxFit.cover, // Sesuaikan gambar dengan layar
          ),
        ),
        child: SingleChildScrollView( // Gunakan SingleChildScrollView di sini
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
      ),
    );
  }

  // Fungsi untuk membangun kartu akun
  Widget _buildAccountCard(BuildContext context, String accountName, String accountNumber) {
    return Card(
      color: Colors.grey[200],
      child: ListTile(
        leading: const Icon(Icons.account_circle, size: 40, color: Color(0xFF7EBDA6)), // Ganti dengan warna baru
        title: Text(
          accountName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("Account Number: $accountNumber"),
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

            if (result == true) {
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
              borderRadius: BorderRadius.circular(0), // Persegi panjang
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
