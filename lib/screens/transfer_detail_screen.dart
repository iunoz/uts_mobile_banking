import 'package:flutter/material.dart';

class TransferDetailScreen extends StatefulWidget {
  final String accountName;
  final String accountNumber;

  const TransferDetailScreen({
    super.key,
    required this.accountName,
    required this.accountNumber,
  });

  @override
  State<TransferDetailScreen> createState() => _TransferDetailScreenState();
}

class _TransferDetailScreenState extends State<TransferDetailScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer Details'),
        backgroundColor: const Color(0xFF7EBDA6), // Mengubah warna app bar
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/images/bg.jpg'), // Path ke background image
            fit: BoxFit.cover, // Sesuaikan gambar dengan layar
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Center(
          // Menggunakan Center untuk mengatur posisi
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Pusatkan kolom secara vertikal
            crossAxisAlignment:
                CrossAxisAlignment.center, // Pusatkan kolom secara horizontal
            children: [
              Text(
                'Transfer to ${widget.accountName}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Warna teks tetap hitam
                ),
                textAlign: TextAlign.center, // Pusatkan teks
              ),
              const SizedBox(height: 16),
              Text(
                'Account Number: ${widget.accountNumber}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black, // Warna teks tetap hitam
                ),
                textAlign: TextAlign.center, // Pusatkan teks
              ),
              const SizedBox(height: 24),
              // Container untuk background putih pada input
              Container(
                padding: const EdgeInsets.all(
                    16.0), // Tambahkan padding dalam container
                decoration: BoxDecoration(
                  color: Colors.white, // Ubah background menjadi putih
                  borderRadius: BorderRadius.circular(
                      10), // Tambahkan border radius untuk sudut
                ),
                child: Column(
                  children: [
                    Container(
                      color: Colors
                          .white, // Warna latar belakang putih untuk amount input
                      child: TextField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Amount (Rp)',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      color: Colors
                          .white, // Warna latar belakang putih untuk message input
                      child: TextField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          labelText: 'Message (optional)',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Logika transfer atau validasi bisa ditambahkan di sini
                  if (_amountController.text.isNotEmpty) {
                    // Setelah transfer sukses, kembali ke halaman sebelumnya
                    Navigator.pop(context, true);
                  } else {
                    // Tampilkan pesan jika jumlah uang kosong
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter an amount.'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF7EBDA6), // Mengubah warna tombol
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Tambahkan border radius
                  ),
                ),
                child: const Text(
                  'Send',
                  style: TextStyle(
                    color: Colors.white, // Ubah warna teks menjadi putih
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
