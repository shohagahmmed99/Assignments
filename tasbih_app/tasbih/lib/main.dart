import 'package:flutter/material.dart';
import 'package:tasbih/tasbih/tasbih_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TasbihCounter(),
    );
  }
}

