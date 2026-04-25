import 'package:flutter/material.dart';
import 'screens_user/home/home_screen.dart'; // ✅ sửa dòng này

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AINews',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
