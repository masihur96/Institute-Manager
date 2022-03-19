import 'package:flutter/material.dart';
import 'package:im_app_student/model/constants.dart';
import 'package:im_app_student/model/custom_size.dart';

class TeacherCard extends StatelessWidget {
  final String? teacherImage;
  final String? teacherName;
  final String? teacherDesignation;

  const TeacherCard(
      {Key? key, this.teacherImage, this.teacherName, this.teacherDesignation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    teacherImage!,
                    width: screenSize(context, 0.2),
                    height: screenSize(context, .2),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        teacherName!,
                        style: IMTextStyle.IMSubHeader,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        teacherDesignation!,
                        style: IMTextStyle.testFormLettering,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: screenSize(context, .1),
              width: screenSize(context, .1),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: IMColors.primaryColor,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.chat,
                  color: IMColors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
