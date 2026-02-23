import 'package:flutter/material.dart';
import 'package:soc_med_app/models/message_post.dart';

class ProfileScreen extends StatelessWidget {
  final List<MessagePost> posts;

  const ProfileScreen({required this.posts});

  @override
  Widget build(BuildContext context) {

    // Profile theme color = last post mood
    Color themeColor =
    posts.isNotEmpty ? posts.last.moodColor : Colors.grey;

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Profile"),
      ),
    );
  }
}