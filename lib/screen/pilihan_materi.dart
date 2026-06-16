import 'package:flutter/material.dart';
import 'package:algo_learn/screen/detail_materi.dart';

// 1. Model Data untuk menampung informasi setiap materi
class MateriItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconBgColor;

  MateriItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconBgColor,
  });
}

class PilihanMateri extends StatelessWidget {
  const PilihanMateri({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. List data materi sesuai gambar desain kamu
    final List<MateriItem> daftarMateri = [
      MateriItem(
        title: 'Dasar Algoritma',
        subtitle: '12 Materi',
        icon: Icons.article_rounded,
        iconBgColor: const Color(0xFF6366F1), // Ungu/Biru
      ),
      MateriItem(
        title: 'Peseudocode',
        subtitle: '8 Materi',
        icon: Icons.code_rounded,
        iconBgColor: const Color(0xFFFFB74D), // Orange
      ),
      MateriItem(
        title: 'Searching',
        subtitle: '10 Materi',
        icon: Icons.search_rounded,
        iconBgColor: const Color(0xFF26A69A), // Hijau Toska
      ),
      MateriItem(
        title: 'Sorting',
        subtitle: '12 Materi',
        icon: Icons.unfold_more_rounded,
        iconBgColor: const Color(0xFF7E57C2), // Ungu terang
      ),
      MateriItem(
        title: 'Struktur Data',
        subtitle: '15 Materi',
        icon: Icons.bar_chart_rounded,
        iconBgColor: const Color(0xFF5C6BC0), // Indigo
      ),
      MateriItem(
        title: 'Recursion',
        subtitle: '9 Materi',
        icon: Icons.grid_view_rounded,
        iconBgColor: const Color(0xFF3F51B5), // Biru tua
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(
        0xFFF5F6F8,
      ), // Background abu-abu muda sesuai UI
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // Judul Utama Halaman
              const Text(
                'Pilih materi',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 24),

              // List Materi yang bisa di-scroll jika datanya banyak
              Expanded(
                child: ListView.builder(
                  itemCount: daftarMateri.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = daftarMateri[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 12.0,
                          ),
                          // Bagian Kiri: Kotak Icon Berwarna
                          leading: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: item.iconBgColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              item.icon,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          // Bagian Tengah: Judul Materi (BAGIAN YANG TERPOTONG TADI)
                          title: Text(
                            item.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight
                                  .w600, // Ketebalan semi-bold sesuai UI
                              color: Colors.black,
                            ),
                          ),
                          // Bagian Tengah Bawah: Jumlah Materi
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              item.subtitle,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                          // Aksi klik pada card materi
                          onTap: () {
                            // TODO: Tambahkan navigasi ke detail materi di sini
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
