import 'package:flutter/material.dart';

// Horizontal scroll mood filter

class MoodFilterBar extends StatelessWidget {
  final String selectedMood;
  final Function(String) onMoodSelected;

  MoodFilterBar({
    required this.selectedMood,
    required this.onMoodSelected,
  });

  final List<String> moods = [
    "All",
    "Happy",
    "Calm",
    "Energetic",
    "Sad",
    "Romantic",
    "Angry"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,

      child: ListView(
        scrollDirection: Axis.horizontal, // Horizontal scroll

        children: moods.map((mood) {

          final isSelected = mood == selectedMood;

          return GestureDetector(
            onTap: () => onMoodSelected(mood),

            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 16),

              decoration: BoxDecoration(
                color: isSelected ? Colors.black : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30),
              ),

              alignment: Alignment.center,

              child: Text(
                mood,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}