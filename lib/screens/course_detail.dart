import 'package:flutter/material.dart';
import '../models/models.dart';
import '../components/lesson_tile.dart';

class CourseDetailScreen extends StatelessWidget {
  final Course course;

  CourseDetailScreen({this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: Column(
        children: [
          Image.asset(course.image),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(course.title),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: LinearProgressIndicator(
              value: course.progress,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: course.lessons.length,
              itemBuilder: (BuildContext context, int index) {
                return LessonTile(lesson: course.lessons[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}