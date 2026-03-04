import 'package:flutter/material.dart';

class TasbihCounter extends StatefulWidget {
  const TasbihCounter({super.key});

  @override
  State<TasbihCounter> createState() => _TasbihCounterState();
}

class _TasbihCounterState extends State<TasbihCounter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Tasbih Counter"),
        actions: [Image.asset("assets/images/png/bell.png")],
      ),
    );
  }
}
