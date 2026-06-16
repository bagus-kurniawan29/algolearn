import 'package:flutter/material.dart';

// ==========================================
// 1. WIDGET KONTEN: TAB PENGURUS PENJELASAN
// ==========================================
class PenjelasanTabContent extends StatelessWidget {
  const PenjelasanTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Penjelasan',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Linear Search adalah algoritma pencarian yang membandingkan setiap elemen dalam array satu per satu secara berurutan sampai elemen yang dicari ditemukan atau sampai akhir array.',
                      style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'Kompleksitas Waktu',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 16),
                    _buildComplexityRow('Best Case', 'O(1)'),
                    _buildComplexityRow('Average Case', 'O(n)'),
                    _buildComplexityRow('Worst Case', 'O(n)'),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // EDIT DI SINI: Aksi mulai latihan sesukamu
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6366F1),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              child: const Text(
                'Mulai Latihan',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildComplexityRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 16, color: Colors.grey),
          children: [
            TextSpan(text: '$label : '),
            TextSpan(text: value, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 2. WIDGET KONTEN: TAB PENGURUS VISUALISASI (FULL INTERAKTIF)
// ==========================================
class VisualisasiTabContent extends StatefulWidget {
  const VisualisasiTabContent({super.key});

  @override
  State<VisualisasiTabContent> createState() => _VisualisasiTabContentState();
}

class _VisualisasiTabContentState extends State<VisualisasiTabContent> {
  // Data array dan angka target sesuai dengan mockup desain kamu
  final List<int> _dataArray = [2, 5, 7, 1, 9, 3, 6];
  final int _target = 7;
  
  // Mengontrol langkah index saat ini (Dimulai dari index 0)
  int _currentIndex = 0; 

  @override
  Widget build(BuildContext context) {
    int currentStep = _currentIndex + 1;
    int currentValue = _dataArray[_currentIndex];
    bool isMatch = currentValue == _target;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Badge Target Angka yang Dicari
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Cari angka; $_target',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
              ),
            ),
            
            const Spacer(flex: 1),

            // Row Container untuk Kotak Angka Visualisasi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(_dataArray.length, (index) {
                bool isActive = index == _currentIndex;

                return Column(
                  children: [
                    // Kotak Elemen Array
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: isActive ? const Color(0xFF6366F1) : const Color(0xFFEEF2FF), // Ungu jika aktif, biru pudar jika tidak
                        borderRadius: BorderRadius.circular(10),
                        border: isActive 
                            ? null 
                            : Border.all(color: const Color(0xFFC7D2FE), width: 1.5),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${_dataArray[index]}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isActive ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Teks Indeks di bawah kotak
                    Text(
                      '$index',
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                    ),
                  ],
                );
              }),
            ),
            
            const Spacer(flex: 1),

            // Indikator Teks Informasi Langkah
            Text(
              'Langkah $currentStep/${_dataArray.length}',
              style: const TextStyle(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            
            // Status Keterangan Proses Pencarian Elemen
            Text(
              isMatch 
                  ? 'Mencari $_target ... Ditemukan pada elemen index $_currentIndex (nilai: $currentValue)'
                  : 'Mencari $_target ... Membandingkan elemen index $_currentIndex (nilai: $currentValue)',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                height: 1.4,
              ),
            ),
            
            const Spacer(flex: 2),

            // Tombol Navigasi Kendali Langkah (Sebelumnya & Berikutnya)
            Row(
              children: [
                // Tombol "Sebelumnya"
                Expanded(
                  child: OutlinedButton(
                    onPressed: _currentIndex > 0 
                        ? () => setState(() => _currentIndex--) 
                        : null, // Disable otomatis jika sudah di index pertama
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: const BorderSide(color: Color(0xFF6366F1), width: 1.5),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text(
                      'Sebelumnya',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF6366F1)),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                
                // Tombol "Berikutnya"
                Expanded(
                  child: ElevatedButton(
                    onPressed: _currentIndex < _dataArray.length - 1 
                        ? () => setState(() => _currentIndex++) 
                        : null, // Disable otomatis jika sudah mencapai ujung akhir array
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6366F1),
                      disabledBackgroundColor: Colors.grey[300],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Berikutnya',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}