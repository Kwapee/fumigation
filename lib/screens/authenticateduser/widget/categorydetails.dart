import 'package:flutter/material.dart';
import 'package:fumigation_app/screens/authenticateduser/widget/request_service.dart';
import 'package:fumigation_app/utils/colors.dart';
import 'package:fumigation_app/utils/typography.dart';
import 'package:fumigation_app/widgets/components/buttons/primary_button.dart';

class CategoryDetails extends StatefulWidget {
  // 1. Add a final variable to hold the category title
  final String categoryTitle;

  // 2. Update the constructor to require this title
  const CategoryDetails({
    super.key,
    required this.categoryTitle,
  });

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // 3. Make the back button functional
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          // 4. Use the passed title from the widget
          widget.categoryTitle,
          style: tTextStyleBold.copyWith(
            color: ColorPack.black,
            fontSize: size.width * 0.035,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // The image remains static as requested
          Image.asset("assets/images/liquid_fumigation.png"),

          Padding(
            padding: EdgeInsets.only(top: size.height * 0.3),
            child: Container(
              height: size.height * 0.99,
              decoration: BoxDecoration(
                color: ColorPack.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorPack.boxShadow.withOpacity(0.5),
                    blurRadius: 5.0,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.03,
                  left: size.width * 0.02,
                  right: size.width * 0.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 5. Make the content dynamic using the category title
                    Text(
                      "Our ${widget.categoryTitle} service provides:",
                      style: tTextStyle800.copyWith(
                        color: ColorPack.black,
                        fontSize: size.width * 0.045,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      'We offer a comprehensive and professional fumigation service tailored for your ${widget.categoryTitle.toLowerCase()}. Our certified experts ensure a safe and pest-free environment.',
                      style: tTextStyle600.copyWith(
                        color: ColorPack.black,
                        fontSize: size.width * 0.035,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: PrimaryButton(
                        onTap: () {Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RequestServicePage(
            // Pass the category title to the request page
            categoryTitle: widget.categoryTitle,
          ),
        ),
      );},
                        buttonTitle: "Request service",
                        titleColor: ColorPack.white,
                        height: 50,
                        width: double.infinity,
                        buttonColor: ColorPack.iconOrange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}