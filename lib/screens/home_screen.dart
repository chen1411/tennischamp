import 'package:flutter/material.dart';
import 'package:tennischamp/models/models.dart';
import 'package:tennischamp/components/lesson_tile.dart';

class HomeScreen extends StatelessWidget {
  final List<Lesson> lessons = [
    Lesson(
      title: 'Greetings',
      description: 'Learn how to greet people',
      imageUrl: 'https://example.com/greetings.jpg',
    ),
    Lesson(
      title: 'Numbers',
      description: 'Learn how to count',
      imageUrl: 'https://example.com/numbers.jpg',
    ),
    Lesson(
      title: 'Colors',
      description: 'Learn how to name colors',
      imageUrl: 'https://example.com/colors.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Duolingo Clone'),
      ),
      body: ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          final lesson = lessons[index];
          return LessonTile(
            lesson: lesson
          );
        },
      ),
    );
  }
}