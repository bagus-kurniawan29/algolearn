import 'package:flutter/material.dart';

class DetailMateri extends StatefulWidget {
  const DetailMateri({super.key});

  @override
  State<DetailMateri> createState() => _DetailMateriState();
}

class _DetailMateriState extends State<DetailMateri> {
  // --- Data untuk State Visualisasi ---
  final List<int> _arrayData = [2, 5, 7, 1, 9, 3, 6];
  final int _targetData = 7;
  
  // Index langkah visualisasi saat ini (0 sampai _arrayData.length - 1)
  int _currentStepIndex = 2; // Default diatur ke index 2 sesuai gambar contoh

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1, // Otomatis membuka tab 'Visualisasi' terlebih dahulu untuk testing
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
            onPressed: () => Navigator.pop(context),
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
            labelColor: Color(0xFF6366F1),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xFF6366F1),
            indicatorWeight: 3,
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            tabs: [
              Tab(text: 'Penjelasan'),
              Tab(text: 'Visualisasi'),
              Tab(text: 'Contoh'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // 1. Konten Tab Penjelasan
            const PenjelasanTabContent(),
            
            // 2. Konten Tab Visualisasi Interaktif
            _buildVisualisasiTab(),
            
            // 3. Konten Tab Contoh
            const Center(child: Text('Halaman Contoh')),
          ],
        ),
      ),
    );
  }

  // --- Widget Tampilan Tab Visualisasi ---
  Widget _buildVisualisasiTab() {
    int currentStepNumber = _currentStepIndex + 1;
    int currentValue = _arrayData[_currentStepIndex];
    bool isFound = currentValue == _targetData;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Badge Cari Angka
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Cari angka; $_targetData',
                style: const TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.w600, 
                  color: Colors.black
                ),
              ),
            ),
            const Spacer(flex: 2),

            // Row Kotak Array Angka beserta Index-nya
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(_arrayData.length, (index) {
                // Menentukan warna kotak berdasarkan langkah pencarian
                bool isCurrentSearch = index == _currentStepIndex;
                Color boxColor = isCurrentSearch 
                    ? const Color(0xFF6366F1) // Ungu jika sedang ditunjuk
                    : const Color(0xFFEEF2FF); // Biru muda pudar untuk kotak lain
                
                Color textColor = isCurrentSearch ? Colors.white : Colors.black;
                BorderSide borderStyle = isCurrentSearch 
                    ? BorderSide.none 
                    : const BorderSide(color: Color(0xFFC7D2FE), width: 1.5);

                return Column(
                  children: [
                    // Kotak Angka
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: boxColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.fromBorderSide(borderStyle),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${_arrayData[index]}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Indeks Angka (0, 1, 2...)
                    Text(
                      '$index',
                      style: const TextStyle(
                        fontSize: 14, 
                        fontWeight: FontWeight.w500, 
                        color: Colors.black
                      ),
                    ),
                  ],
                );
              }),
            ),
            const Spacer(flex: 2),

            // Teks Status Langkah Pencarian
            Text(
              'Langkah $currentStepNumber/${_arrayData.length}',
              style: const TextStyle(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            
            // Detail Deskripsi Pencarian
            Text(
              isFound 
                  ? 'Mencari $_targetData ... Ditemukan pada elemen index $_currentStepIndex (nilai: $currentValue)'
                  : 'Mencari $_targetData ... Membandingkan elemen index $_currentStepIndex (nilai: $currentValue)',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                height: 1.4,
              ),
            ),
            const Spacer(flex: 3),

            // Navigasi Tombol Sebelumnya & Berikutnya
            Row(
              children: [
                // Tombol Sebelumnya
                Expanded(
                  child: OutlinedButton(
                    onPressed: _currentStepIndex > 0 
                        ? () => setState(() => _currentStepIndex--) 
                        : null, // Disable jika di awal data
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
                
                // Tombol Berikutnya
                Expanded(
                  child: ElevatedButton(
                    onPressed: _currentStepIndex < _arrayData.length - 1 
                        ? () => setState(() => _currentStepIndex++) 
                        : null, // Disable jika di akhir data
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

// --- Konten Pengisi Tab Penjelasan ---
class PenjelasanTabContent extends StatelessWidget {
  const PenjelasanTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Penjelasan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  const Text(
                    'Linear Search adalah algoritma pencarian yang membandingkan setiap elemen dalam array satu per satu secara berurutan sampai elemen yang dicari ditemukan atau sampai akhir array.',
                    style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
                  ),
                  const SizedBox(height: 40),
                  const Text('Kompleksitas Waktu', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  _buildRow('Best Case', 'O(1)'),
                  _buildRow('Average Case', 'O(n)'),
                  _buildRow('Worst Case', 'O(n)'),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6366F1),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 0,
            ),
            child: const Text('Mulai Latihan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value) {
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