import 'package:flutter/material.dart';

class Course {
  Course(
      {required this.language,
      required this.level,
      required this.progress,
      required this.color,
      required this.circleColor,
      required this.progressDecimal});

  String language, level, progress;
  double progressDecimal;
  Color color;
  Color? circleColor;
}

List<Course> courses = [
  Course(
    language: 'French',
    level: 'Intermediate',
    progress: '94',
    color: Colors.pinkAccent,
    progressDecimal: 0.94,
    circleColor: Colors.pink[600],
  ),
  Course(
    language: 'Italian',
    level: 'Advanced',
    progress: '16',
    color: const Color.fromARGB(241, 16, 203, 1),
    progressDecimal: 0.16,
    circleColor: Colors.green[600],
  ),
  Course(
    language: 'Spanish',
    level: 'Beginner',
    progress: '43',
    color: Colors.orange,
    progressDecimal: 0.43,
    circleColor: Colors.orange[600],
  ),

  Course(
    language: 'Chinese',
    level: 'Beginner',
    progress: '9',
    color: Colors.red,
    progressDecimal: 0.09,
    circleColor: Colors.red[600],
  ),
];
