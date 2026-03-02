import 'package:flutter/material.dart';

class MessagePost {
  final String userName;
  final String description;
  final String imageURL;
  final Color moodColor;
  final String mood;

  MessagePost({
    required this.userName,
    required this.description,
    required this.imageURL,
    required this.moodColor,
    required this.mood
  });
}


Color getMoodColor(String mood) {
  switch (mood) {
    case "Happy":
      return Colors.yellow;
    case "Calm":
      return Colors.blue;
    case "Energetic":
      return Colors.orange;
    case "Sad":
      return Colors.indigo;
    case "Romantic":
      return Colors.pink;
    case "Angry":
      return Colors.red;
    default:
      return Colors.grey;
  }
}