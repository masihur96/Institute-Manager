import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_app_student/model/constants.dart';
import 'package:im_app_student/view/dashboard_screen.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int page = 0;
  LiquidController? liquidController;
  UpdateType? updateType;

  //cloude massaging
  // late final FirebaseMessaging _messaging;
  // late int _totalNotificationCounter;
  // //model
  // PushNotification? _notificationInfo;
  // void registerNotification() async {
  //   await Firebase.initializeApp();
  //   _messaging = FirebaseMessaging.instance;
  //
  //   // three type of state in notification
  //   //not determined(null) , granted(true) , and decline (false)
  //
  //   NotificationSettings settings = await _messaging.requestPermission(
  //     alert: true,
  //     badge: true,
  //     provisional: false,
  //     sound: true,
  //   );
  //   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //     print("User granted the permission");
  //
  //     //main message
  //
  //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //       PushNotification notification = PushNotification(
  //         title: message.notification!.title,
  //         body: message.notification!.body,
  //         dataTitle: message.data['title'],
  //         dataBody: message.data['body'],
  //       );
  //       setState(() {
  //         _totalNotificationCounter++;
  //         _notificationInfo = notification;
  //       });
  //
  //       if (notification != null) {
  //         showSimpleNotification(Text(_notificationInfo!.title!),
  //             leading: NotificationBadege(
  //                 totalNotification: _totalNotificationCounter),
  //             subtitle: Text(_notificationInfo!.body!),
  //             background: Colors.cyan.shade700,
  //             duration: Duration(seconds: 2));
  //       }
  //     });
  //   } else {
  //     print("User decline");
  //   }
  // }

  @override
  void initState() {
    setState(() {
      // _totalNotificationCounter = 0;
    });
    //  registerNotification();

    liquidController = LiquidController();

    super.initState();
  }

  final pages = [
    Container(
      width: double.infinity,
      color: Colors.pink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/images/on_board_icon.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: <Widget>[
              Text(
                "Hi",
                style: IMTextStyle.IMHeader,
              ),
              Text(
                "It's Me",
                style: IMTextStyle.IMHeader,
              ),
              Text(
                "Sahdeep",
                style: IMTextStyle.IMHeader,
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      width: double.infinity,
      color: Colors.deepPurpleAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/images/on_board_icon.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: <Widget>[
              Text(
                "Take a",
                style: IMTextStyle.IMHeader,
              ),
              Text(
                "look at",
                style: IMTextStyle.IMHeader,
              ),
              Text(
                "Liquid Swipe",
                style: IMTextStyle.IMHeader,
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      width: double.infinity,
      color: Colors.greenAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/images/on_board_icon.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: <Widget>[
              Text(
                "Liked?",
                style: IMTextStyle.IMHeader,
              ),
              Text(
                "Fork!",
                style: IMTextStyle.IMHeader,
              ),
              Text(
                "Give Star!",
                style: IMTextStyle.IMHeader,
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      width: double.infinity,
      color: Colors.yellowAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/images/on_board_icon.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: <Widget>[
              Text(
                "Can be",
                style: IMTextStyle.IMHeader,
              ),
              Text(
                "Used for",
                style: IMTextStyle.IMHeader,
              ),
              Text(
                "Onboarding Design",
                style: IMTextStyle.IMHeader,
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      width: double.infinity,
      color: Colors.redAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/images/on_board_icon.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: <Widget>[
              Text(
                "Do",
                style: IMTextStyle.IMHeader,
              ),
              Text(
                "Try it",
                style: IMTextStyle.IMHeader,
              ),
              Text(
                "Thank You",
                style: IMTextStyle.IMHeader,
              ),
            ],
          ),
        ],
      ),
    ),
  ];

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return SizedBox(
      width: 25.0,
      child: Center(
        child: Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: SizedBox(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            LiquidSwipe(
              pages: pages,
              slideIconWidget: Icon(Icons.arrow_back_ios),
              onPageChangeCallback: pageChangeCallback,
              waveType: WaveType.liquidReveal,
              liquidController: liquidController,
              enableSideReveal: true,
              ignoreUserGestureWhileAnimating: true,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(pages.length, _buildDot),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: FlatButton(
                  onPressed: () {
                    liquidController!
                        .animateToPage(page: pages.length - 1, duration: 700);

                    if (pages.length == pages.length) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => DeshBoardScreen()));
                    }
                  },
                  child: Text("Skip to End"),
                  color: Colors.white.withOpacity(0.01),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: FlatButton(
                  onPressed: () {
                    liquidController!.animateToPage(
                        page:
                            liquidController!.currentPage + 1 > pages.length - 1
                                ? 0
                                : liquidController!.currentPage + 1);
                    if (liquidController!.currentPage + 1 > pages.length - 1) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => DeshBoardScreen()));
                    }
                  },
                  child: Text("Next"),
                  color: Colors.white.withOpacity(0.01),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
