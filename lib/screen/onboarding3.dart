import 'package:flutter/material.dart';
import 'package:algo_learn/screen/login.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header: Tombol Back dan Lewati
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      // Aksi ketika tombol kembali ditekan
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      // Aksi ketika tombol Lewati ditekan
                    },
                    child: const Text(
                      'Lewati',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(flex: 1),

              // Judul Utama
              const Text(
                'Capai target dan \n Dapatkan Badge',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.3,
                ),
              ),

              const SizedBox(height: 16),

              // Deskripsi
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Tingkatkan level,kumpulkan XP dan dapatkan badge keren setiap pencapaianmu',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
              ),

              const Spacer(flex: 1),

              // Ilustrasi Gambar
              Center(
                child: Container(
                  height:
                      240, // Sedikit disesuaikan dengan proporsi gambar kedua
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://placeholder.com/illustration2',
                      ), // Ganti dengan local asset kamu
                      fit: BoxFit.contain,
                    ),
                  ),
                  // Placeholder jika gambar belum dimasukkan ke assets
                  child: const Icon(Icons.image, size: 100, color: Colors.grey),
                ),
              ),

              const Spacer(flex: 1),

              // Indikator Halaman (Dot Indicator - Halaman 2 Aktif)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 8, // Lebih panjang karena ini halaman yang aktif
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 24,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),

              const Spacer(flex: 1),

              // Tombol Selanjutnya
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xFF6366F1,
                  ), // Warna ungu/biru sesuai gambar
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Selanjutnya',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
