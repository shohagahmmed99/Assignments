import 'dart:async';

import 'package:flutter/material.dart';

class Tasbih extends StatefulWidget {
  const Tasbih({super.key});

  @override
  State<Tasbih> createState() => _TasbihState();
}

class _TasbihState extends State<Tasbih> {
  String timeToDisplay = "0:00:00";
  final dur = const Duration(seconds: 1);
  void keepRunning() {
    if (sWatch.isRunning) {
      startTimer();
    }
    setState(() {
      timeToDisplay =
          "${sWatch.elapsed.inHours.toString().padLeft(1, "0")}:${(sWatch.elapsed.inMinutes % 60).toString().padLeft(2, "0")}:${(sWatch.elapsed.inSeconds % 60).toString().padLeft(2, "0")}";
    });
  }

  void startTimer() {
    Timer(dur, keepRunning);
  }

  var sWatch = Stopwatch();

  void startStopWatch() {
    sWatch.start();
    startTimer();
  }

  bool isOn = false;
  int counter = 0;
  String theme = "assets/images/image 1.png";
  List<Color> colour = [Color(0xFF2D1D3F), Color(0xFF764CA5), Color(0xff111B2B)];

  Color tIconColor = Color(0xff764CA5);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 2,
          titleSpacing: 0,
          backgroundColor: Colors.white,
          shadowColor: Colors.black,
          leading: BackButton(),
          title: Text("Tasbih Counter"),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(color: Colors.grey.shade400, shape: BoxShape.circle),
                child: Icon(
                  Icons.notifications_outlined,
                  size: 30,
                ),
              ),
            )
          ]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 61,
          decoration: BoxDecoration(
              color: Color(0xffb2764ca5),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      "Calender",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.schedule_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      "Schedule",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.settings_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: double.infinity,
                height: 450,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: AssetImage(theme), fit: BoxFit.fill)),
                child: Column(
                  spacing: 25,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "الله أكبر",
                      style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white, fontSize: 20),
                    ),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.purple.shade50),
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text(
                          timeToDisplay,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: tIconColor),
                        ),
                      ),
                    ),
                    Text(
                      "Tasbih Counter",
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22, color: Colors.white),
                    ),
                    Text(
                      counter.toString().padLeft(3, "0"),
                      style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white, fontSize: 24),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (isOn) {
                          setState(() {
                            counter = counter + 1;
                          });
                        }
                      },
                      child: CustomSwitch(
                        isOn: isOn,
                        gcolour: colour,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 35,
                      children: [
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                            child: GestureDetector(
                              onTap: () {
                                if (isOn == false) {
                                  sWatch.reset();
                                  setState(() {
                                    timeToDisplay = "0:00:00";
                                    counter = 0;
                                  });
                                }
                              },
                              child: Icon(
                                Icons.refresh,
                                size: 35,
                                color: tIconColor,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            sWatch.stop();
                            setState(() {
                              isOn = false;
                            });
                          },
                          child: CustomButton(
                              child: Text(
                            "stop",
                            style: TextStyle(fontSize: 20, color: tIconColor),
                          )),
                        ),
                        GestureDetector(
                          onTap: () {
                            startStopWatch();
                            setState(() {
                              isOn = true;
                            });
                          },
                          child: CustomButton(
                              child: Icon(
                            Icons.pause,
                            size: 35,
                            color: tIconColor,
                          )),
                        )
                      ],
                    )
                  ],
                )),
            SizedBox(
              height: 15,
            ),
            Text(
              "Add Themes",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        theme = "assets/images/theme1.png";
                        colour = [
                          Color(0xFF000000),
                          Color(0xFF1C1C1C),
                          Color(0xFF3A3A3A),
                        ];
                        tIconColor = Color(0xFF000000);
                      });
                    },
                    child: Theme(image: "assets/images/theme1.png")),
                InkWell(
                  onTap: () {
                    setState(() {
                      theme = "assets/images/theme2.png";
                      colour = [
                        Color(0xFF0A101A),
                        Color(0xFF111B2B),
                        Color(0xFF2E3F5F),
                      ];
                      tIconColor = Color(0xFF183282);
                    });
                  },
                  child: Theme(
                    image: "assets/images/theme2.png",
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.purple.shade50),
      child: Padding(padding: const EdgeInsets.fromLTRB(8, 2, 8, 2), child: child),
    );
  }
}

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key, required this.isOn, required this.gcolour});
  final bool isOn;
  // final  color1;
  // final Color color2;
  final List<Color> gcolour;
  //final Color color3;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 120,
        height: 50,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(colors: widget.gcolour
              //colors:
              // [Color(0xFF2D1D3F), Color(0xFF764CA5), Color(0xff111B2B)],
              ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          alignment: widget.isOn ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xffcec5d8c2),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    ]);
  }
}

class Theme extends StatelessWidget {
  const Theme({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: 170,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: AssetImage(
                image,
              ),
              fit: BoxFit.cover)),
    );
  }
}
