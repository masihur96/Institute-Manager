import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_app_student/model/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LearnNav extends StatefulWidget {
  const LearnNav({Key? key}) : super(key: key);

  @override
  _LearnNavState createState() => _LearnNavState();
}

class _LearnNavState extends State<LearnNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    childAspectRatio: 3 / 4,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: 10,
                itemBuilder: (BuildContext ctx, index) {
                  return Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              "assets/images/login_icon.png",
                              fit: BoxFit.fill,
                              height: 180,
                            ),
                            Positioned(
                              right: 1,
                              top: 1,
                              child: Icon(
                                Icons.mood_outlined,
                                color: IMColors.primaryColor,
                                size: 40,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Bangla",
                                style: IMTextStyle.IMSubHeader,
                              ),
                              Text(
                                "Good",
                                style: IMTextStyle.IMBodytext,
                              ),
                            ],
                          ),
                        ),
                        LinearPercentIndicator(
                          lineHeight: 14.0,
                          percent: 0.5,
                          barRadius: Radius.circular(5),
                          animation: true,
                          center: Text(
                            "50.0%",
                            style: IMTextStyle.IMBodytextWhite,
                          ),
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          backgroundColor: IMColors.secondaryColor,
                          progressColor: IMColors.primaryColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Go Ahead",
                          style: IMTextStyle.IMBodytext,
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    ));
  }
}
