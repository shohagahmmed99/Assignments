import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tasbih/theme.dart';

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
  final theme = [
    AppThemeModel(
        image: "assets/images/image 1.png",
        colour: [Color(0xFF2D1D3F), Color(0xFF764CA5), Color(0xff111B2B)],
        buttonIndicatorcolor: Color(0xff764CA5),
        bottomNavColor: Color(0xff764CA5)),
    AppThemeModel(
        image: "assets/images/theme1.png",
        colour: [
          Color(0xFF3E2723),
          Color(0xFFA1887F),
          Color(0xFF6D4C41),
        ],
        buttonIndicatorcolor: Color(0xFF000000),
        bottomNavColor: Color(0xFF6D4C41)),
    AppThemeModel(
        image: "assets/images/theme2.png",
        colour: [
          Color(0xFF183282),
          Color.fromARGB(255, 51, 28, 101),
          Color(0xFF3E3AA8),
        ],
        buttonIndicatorcolor: Color(0xFF183282),
        bottomNavColor: Color.fromARGB(255, 53, 69, 117))
  ];
  AppThemeModel? selectedTheme;

  @override
  void initState() {
    super.initState();
    selectedTheme = theme[0];
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          elevation: 2,
          titleSpacing: 0,
          backgroundColor: Colors.white,
          shadowColor: Colors.grey.shade100,
          leading: BackButton(),
          title: Text(
            "Tasbih Counter",
            style: TextStyle(fontFamily: "playfair", fontWeight: FontWeight.w500),
          ),
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
      bottomNavigationBar:
          Padding(padding: const EdgeInsets.all(8.0), child: CustomBottomNavBar(color: selectedTheme!.bottomNavColor)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: double.infinity,
                height: height * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: AssetImage(selectedTheme?.image ?? ""), fit: BoxFit.fill)),
                child: Column(
                  spacing: 25,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "الله أكبر",
                      style: TextStyle(
                          fontWeight: FontWeight.w900, color: Colors.white, fontSize: 20, fontFamily: "playfair"),
                    ),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.purple.shade50),
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text(
                          timeToDisplay,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "DmSans",
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: selectedTheme!.buttonIndicatorcolor),
                        ),
                      ),
                    ),
                    Text(
                      "Tasbih Counter",
                      style: TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 22, color: Colors.white, fontFamily: "playfair"),
                    ),
                    Text(
                      counter.toString().padLeft(3, "0"),
                      style: TextStyle(
                          fontWeight: FontWeight.w900, color: Colors.white, fontSize: 24, fontFamily: "playfair"),
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
                        gcolour: selectedTheme!.colour,
                      ),
                    ),
                    SizedBox(
                      height: 5,
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
                                color: selectedTheme!.buttonIndicatorcolor,
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
                          child: ActionButton(
                              child: Text(
                            "stop",
                            style: TextStyle(
                              fontSize: 20,
                              color: selectedTheme!.buttonIndicatorcolor,
                            ),
                          )),
                        ),
                        GestureDetector(
                          onTap: () {
                            startStopWatch();
                            setState(() {
                              isOn = true;
                            });
                          },
                          child: ActionButton(
                              child: Icon(
                            Icons.pause,
                            size: 30,
                            color: selectedTheme!.buttonIndicatorcolor,
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
              "Add Theme",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontFamily: "playfair"),
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
                        selectedTheme = theme[1];
                      });
                    },
                    child: PageTheme(image: "assets/images/theme1.png")),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedTheme = theme[2];
                    });
                  },
                  child: PageTheme(
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

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.child});
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

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key, required this.isOn, required this.gcolour});
  final bool isOn;
  final List<Color> gcolour;
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
          gradient: LinearGradient(colors: gcolour),
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
          alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
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

class PageTheme extends StatelessWidget {
  const PageTheme({super.key, required this.image});
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

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key, required this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61,
      decoration: BoxDecoration(
          color: color,
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
                  style: TextStyle(color: Colors.white, fontFamily: "playfair"),
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
                  style: TextStyle(color: Colors.white, fontFamily: "playfair"),
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
                  style: TextStyle(color: Colors.white, fontFamily: "playfair"),
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
                  style: TextStyle(color: Colors.white, fontFamily: "playfair"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
