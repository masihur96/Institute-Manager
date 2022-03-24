import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:im_app_student/model/constants.dart';
import 'package:im_app_student/model/custom_size.dart';
import 'package:im_app_student/view/nav_bar/account_nav.dart';
import 'package:im_app_student/view/nav_bar/chat_screen.dart';
import 'package:im_app_student/view/nav_bar/fees_nav.dart';
import 'package:im_app_student/view/nav_bar/home_nav.dart';
import 'package:im_app_student/view/nav_bar/learn_nav.dart';
import 'package:im_app_student/view/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  var _bottomNavIndex = 0; //default index of a first screen

  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  final iconList = <IconData>[
    Icons.home,
    Icons.chrome_reader_mode_outlined,
    Icons.money,
    Icons.account_box,
  ];
  List<String> navBarTitle = ["Home", "Learn", "Fees", "Account"];

  List<Widget> navScreen = [HomeNavBar(), LearnNav(), FeesNav(), AccountNav()];

  @override
  void initState() {
    super.initState();
    final systemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: IMColors.greyColor,
      statusBarColor: IMColors.primaryColor,
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);

    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(seconds: 1),
      () => _animationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("INSTITUTE MANAGER"),
            Stack(
              children: [
                CircleAvatar(
                  backgroundColor: IMColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: CircleAvatar(
                      backgroundColor: IMColors.primaryColor,
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => NotificationScreen()));
                          },
                          icon: Icon(Icons.notifications)),
                    ),
                  ),
                ),
                const Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: Text(
                          "2",
                          style: TextStyle(fontSize: 10),
                        ))),
              ],
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: IMColors.primaryColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset("assets/images/on_board_icon.png"),
        ),
        // actions: [
        //
        // ],
      ),
      endDrawer: SafeArea(
        child: Container(
          width: screenSize(context, .8),
          color: IMColors.white,
          child: Column(
            children: [
              Container(
                height: screenSize(context, .525),
                width: screenSize(context, 1),
                color: IMColors.primaryColor,
                child: Column(
                  children: [
                    Container(
                      height: screenSize(context, .23),
                      width: screenSize(context, .23),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/images/login_icon.png"),
                              fit: BoxFit.fill),
                          border: Border.all(width: 1, color: IMColors.white)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Mizanur Rohman",
                        style: IMTextStyle.IMHeaderWhite,
                      ),
                    ),
                    Text(
                      "01712923903",
                      style: IMTextStyle.IMSubHeaderWhite,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(
                                "Class; Six",
                                style: IMTextStyle.IMSubHeaderWhite,
                              ),
                            ),
                            Text(
                              "Type; Reguler",
                              style: IMTextStyle.IMSubHeaderWhite,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(
                                "Section; Nurani",
                                style: IMTextStyle.IMSubHeaderWhite,
                              ),
                            ),
                            Text(
                              "Roll; Six",
                              style: IMTextStyle.IMSubHeaderWhite,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text("Notice Board"),
                leading: Icon(Icons.developer_board),
                onTap: () {},
              ),
              ListTile(
                title: Text("Exam"),
                leading: Icon(Icons.reddit_outlined),
                onTap: () {},
              ),
              ListTile(
                title: Text("Attendance"),
                leading: Icon(Icons.present_to_all),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Complain"),
                leading: Icon(Icons.warning_rounded),
                onTap: () {},
              ),
              ListTile(
                title: Text("Comments Box"),
                leading: Icon(Icons.comment_bank_outlined),
                onTap: () {},
              ),
              ListTile(
                title: Text("Setting"),
                leading: Icon(Icons.settings),
                onTap: () {},
              ),
              ListTile(
                title: Text("Log-Out"),
                leading: Icon(Icons.logout_outlined),
                onTap: () {},
              )
            ],
          ),
        ),
      ),
      body: navScreen[_bottomNavIndex],
      floatingActionButton: ScaleTransition(
        scale: animation,
        child: FloatingActionButton(
          elevation: 8,
          backgroundColor: IMColors.secondaryColor,
          child: const Icon(
            Icons.chat,
            color: IMColors.primaryColor,
          ),
          onPressed: () {
            _animationController.reset();
            _animationController.forward();
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => ChatScreen()));
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? IMColors.secondaryColor : Colors.white;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 24,
                color: color,
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  navBarTitle[index],
                  maxLines: 1,
                  style: TextStyle(color: color),
                ),
              )
            ],
          );
        },
        backgroundColor: IMColors.primaryColor,
        activeIndex: _bottomNavIndex,
        splashColor: IMColors.secondaryColor,
        notchAndCornersAnimation: animation,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}
