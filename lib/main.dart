import 'package:flutter/material.dart';
import 'package:algo_learn/screen/navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug merah di pojok kanan atas
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // PERBAIKAN: Tambahkan kata 'const' di depan PilihanMateriPage() agar error merahnya hilang
      home: const NavigationMateri(),
    );
  }
}