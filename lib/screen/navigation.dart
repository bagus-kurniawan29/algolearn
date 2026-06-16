import 'package:flutter/material.dart';
// Pastikan import path ke file detail_materi kamu sudah benar
import 'package:algo_learn/screen/detail_materi.dart'; 

class NavigationMateri extends StatelessWidget {
  const NavigationMateri({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Jumlah tab menu (Penjelasan, Visualisasi, Contoh)
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
            onPressed: () {
              Navigator.pop(context); // Kembali ke halaman pilihan materi
            },
          ),
          title: const Text(
            'Linear Search',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
          bottom: const TabBar(
            labelColor: Color(0xFF6366F1), // Warna teks saat aktif
            unselectedLabelColor: Colors.grey, // Warna teks saat tidak aktif
            indicatorColor: Color(0xFF6366F1), // Warna garis bawah aktif
            indicatorWeight: 3,
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            tabs: [
              Tab(text: 'Penjelasan'),
              Tab(text: 'Visualisasi'),
              Tab(text: 'Contoh'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // 1. Tampilan untuk Tab Penjelasan
            PenjelasanTabContent(),
            
            // 2. Tampilan untuk Tab Visualisasi (Memanggil dari detail_materi.dart)
            VisualisasiTabContent(),
            
            // 3. Tampilan untuk Tab Contoh
            Center(child: Text('Halaman Contoh')),
          ],
        ),
      ),
    );
  }
}