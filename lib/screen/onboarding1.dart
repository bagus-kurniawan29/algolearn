import 'package:flutter/material.dart';
import 'package:algo_learn/screen/onboarding2.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

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
                'Belajar Algoritma\nLebih Mudah',
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
                  'Materi terstruktur dari dasar hingga mahir dengan penjelasan yang mudah dipahami.',
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
              // Catatan: Ganti dengan Image.asset('assets/onboarding_img.png') jika sudah ada gambarnya
              Center(
                child: Container(
                  height: 220,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://placeholder.com/illustration',
                      ), // Ganti dengan local asset kamu
                      fit: BoxFit.contain,
                    ),
                  ),
                  // Placeholder jika gambar belum dimasukkan ke assets
                  child: const Icon(Icons.image, size: 100, color: Colors.grey),
                ),
              ),

              const Spacer(flex: 1),

              // Indikator Halaman (Dot Indicator)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 24,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 8),
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
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
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
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const Onboarding2(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            // Menggunakan FadeTransition untuk efek memudar
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                      // Mengatur durasi animasi fade (misal: 400 milidetik)
                      transitionDuration: const Duration(milliseconds: 400),
                    ),
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
