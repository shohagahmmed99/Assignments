import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class Tasbih extends StatefulWidget {
  const Tasbih({super.key});

  @override
  State<Tasbih> createState() => _TasbihState();
}

class _TasbihState extends State<Tasbih> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [BackButton(), Gap(10), Text("Tasbih Counter")]),
                    Icon(Icons.notifications),
                  ],
                ),
              ),
              Container(
                height: 600,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
               // child: Stack(children: [Image.asset("assets/images/png/Rectangle 1.png")]),
              ),
            ],
          ),
        ),
      ),

      /* appBar:/*  AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 15),
        backgroundColor: Colors.white,
        elevation: 10,
        title: Text("Tasbih Counter"),
        leading: BackButton(),
        actions: [
          Container(
            decoration: BoxDecoration(color: Colors.grey.shade400, shape: BoxShape.circle),
            child: Padding(padding: const EdgeInsets.all(5.0), child: Icon(Icons.notification_important_outlined)),
          ),
        ],
      ),
       */
       */
    );
  }
}
