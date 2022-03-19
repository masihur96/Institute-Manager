import 'package:flutter/material.dart';
import 'package:im_app_student/model/constants.dart';

class BookCard extends StatelessWidget {
  final String? subjectTitle;
  final String? taskCount;
  final String? status;
  final String? bookImageUrl;

  const BookCard(
      {Key? key,
      this.subjectTitle,
      this.taskCount,
      this.status,
      this.bookImageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      subjectTitle!,
                      style: IMTextStyle.IMSubHeader,
                    ),
                    Text(
                      taskCount!,
                      style: IMTextStyle.IMBodytext,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "Status",
                      style: IMTextStyle.IMSubHeader,
                    ),
                    Text(
                      status!,
                      style: IMTextStyle.IMBodytext,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Image.asset(
            bookImageUrl!,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
