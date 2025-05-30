import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

class MoodTrackerScreen extends StatefulWidget {
  const MoodTrackerScreen({super.key});

  @override
  State<MoodTrackerScreen> createState() => _MoodTrackerScreenState();
}

class _MoodTrackerScreenState extends State<MoodTrackerScreen>
    with SingleTickerProviderStateMixin {
  String selectedMood = '';
  bool showToast = false;

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  final List<Map<String, String>> moods = [
    {'emoji': '😊', 'label': 'Happy'},
    {'emoji': '😢', 'label': 'Sad'},
    {'emoji': '😐', 'label': 'Neutral'},
    {'emoji': '😠', 'label': 'Angry'},
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void selectMood(String mood) {
    setState(() {
      selectedMood = mood;
    });
    _controller.forward(from: 0.0);
  }

  void saveMood() {
    if (selectedMood.isNotEmpty) {
      setState(() => showToast = true);
      Timer(const Duration(seconds: 2), () {
        setState(() => showToast = false);
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildMoodItem(Map<String, String> mood) {
    final isSelected = selectedMood == mood['emoji'];

    return GestureDetector(
      onTap: () => selectMood(mood['emoji']!),
      child: Column(
        children: [
          ScaleTransition(
            scale: isSelected ? _scaleAnimation : const AlwaysStoppedAnimation(1.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected
    ? Colors.deepPurple.withAlpha(51)  // 0.2 opacity => alpha 51
    : Colors.grey.shade200,
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
          ),
          const SizedBox(height: 6),
          Text(
            mood['label']!,
            style: const TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }

  Widget buildToast() {
    return Positioned(
      top: 20,
      right: 20,
      child: AnimatedOpacity(
        opacity: showToast ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              width: 300,
              height: 120,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(38), 
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.deepPurpleAccent.withAlpha(102)),
              ),
              child: Center(
                child: Text(
                  'Mood "$selectedMood" saved!',
                  style: const TextStyle(color: Colors.white, fontSize: 28),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Tracker'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'How are you feeling today?',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    alignment: WrapAlignment.center,
                    children: moods.map(buildMoodItem).toList(),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton.icon(
                    onPressed: saveMood,
                    icon: const Icon(Icons.save),
                    label: const Text('Save Mood'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          if (showToast) buildToast(),
        ],
      ),
    );
  }
}
