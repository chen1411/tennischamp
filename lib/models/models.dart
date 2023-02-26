class Course {
  final String title;
  final String image;
  final double progress;
  final List<Lesson> lessons;

  Course({
    required this.title,
    required this.image,
    required this.progress,
    required this.lessons,
  });
}

class Lesson {
  final String title;
  final String description;
  final String imageUrl; // add a new field for the image URL

  Lesson({
    required this.title,
    required this.description,
    required this.imageUrl, // include the image URL in the constructor
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'], // include the image URL in the factory method
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl, // include the image URL in the JSON representation
    };
  }
}
