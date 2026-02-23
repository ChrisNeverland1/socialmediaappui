import 'package:flutter/material.dart';
import 'package:soc_med_app/models/message_post.dart';
import 'package:soc_med_app/widgets/message_card.dart';
import 'package:soc_med_app/widgets/message_filter.dart';
import 'profile_screens.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  String selectedMood = "All"; // Current selected filter

  // SAMPLE POSTS (Mock Data)
  List<MessagePost> posts = [
    MessagePost(
      userName: "Chris",
      description: "Feeling amazing today!",
      imageURL: "https://tse2.mm.bing.net/th/id/OIP.SCTX4aGwCe6fn1zuhBvSkgHaDP?rs=1&pid=ImgDetMain&o=7&rm=3",
      moodColor: Colors.yellow,
      mood: "Happy",
    ),
    MessagePost(
      userName: "Alex",
      description: "Chill sunset vibes.",
      imageURL: "https://tse2.mm.bing.net/th/id/OIP.SCTX4aGwCe6fn1zuhBvSkgHaDP?rs=1&pid=ImgDetMain&o=7&rm=3",
      moodColor: Colors.blue,
      mood: "Calm",
    ),
    MessagePost(
      userName: "Sam",
      description: "Time to go for a run!",
      imageURL: "https://tse2.mm.bing.net/th/id/OIP.SCTX4aGwCe6fn1zuhBvSkgHaDP?rs=1&pid=ImgDetMain&o=7&rm=3",
      moodColor: Colors.orange,
      mood: "Energetic",
    ),
    MessagePost(
      userName: "Pugo",
      description: "My grade is 70.",
      imageURL: "https://tse2.mm.bing.net/th/id/OIP.SCTX4aGwCe6fn1zuhBvSkgHaDP?rs=1&pid=ImgDetMain&o=7&rm=3",
      moodColor: Colors.indigo,
      mood: "Sad",
    ),
    MessagePost(
      userName: "Gojo",
      description: "Belated happy valentines",
      imageURL: "https://tse2.mm.bing.net/th/id/OIP.SCTX4aGwCe6fn1zuhBvSkgHaDP?rs=1&pid=ImgDetMain&o=7&rm=3",
      moodColor: Colors.pink,
      mood: "Romantic",
    ),
    MessagePost(
      userName: "Baron",
      description: "The traffic today is frustrating.",
      imageURL: "https://tse2.mm.bing.net/th/id/OIP.SCTX4aGwCe6fn1zuhBvSkgHaDP?rs=1&pid=ImgDetMain&o=7&rm=3",
      moodColor: Colors.red,
      mood: "Angry",
    ),
  ];

  @override
  Widget build(BuildContext context) {

    // Filter logic
    List<MessagePost> filteredPosts = selectedMood == "All"
        ? posts
        : posts.where((post) => post.mood == selectedMood).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Message Board"),

        // Profile button
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProfileScreen(posts: posts),
                ),
              );
            },
          )
        ],
      ),

      body: Column(
        children: [

          // Horizontal Mood Filter Bar
          MoodFilterBar(
            selectedMood: selectedMood,
            onMoodSelected: (mood) {
              setState(() {
                selectedMood = mood; // Update filter
              });
            },
          ),

          // Feed (Scrollable)
          Expanded(
            child: ListView.builder(
              itemCount: filteredPosts.length,
              itemBuilder: (context, index) {
                return MessageCard(messagePost: filteredPosts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}