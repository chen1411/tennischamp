import 'package:flutter/material.dart';
import '../models/models.dart';
import '../screens/course_detail.dart';

class CourseTile extends StatelessWidget {
  final Course course;

  CourseTile({this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CourseDetailScreen(course: course)),
        );
      },
      child: Card(
        child: Row(
          children: [
            Image.asset(course.image, width: 80.0, height: 80.0),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 8.0),
                  LinearProgressIndicator(
                    value: course.progress,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}