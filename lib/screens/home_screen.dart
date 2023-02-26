import 'package:flutter/material.dart';
import '../models/models.dart';
import '../components/lesson_tile.dart';

class HomeScreen extends StatelessWidget {
  final List<Lesson> lessons = [
    Lesson(
      title: 'Forehand',
      description: 'Learn how to greet people',
      imageUrl: 'https://thumbs.dreamstime.com/z/male-tennis-player-forehand-racquet-swing-hitting-ball-172307596.jpg',
    ),
    Lesson(
      title: 'Backhand',
      description: 'Learn how to count',
      imageUrl: 'https://thumbs.dreamstime.com/z/male-tennis-player-forehand-racquet-swing-hitting-ball-172307596.jpg',
    ),
    Lesson(
      title: 'Serve',
      description: 'Learn how to name colors',
      imageUrl: 'https://thumbs.dreamstime.com/z/male-tennis-player-forehand-racquet-swing-hitting-ball-172307596.jpg',
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