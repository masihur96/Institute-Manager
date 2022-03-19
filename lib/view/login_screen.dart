import 'package:awesome_circular_chart/awesome_circular_chart.dart';
import 'package:flutter/material.dart';
import 'package:im_app_student/model/constants.dart';
import 'package:im_app_student/model/custom_size.dart';
import 'package:im_app_student/model/custom_widget/im_text_form_field.dart';
import 'package:im_app_student/view/home_screen.dart';

class IMLoginScreen extends StatefulWidget {
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
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => HomeScreen()));
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
