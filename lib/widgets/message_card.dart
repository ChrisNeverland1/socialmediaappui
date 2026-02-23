import 'package:flutter/material.dart';
import 'package:soc_med_app/models/message_post.dart';

class MessageCard extends StatelessWidget{
  final MessagePost messagePost;

  const MessageCard({required this.messagePost});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),

        color: messagePost.moodColor,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // IMAGE (Network Image)
          ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              heightFactor: 1,
              child: Image.network(messagePost.imageURL),
            ),
          ),

          // TEXT SECTION
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  messagePost.userName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(messagePost.description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}