import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fumigation_app/screens/authenticateduser/profile.dart';
import 'package:fumigation_app/screens/authenticateduser/widget/category.dart';
// Make sure the path to your new categorydetails page is correct
import 'package:fumigation_app/screens/authenticateduser/widget/categorydetails.dart';
import 'package:fumigation_app/screens/authenticateduser/widget/drawer.dart';
import 'package:fumigation_app/screens/authenticateduser/widget/services.dart';
import 'package:fumigation_app/utils/colors.dart';
import 'package:fumigation_app/utils/typography.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  late final List<Widget> pages;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    pages = [
      const HomePageContent(),
      const Userdetails(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: SizedBox(width: size.width * 0.80, child: const CustomDrawer()),
      body: SafeArea(
        bottom: false,
        child: IndexedStack(index: currentIndex, children: pages),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: ColorPack.boxShadow.withOpacity(0.5),
              blurRadius: 8.0,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: ColorPack.iconOrange,
          unselectedItemColor: ColorPack.iconGrey,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_sharp),
              label: "Profile",
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

class HomePageContent extends StatefulWidget {
  const HomePageContent({Key? key}) : super(key: key);
  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  // Helper function to navigate
  void _navigateToCategoryDetails(String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryDetails(categoryTitle: title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
          top: size.height * 0.02,
          right: size.width * 0.03,
          left: size.width * 0.03,
          bottom: size.height * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(
                  Icons.menu,
                  color: ColorPack.iconOrange,
                  size: size.width * 0.075,
                ),
              ),
              Row(
                children: [
                  Text(
                    "Pokuase",
                    style: tTextStyleBold.copyWith(
                      color: ColorPack.black,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                  SizedBox(width: size.width * 0.02),
                  Icon(
                    Icons.location_pin,
                    color: ColorPack.black,
                    size: size.width * 0.04,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: size.height * 0.03),
          Center(
            child: CircleAvatar(
              radius: size.width * 0.15, // Responsive size
              backgroundImage: const AssetImage(
                'assets/images/user_person.jpg',
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Center(
            child: Text(
              "John Doe",
              style: tTextStyleBold.copyWith(
                color: ColorPack.black,
                fontSize: size.width * 0.035,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.05),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Services",
                        style: tTextStyleBold.copyWith(
                          color: ColorPack.black,
                          fontSize: size.width * 0.045,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "View all",
                          style: tTextStyle500.copyWith(
                            color: ColorPack.darkGray.withOpacity(0.4),
                            fontSize: size.width * 0.035,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Services(
                        image: "assets/images/liquid_fumigation.png",
                        title: "Liquid Fumigation",
                      ),
                      Services(
                        image: "assets/images/commodity_fumigation.jpg",
                        title: "Commodity Fumigation",
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: tTextStyleBold.copyWith(
                          color: ColorPack.black,
                          fontSize: size.width * 0.045,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "View all",
                          style: tTextStyle500.copyWith(
                            color: ColorPack.darkGray.withOpacity(0.4),
                            fontSize: size.width * 0.035,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            _navigateToCategoryDetails("House Fumigation"),
                        child: const Category(
                          image: "assets/images/house_fumigation.png",
                          title: "House Fumigation",
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            _navigateToCategoryDetails("Factory Fumigation"),
                        child: const Category(
                          image: "assets/images/factory_fumigation.png",
                          title: "Factory Fumigation",
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            _navigateToCategoryDetails("School Fumigation"),
                        child: const Category(
                          image: "assets/images/school_fumigation.png",
                          title: "School Fumigation",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            _navigateToCategoryDetails("Church Fumigation"),
                        child: const Category(
                          image: "assets/images/church_fumigation.png",
                          title: "Church Fumigation",
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            _navigateToCategoryDetails("Bank Fumigation"),
                        child: const Category(
                          image: "assets/images/bank_fumigation.png",
                          title: "Bank Fumigation",
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            _navigateToCategoryDetails("Library Fumigation"),
                        child: const Category(
                          image: "assets/images/library_fumigation.png",
                          title: "Library Fumigation",
                        ),
                      ),
                    ],
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