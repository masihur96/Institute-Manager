import 'package:awesome_circular_chart/awesome_circular_chart.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:im_app_student/model/constants.dart';
import 'package:im_app_student/model/custom_size.dart';
import 'package:im_app_student/model/custom_widget/im_text_form_field.dart';
import 'package:im_app_student/view/home_screen.dart';

class IMLoginScreen extends StatefulWidget {
  static const String id = "im_login_screen";
  const IMLoginScreen({Key? key}) : super(key: key);

  @override
  _IMLoginScreenState createState() => _IMLoginScreenState();
}

class _IMLoginScreenState extends State<IMLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      GlobalKey<AnimatedCircularChartState>();
  String? _phone;
  String? _studentID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/login_icon.png",
              width: screenSize(context, 1),
              height: screenSize(context, .9),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                "Log-in",
                style: IMTextStyle.IMHeader,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 30.0, vertical: screenSize(context, .1)),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Phone No",
                      style: IMTextStyle.IMSubHeader,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: IMTextFormField(
                        hintText: "Phone Number",
                        onSaved: (String? value) {
                          setState(() {
                            _phone = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: screenSize(context, .05),
                    ),
                    Text(
                      "Student ID",
                      style: IMTextStyle.IMSubHeader,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: IMTextFormField(
                        hintText: "Student ID",
                        onSaved: (String? value) {
                          setState(() {
                            _studentID = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: screenSize(context, .05),
                    ),
                    Center(
                      child: InkWell(
                        onTap: () async {
                          //Fetal error
                          // await FirebaseCrashlytics.instance
                          //     .recordError('error', null,
                          //         reason: 'a fatal error',
                          //         // Pass in 'fatal' argument
                          //         fatal: true);

                          // Non-Fetal error
                          // await FirebaseCrashlytics.instance.recordError(
                          //     'error', null,
                          //     reason: 'a non-fatal error');
                          _formKey.currentState?.save();

                          await FirebaseCrashlytics.instance
                              .setCustomKey('str_key', 'hello');
                          // if (_phone!.length < 3) {
                          //   try {
                          //     await FirebaseCrashlytics.instance
                          //         .recordError('This is error', null,
                          //             reason: 'By testing',
                          //             // Pass in 'fatal' argument
                          //             fatal: true);
                          //     //    print("Try");
                          //
                          //   } catch (e, s) {
                          //     print("Catch");
                          //     await FirebaseCrashlytics.instance
                          //         .recordError(e, null, reason: s, fatal: true);
                          //     // FirebaseCrashlytics.instance
                          //     //     .recordError('Try Catch', s);
                          //   }
                          // } else {
                          //   await FirebaseCrashlytics.instance.recordError(
                          //       'error', null,
                          //       reason: 'a non-fatal error');
                          // }

                          // try {
                          //   throw 'error_example';
                          // } catch (e, s) {
                          //   FirebaseCrashlytics.instance.recordError(e, s);
                          // }

                          //  Navigator.pushNamed(context, HomeScreen.id);
                        },
                        child: AnimatedCircularChart(
                          edgeStyle: SegmentEdgeStyle.round,
                          key: _chartKey,
                          size: Size(80.0, 80.0),
                          initialChartData: <CircularStackEntry>[
                            CircularStackEntry(
                              <CircularSegmentEntry>[
                                CircularSegmentEntry(
                                  _phone == "" ? 0 : 50,
                                  IMColors.primaryColor,
                                  rankKey: 'completed',
                                ),
                                CircularSegmentEntry(
                                  _studentID == "" ? 0 : 50,
                                  IMColors.secondaryColor,
                                  rankKey: 'remaining',
                                ),
                              ],
                              rankKey: 'progress',
                            ),
                          ],
                          chartType: CircularChartType.Radial,
                          percentageValues: true,
                          holeLabel: 'GO',
                          labelStyle: TextStyle(
                            color: IMColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
