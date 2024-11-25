import 'package:flutter/material.dart';
import 'package:toko_kita/ui/registrasi_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Toko Kita',
      debugShowCheckedModeBanner: false,
      home: RegistrasiPage(),
    );
  }
}
