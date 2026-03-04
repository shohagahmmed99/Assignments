import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PhotoGallery extends StatefulWidget {
  const PhotoGallery({super.key});

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  int visibleCount = 10;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final height = MediaQuery.of(context).size.height;
    final List<String> images = [
      "assets/images/Rectangle 2 (2).png",
      "assets/images/Rectangle 2.1.png",
      "assets/images/Rectangle 2.2.png",
      "assets/images/Rectangle 2.3.png",
      "assets/images/Rectangle 2.4.png",
      "assets/images/Rectangle 2.5.png",
      "assets/images/Rectangle 2.6.png",
      "assets/images/Rectangle 2.7.png",
      "assets/images/Rectangle 2.9.png",
      "assets/images/Rectangle 2.10.png",
      "assets/images/Rectangle 2 (2).png",
      "assets/images/Rectangle 2.1.png",
      "assets/images/Rectangle 2.2.png",
      "assets/images/Rectangle 2.3.png",
      "assets/images/Rectangle 2.4.png",
      "assets/images/Rectangle 2.5.png",
      "assets/images/Rectangle 2.6.png",
      "assets/images/Rectangle 2.7.png",
      "assets/images/Rectangle 2.9.png",
      "assets/images/Rectangle 2.10.png",
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Discover",
                  style: TextStyle(
                    fontSize: width * 0.16,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    letterSpacing: -0.015 * 36,
                    fontFamily: "cofortaa",
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  "WHAT'S NEW TOADAY",
                  style: TextStyle(fontWeight: FontWeight.w900, height: 1, fontSize: 13, letterSpacing: 0.04 * 13),
                ),
                SizedBox(height: 24),
                Image.asset(
                  "assets/images/Rectangle 2.8.png",
                  width: double.infinity,
                  //height: 80,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 16),
                Row(
                  spacing: 8,
                  children: [
                    Container(
                      width: width * 0.08,
                      height: width * 0.08,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                      child: Image.asset("assets/images/kzshawon.png", fit: BoxFit.cover),
                    ),

                    Column(
                      spacing: 0,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Kz shaown", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                        Text("@Kzshaown"),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 48),
                Text(
                  "BROWSE ALL",
                  style: TextStyle(letterSpacing: 0.04 * 13, height: 1, fontWeight: FontWeight.w900, fontSize: 13),
                ),
                SizedBox(height: 24),
                MasonryGridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 9,
                  padding: const EdgeInsets.all(0),
                  itemCount: visibleCount,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Image.asset(images[index], fit: BoxFit.cover),
                    );
                  },
                ),
                SizedBox(height: 32),
                GestureDetector(
                  onTap: () {
                    print(width.toString());
                    log(width.toString());
                    setState(() {
                      (visibleCount < images.length) ? visibleCount = visibleCount + 10 : visibleCount = images.length;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: (images.length == visibleCount)
                            ? Text(
                                "NO MORE IMAGE",
                                style: TextStyle(
                                  letterSpacing: 0.04 * 13,
                                  wordSpacing: 1,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 13,
                                ),
                              )
                            : Text(
                                "SEE MORE",
                                style: TextStyle(
                                  letterSpacing: 0.04 * 13,
                                  wordSpacing: 1,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 13,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 99),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
