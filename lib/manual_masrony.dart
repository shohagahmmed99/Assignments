import 'package:flutter/material.dart';

class ManualMasonryImages extends StatelessWidget {
  ManualMasonryImages({super.key});

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

  final List<double> heights = [200, 150, 250, 180, 220, 160, 210, 170];

  @override
  Widget build(BuildContext context) {
    List<Widget> col1 = [];
    List<Widget> col2 = [];

    double height1 = 0;
    double height2 = 0;

    for (int i = 0; i < images.length; i++) {
      Widget imageItem = Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: Image.asset(
          images[i],
          height: heights[i],
          fit: BoxFit.cover,
        ),
      );

      // Add to shortest column
      if (height1 <= height2) {
        col1.add(imageItem);
        height1 += heights[i];
      } else {
        col2.add(imageItem);
        height2 += heights[i];
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Manual Masonry")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Column(children: col1)),
            const SizedBox(width: 0),
            Expanded(child: Column(children: col2)),
          ],
        ),
      ),
    );
  }
}
