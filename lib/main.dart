import 'package:flutter/material.dart';
import 'screen/homescreen.dart'; // Mengimpor file homescreen.dart yang baru dibuat

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Menjadikan HomeScreen sebagai tampilan awal aplikasi
      home: const HomeScreen(), 
    );
  }
}