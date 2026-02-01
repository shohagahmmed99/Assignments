import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Text(
          "Counter",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25, color: Colors.teal),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            spacing: 20,
            mainAxisAlignment: .center,
            children: [
              Container(
                width: 80,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(8),
                  // boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(2, 2))],
                ),
                alignment: Alignment.center,
                child: Text(
                  '$counter',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.teal.shade800),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWidget(
                    title: "Press to increase",
                    icon: Icons.add,
                    onPressed: () {
                      setState(() {
                        counter++;
                      });
                    },
                  ),
                  ButtonWidget(
                    title: "Press to Decrease",
                    icon: Icons.remove,
                    onPressed: () {
                      if (counter > 0) {
                        setState(() {
                          counter--;
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Decreasing Limit is 0")));
                      }
                    },
                  ),
                ],
              ),
              ButtonWidget(
                title: "Press to reset",
                icon: Icons.refresh,
                size: Size(double.infinity, 25),
                onPressed: () {
                  setState(() {
                    counter = 0;
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Counter is reset")));
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.title, required this.icon, required this.onPressed, this.size});
  final VoidCallback onPressed;
  final IconData icon;
  final String title;
  final Size? size;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: size,
        backgroundColor: Colors.teal.shade50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(icon, size: 30, color: Colors.teal.shade800),
            Text(
              title,
              style: TextStyle(color: Colors.teal.shade800, fontWeight: FontWeight.w700, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
