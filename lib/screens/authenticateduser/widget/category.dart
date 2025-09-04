import 'package:flutter/material.dart';
import 'package:fumigation_app/utils/colors.dart';
import 'package:fumigation_app/utils/typography.dart';

class Category extends StatelessWidget {
  final String image;
  final String title;

  const Category({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Image.asset(
          image,
          width: size.width * 0.18, // e.g., 15% of screen width
          height: size.width * 0.18,
        ),
        SizedBox(height: size.height * 0.01),
        Text(
          title,
          style: tTextStyleBold.copyWith(
            color: ColorPack.black,
            fontSize: size.width * 0.028,
          ),
        ),
      ],
    );
  }
}
