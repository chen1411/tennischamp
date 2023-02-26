import 'package:flutter/material.dart';
import '../models/models.dart';
import '../screens/lesson_detail.dart';
import '../screens/video_player.dart';

class LessonTile extends StatelessWidget {
  final Lesson lesson;

  const LessonTile({Key? key, required this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const VideoPlayer()
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                lesson.imageUrl,
                height: 150.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16.0),
              Text(
                lesson.title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
