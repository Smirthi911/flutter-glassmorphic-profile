import 'package:flutter/material.dart';

class MoodTrackerScreen extends StatefulWidget {
  const MoodTrackerScreen({super.key});

  @override
  State<MoodTrackerScreen> createState() => _MoodTrackerScreenState();
}

class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
  String selectedMood = '';

  final List<Map<String, String>> moods = [
    {'emoji': '😊', 'label': 'Happy'},
    {'emoji': '😢', 'label': 'Sad'},
    {'emoji': '😐', 'label': 'Neutral'},
    {'emoji': '😠', 'label': 'Angry'},
  ];

  void selectMood(String mood) {
    setState(() {
      selectedMood = mood;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Tracker'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'How are you feeling today?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Wrap(
              spacing: 20,
              children: moods.map((mood) {
                final isSelected = selectedMood == mood['emoji'];
                return GestureDetector(
                  onTap: () => selectMood(mood['emoji']!),
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.deepPurple.withOpacity(0.2) : Colors.grey.shade200,
                          shape: BoxShape.circle,
                          border: isSelected
                              ? Border.all(color: Colors.deepPurpleAccent, width: 2)
                              : null,
                        ),
                        child: Text(
                          mood['emoji']!,
                          style: const TextStyle(fontSize: 40),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        mood['label']!,
                        style: const TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
