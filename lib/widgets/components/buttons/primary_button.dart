import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/typography.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonTitle;
  final Color titleColor;
  final VoidCallback? onTap;
  final bool isLoading;
  final bool isHalfWidth;
  final Color buttonColor;
  final bool isDisabled;
  final double height;
  final double width;

  const PrimaryButton(
      {super.key,
      required this.onTap,
      required this.buttonTitle,
      this.isDisabled = false,
      required this.titleColor,
      this.isLoading = false,
      this.isHalfWidth = false,
      required this.height,
      required this.width,
      required this.buttonColor, CircularProgressIndicator? child,});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
           style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(buttonColor), // Set minimum width and height
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            50), // Optional: Set border radius
                      ),
                    ),
                  ),
          onPressed: onTap,
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.black.withOpacity(0.5),
                ))
              : Text(
                  buttonTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: tTextStyle700.copyWith(fontSize: 16, color: titleColor),
                ),
        ),
      );
  }
}
