import 'dart:developer';

import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  int update = 5;
  var val = 0.7;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 18),
        leading: Image.asset("assets/images/bckbtn.png", height: 28, width: 28),
        actions: [
          // Icon(Icons.search, weight: 10, size: 25, color: Colors.black)
          Image.asset("assets/images/search.png", height: 20, width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(19),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Center(child: Image.asset("assets/images/burgerr.png", height: 370, width: 370)),
              ),
              SizedBox(height: 35),
              Text("Hamburger Veggie Burger", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25)),
              SizedBox(height: 9),
              Row(
                children: [
                  Image.asset("assets/images/star.png", height: 16, width: 16),
                  Text(" 4.9 - 26 mins", style: TextStyle(fontSize: 15)),
                ],
              ),
              SizedBox(height: 19),
              Text(
                "Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun. ",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 56),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Spicy", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
                        SizedBox(height: 11),
                        SizedBox(
                          width: width * 0.4,
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(thumbShape: RRectThumbShape()),
                            child: Slider(
                              activeColor: Color(0xFFEF2A39),
                              padding: EdgeInsets.all(0),
                              value: val,
                              onChanged: (value) {
                                setState(() {
                                  val = value;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 7),
                        SizedBox(
                          width: width * 0.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Mild",
                                style: TextStyle(color: Color(0xFF1CC019), fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 30),
                              Text(
                                "Hot",
                                style: TextStyle(color: Color(0xFFEF2A39), fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width * 0.4,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Portion", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                        SizedBox(height: 5),
                        SizedBox(
                          width: width * 0.4,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  log(width.toString());
                                  if (update > 0) {
                                    setState(() {
                                      update = update - 1;
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(width * 0.03, width * 0.03),
                                  backgroundColor: Color(0xFFEF2A39),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                                child: Icon(Icons.remove, color: Colors.white, weight: 10),
                              ),
                              Text(update.toString(), style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    update = update + 1;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFEF2A39),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                                child: Icon(Icons.add, color: Colors.white, weight: 10),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 76),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xFFEF2A39)),
                    child: Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 24, vertical: 20),
                      child: Text(
                        "\$8.24",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22, color: Colors.white),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return Dialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset("assets/images/succcess_msg.png", height: 106, width: 154),
                                  SizedBox(height: 15),
                                  Text(
                                    " Order placed successfully!",
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xFF3C2F2F)),
                      child: Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: width * 0.13, vertical: 23),
                        child: Text(
                          "ORDER NOW",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 34),
            ],
          ),
        ),
      ),
    );
  }
}

class RRectThumbShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(10, 14);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;
    final rect = Rect.fromCenter(center: Offset(center.dx + 10, center.dy), width: 10, height: 14);
    final rRect = RRect.fromRectAndRadius(rect, Radius.circular(4));
    final paint = Paint()..color = Colors.red;
    canvas.drawRRect(rRect, paint);
  }
}
