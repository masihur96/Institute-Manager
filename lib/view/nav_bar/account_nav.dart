import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_app_student/model/constants.dart';
import 'package:im_app_student/model/custom_size.dart';

class AccountNav extends StatefulWidget {
  const AccountNav({Key? key}) : super(key: key);

  @override
  _AccountNavState createState() => _AccountNavState();
}

class _AccountNavState extends State<AccountNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.antiAlias,
            children: [
              Container(
                height: screenSize(context, .5),
                width: screenSize(context, 1),
                decoration: const BoxDecoration(color: IMColors.primaryColor),
              ),
              Positioned(
                bottom: -100,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.antiAlias,
                      children: [
                        Card(
                          child: SizedBox(
                            width: screenSize(context, .8),
                            height: screenSize(context, 0.55),
                            child: Column(
                              children: [
                                const Spacer(),
                                const Text(
                                  'Mizanur Rohman',
                                  style: IMTextStyle.IMHeader,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text(
                                    "ID: B0000001",
                                    style: IMTextStyle.IMSubHeader,
                                  ),
                                ),
                                Text(
                                  "01740719204",
                                  style: IMTextStyle.IMSubHeader,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Card(
                                        elevation: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assets/images/exam_icon.png",
                                                height: 40,
                                                width: 40,
                                              ),
                                              Text(
                                                "Exam",
                                                style: IMTextStyle.IMSubHeader,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Card(
                                        elevation: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assets/images/result_icon.png",
                                                height: 40,
                                                width: 40,
                                              ),
                                              Text(
                                                "Result",
                                                style: IMTextStyle.IMSubHeader,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Card(
                                        elevation: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assets/images/fees_icon.png",
                                                height: 40,
                                                width: 40,
                                              ),
                                              Text(
                                                "Fees",
                                                style: IMTextStyle.IMSubHeader,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const Positioned(
                          top: -45,
                          left: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: IMColors.white,
                            child: Image(
                              image:
                                  AssetImage("assets/images/on_board_icon.png"),
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 120,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    "Section",
                    style: IMTextStyle.IMSubHeader,
                  ),
                  subtitle: Text(
                    "Nurani",
                    style: IMTextStyle.IMBodytext,
                  ),
                  leading: Image.asset(
                    "assets/images/section_icon.png",
                    height: 40,
                    width: 40,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
                ListTile(
                  title: Text(
                    "Roll",
                    style: IMTextStyle.IMSubHeader,
                  ),
                  subtitle: Text(
                    "01",
                    style: IMTextStyle.IMBodytext,
                  ),
                  leading: Image.asset(
                    "assets/images/roll_icon.png",
                    height: 40,
                    width: 40,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
                ListTile(
                  title: Text(
                    "Class",
                    style: IMTextStyle.IMSubHeader,
                  ),
                  subtitle: Text(
                    "Six",
                    style: IMTextStyle.IMBodytext,
                  ),
                  leading: Image.asset(
                    "assets/images/class_icon.png",
                    height: 40,
                    width: 40,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
                ListTile(
                  title: Text(
                    "Type",
                    style: IMTextStyle.IMSubHeader,
                  ),
                  subtitle: Text(
                    "Regular",
                    style: IMTextStyle.IMBodytext,
                  ),
                  leading: Image.asset(
                    "assets/images/type_icon.png",
                    height: 40,
                    width: 40,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Manage",
                style: IMTextStyle.buttonText,
              ),
            ),
          )
        ],
      ),
    );
  }
}
