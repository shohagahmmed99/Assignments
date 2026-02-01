import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

int counter = 0;
bool isDark = false;

class _CounterAppState extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    // bool isDark = false;
    return Scaffold(
      backgroundColor: (isDark) ? Colors.white : Colors.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Counter", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25)),
        centerTitle: true,

        leading: InkWell(
          child: Icon((isDark) ? Icons.light : Icons.add),
          onTap: () {
            setState(() {
              isDark = !isDark;
            });
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            spacing: 15,
            mainAxisAlignment: .center,
            children: [
              Text(
                '$counter',
                style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 10,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          counter++;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        //side: BorderSide(),
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(Icons.add, size: 30, color: Colors.black),
                            Text(
                              "Press to increase",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        if (counter <= 0) {
                          counter = 1;
                        }
                        setState(() {
                          counter--;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        //side: BorderSide(),
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(Icons.remove, size: 28, color: Colors.black),
                            Text(
                              "Press to Decrease",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter = 0;
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 25),
                  //side: BorderSide(),
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(Icons.refresh, size: 28, color: Colors.black),
                      Text(
                        "Press to Decrease",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}