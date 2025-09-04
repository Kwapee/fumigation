import 'package:flutter/material.dart';
import 'package:fumigation_app/utils/colors.dart';
import 'package:fumigation_app/utils/typography.dart';

class Userdetails extends StatefulWidget {
  const Userdetails({super.key});

  @override
  State<Userdetails> createState() => _UserdetailsState();
}

class _UserdetailsState extends State<Userdetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(
                  Icons.menu,
                  color: ColorPack.iconOrange,
                  size: size.width * 0.075,
                ),
              ),
        title: Text(
          'User Details',
          style: tTextStyleBold.copyWith(
            color: ColorPack.black,
            fontSize: size.width * 0.035,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: size.height * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.3, // Responsive size
                backgroundImage: const AssetImage(
                  'assets/images/user_person.jpg',
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                "John Doe",
                style: tTextStyleBold.copyWith(
                  fontSize: size.width * 0.04,
                  color: ColorPack.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
