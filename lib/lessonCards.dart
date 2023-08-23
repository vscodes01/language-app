import 'package:flutter/material.dart';

class LessonCards {
  final Icon icon;
  final String description, taskCompleted;
  final Color iconColor;
  final double percentCompleted;

  LessonCards({
    required this.description,
    required this.taskCompleted,
    required this.icon,
    required this.iconColor,
    required this.percentCompleted,
  });
}

List<LessonCards> dummyLessonCards = [
  LessonCards(
    description: 'Basics',
    taskCompleted: '4',
    icon: const Icon(
      Icons.file_copy,
      color: Colors.yellow,
      size: 40,
    ),
    iconColor: Colors.yellow,
    percentCompleted: 0.8,
  ),
  LessonCards(
    description: 'Occupations',
    taskCompleted: '3',
    icon: const Icon(
      Icons.cases_rounded,
      color: Colors.pink,
      size: 40,
    ),
    iconColor: Colors.pink,
    percentCompleted: 0.6,
  ),
  LessonCards(
    description: 'Conversation',
    taskCompleted: '5',
    icon: const Icon(
      Icons.chat_rounded,
      color: Colors.blue,
      size: 40,
    ),
    iconColor: Colors.blue,
    percentCompleted: 1.0,
  ),
  LessonCards(
    description: 'Places',
    taskCompleted: '4',
    icon: const Icon(
      Icons.place_rounded,
      color: Colors.green,
      size: 40,
    ),
    iconColor: Colors.green,
    percentCompleted: 0.8,
  ),
  LessonCards(
    description: 'Family Members',
    taskCompleted: '1',
    icon: const Icon(
      Icons.people_alt_rounded,
      color: Colors.purple,
      size: 40,
    ),
    iconColor: Colors.purple,
    percentCompleted: 0.2,
  ),
  LessonCards(
    description: 'Food',
    taskCompleted: '2',
    icon: const Icon(
      Icons.fastfood_rounded,
      color: Colors.lightBlueAccent,
      size: 40,
    ),
    iconColor: Colors.lightBlueAccent,
    percentCompleted: 0.4,
  ),
];
