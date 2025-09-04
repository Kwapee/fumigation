import 'package:flutter/material.dart';
import 'package:fumigation_app/utils/colors.dart';
import 'package:fumigation_app/utils/typography.dart';

class Services extends StatelessWidget {
  final String image;
  final String title;

  const Services({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        // Add navigation logic here
        print("Tapped on $title");
      },
      child: Container(
        width: size.width * 0.45,
        height: size.height*0.24,
        decoration: BoxDecoration(
          color: ColorPack.white,
          borderRadius: BorderRadius.circular(12), // A slightly larger radius
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        // This clip is important to ensure the InkWell splash effect
        // and the image respect the container's border radius.
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // The image is now the background of a sized container
            // This is another robust way to handle the rounded corners.
            Image.asset(
              image,
              width: double.infinity,
              height: size.height*0.18,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: tTextStyleBold.copyWith(
                      // Using your typography
                      fontSize: size.width*0.03,
                      color: ColorPack.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                   
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
