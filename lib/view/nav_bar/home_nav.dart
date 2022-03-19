import 'package:awesome_circular_chart/awesome_circular_chart.dart';
import 'package:flutter/material.dart';
import 'package:im_app_student/model/constants.dart';
import 'package:im_app_student/model/custom_size.dart';
import 'package:im_app_student/model/custom_widget/book_card.dart';
import 'package:im_app_student/model/custom_widget/teacher_card.dart';
import 'package:marquee/marquee.dart';

class HomeNavBar extends StatefulWidget {
  const HomeNavBar({Key? key}) : super(key: key);

  @override
  _HomeNavBarState createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      GlobalKey<AnimatedCircularChartState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: IMColors.primaryColor,
              width: screenSize(context, 1),
              height: screenSize(context, .4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedCircularChart(
                    edgeStyle: SegmentEdgeStyle.round,
                    key: _chartKey,
                    size: const Size(150.0, 150.0),
                    holeRadius: 50,
                    initialChartData: const <CircularStackEntry>[
                      CircularStackEntry(
                        <CircularSegmentEntry>[
                          CircularSegmentEntry(
                            30,
                            IMColors.googleButtonColor,
                            rankKey: 'completed',
                          ),
                          CircularSegmentEntry(
                            70,
                            IMColors.white,
                            rankKey: 'remaining',
                          ),
                        ],
                        rankKey: 'progress',
                      ),
                    ],
                    chartType: CircularChartType.Radial,
                    percentageValues: true,
                    holeLabel: '70%',
                    labelStyle: const TextStyle(
                      color: IMColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Good Result! ",
                          style: IMTextStyle.IMHeaderWhite,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Principal Comments",
                            style: IMTextStyle.IMSubHeaderWhite,
                          ),
                        ),
                        Text(
                          "Move forward on the path to success.",
                          style: IMTextStyle.IMSubHeaderWhite,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: screenSize(context, .1),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Marquee(
                    text: 'This product Under Development',
                    style: IMTextStyle.IMHeader,
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    blankSpace: 20.0,
                    velocity: 100.0,
                    pauseAfterRound: const Duration(seconds: 1),
                    startPadding: 10.0,
                    accelerationDuration: const Duration(seconds: 1),
                    accelerationCurve: Curves.linear,
                    decelerationDuration: const Duration(milliseconds: 500),
                    decelerationCurve: Curves.easeOut,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Your Teachers",
                        style: IMTextStyle.IMSubHeader,
                      ),
                      Text(
                        "All Teachers",
                        style: IMTextStyle.IMBodytext,
                      ),
                    ],
                  ),
                  const TeacherCard(
                    teacherImage: "assets/images/login_icon.png",
                    teacherName: "HM Mizanur Rohman",
                    teacherDesignation: "Assistant Teacher Math",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Home Works",
                          style: IMTextStyle.IMSubHeader,
                        ),
                        Text(
                          "All Subject",
                          style: IMTextStyle.IMBodytext,
                        ),
                      ],
                    ),
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 3.5,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: 10,
                      itemBuilder: (BuildContext ctx, index) {
                        return const BookCard(
                          subjectTitle: "Math",
                          taskCount: "4 Task",
                          status: "Done",
                          bookImageUrl: "assets/images/login_icon.png",
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
