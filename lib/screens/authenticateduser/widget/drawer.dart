import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fumigation_app/utils/colors.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isfindtorentExpanded = false;
  bool _isSecurityExpanded = false;
  bool _passcodeLogin = false;
  bool _setTheme = false;
  bool _isInfoExpanded = false;
  bool _isHelpExpanded = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: ColorPack.iconBeige,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.15),
                    child: Container(
                      height: size.height*0.99,
                      decoration: BoxDecoration(
                        color: ColorPack.white,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8.0,
                            offset: Offset(0, -2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: size.height * 0.02),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Navigate to the new page
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: size.width * 0.05,
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: ColorPack.iconBeige
                                          .withOpacity(0.5),
                                      radius: size.width * 0.05,
                                      child: Icon(
                                        FontAwesomeIcons.home,
                                        color: ColorPack.iconOrange,
                                        size: size.width * 0.045,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: size.width * 0.03),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: size.height * 0.01,
                                    ),
                                    child: Text(
                                      "Home",
                                      style: TextStyle(
                                        fontSize: size.width * 0.045,
                                        color: ColorPack.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const CustomDivider(),
                            GestureDetector(
                              onTap: () {
                                // Navigate to the new page
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: size.width * 0.05,
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: ColorPack.iconBeige
                                          .withOpacity(0.5),
                                      radius: size.width * 0.05,
                                      child: Icon(
                                        FontAwesomeIcons.info,
                                        color: ColorPack.iconOrange,
                                        size: size.width * 0.045,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: size.width * 0.03),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: size.height * 0.01,
                                    ),
                                    child: Text(
                                      "About",
                                      style: TextStyle(
                                        fontSize: size.width * 0.045,
                                        color: ColorPack.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpandableTile extends StatelessWidget {
  final Size size;
  final IconData icon;
  final String title;
  final bool isExpanded;
  final VoidCallback onTap;
  final Widget content;

  const ExpandableTile({
    Key? key,
    required this.size,
    required this.icon,
    required this.title,
    required this.isExpanded,
    required this.onTap,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.05),
                child: CircleAvatar(
                  backgroundColor: ColorPack.iconBeige.withOpacity(0.5),
                  radius: size.width * 0.05,
                  child: Icon(
                    icon,
                    color: ColorPack.iconOrange,
                    size: size.width * 0.045,
                  ),
                ),
              ),
              SizedBox(width: size.width * 0.03),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.01),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: size.width * 0.045,
                    color: ColorPack.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                size: size.width * 0.08,
                color: ColorPack.black,
              ),
              SizedBox(width: size.width * 0.02),
            ],
          ),
          if (isExpanded) content,
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final Size size;
  final String title;
  final VoidCallback onTap;

  const CustomListTile({
    Key? key,
    required this.size,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: size.width * 0.04,
          color: ColorPack.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Divider(color: Color.fromARGB(101, 54, 44, 44)),
    );
  }
}
