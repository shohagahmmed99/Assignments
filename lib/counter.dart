import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int counter = 0;
  String onPressed = "white";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        title: Text(
          "Counter",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25, color: Colors.indigo.shade800),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.purple.shade200),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Current Value",
                      style: TextStyle(color: Colors.indigo.shade600, fontWeight: FontWeight.w600, fontSize: 19),
                    ),

                    Text(
                      '$counter',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: (onPressed == "green")
                            ? Colors.green
                            : (onPressed == "Blue")
                            ? Colors.blue
                            : Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWidget(
                    //  size: Size(300, 25),
                    //title: "Increase",
                    text: Text(
                      "Increase",
                      style: TextStyle(color: (onPressed == "green") ? Colors.white : Colors.indigo.shade600),
                    ),
                    color: (onPressed == "green") ? Colors.green : Colors.white,
                    icon: Icon(Icons.add, color: (onPressed == "green") ? Colors.white : Colors.indigo.shade600),
                    // Icons.add,
                    onPressed: () {
                      onPressed = "green";
                      setState(() {
                        counter++;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  ButtonWidget(
                    // size: Size(300, 25),
                    // title: " Decrease",
                    text: Text(
                      "Decrease",
                      style: TextStyle(color: (onPressed == "Blue") ? Colors.white : Colors.indigo.shade600),
                    ),
                    icon: Icon(Icons.remove, color: (onPressed == "Blue") ? Colors.white : Colors.indigo.shade600),

                    //Icons.remove,
                    color: (onPressed == "Blue") ? Colors.blue : Colors.white,
                    onPressed: () {
                      onPressed = "Blue";
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
                // title: "Reset",
                text: Text(
                  "Reset",
                  style: TextStyle(color: (onPressed == "Red") ? Colors.white : Colors.indigo.shade600),
                ),
                icon: Icon(Icons.refresh, color: (onPressed == "Red") ? Colors.white : Colors.indigo.shade600),
                size: Size(double.infinity, 25),
                color: (onPressed == "Red") ? Colors.redAccent : Colors.white,
                onPressed: () {
                  onPressed = "Red";
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
  const ButtonWidget({
    super.key,
    // required this.title,
    //required this.icon,
    required this.onPressed,
    this.size,
    required this.color,
    required this.text,
    required this.icon,
  });
  final VoidCallback onPressed;
  // final IconData icon;
  final Widget icon;
  //  final String title;
  final Size? size;
  final Color color;
  final Widget text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: BorderSide(width: 1, color: Colors.white),
        minimumSize: size,
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [icon, text]),
      ),
    );
  }
}
