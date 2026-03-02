import 'package:flutter/material.dart';
import 'package:soc_med_app/models/message_post.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {

  String selectedMood = "Happy";
  TextEditingController captionController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Color moodColor = getMoodColor(selectedMood);

    return Scaffold(
      appBar: AppBar(title: Text("Create Post")),

      body: Padding(
        padding: EdgeInsets.all(16),

        child: Column(
          children: [

            // Mood Dropdown
            DropdownButton<String>(
              value: selectedMood,
              items: ["Happy", "Calm", "Energetic", "Sad", "Romantic", "Angry"]
                  .map((mood) => DropdownMenuItem(
                value: mood,
                child: Text(mood),
              ))
                  .toList(),

              onChanged: (value) {
                setState(() {
                  selectedMood = value!;
                });
              },
            ),

            // Caption Input
            TextField(
              controller: captionController,
              decoration: InputDecoration(labelText: "Caption"),
            ),

            SizedBox(height: 20),

            // Animated Preview
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: 150,
              width: double.infinity,

              decoration: BoxDecoration(
                color: moodColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),

              alignment: Alignment.center,
              child: Text(
                "Mood Preview",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}