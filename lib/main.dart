import 'package:flutter/material.dart';
import 'package:tasbih/photo_gallery.dart';
import 'package:tasbih/tasbih.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: PhotoGallery(), debugShowCheckedModeBanner: false);
  }
}
