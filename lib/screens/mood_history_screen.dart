import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/mood_entry.dart';
import 'package:intl/intl.dart';

class MoodHistoryScreen extends StatefulWidget {
  const MoodHistoryScreen({super.key});

  @override
  State<MoodHistoryScreen> createState() => _MoodHistoryScreenState();
}

class _MoodHistoryScreenState extends State<MoodHistoryScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Temporary mood history (mock data)
  final List<MoodEntry> moodEntries = [
    MoodEntry(date: DateTime.now().subtract(const Duration(days: 1)), emoji: '😊'),
    MoodEntry(date: DateTime.now().subtract(const Duration(days: 2)), emoji: '😢'),
    MoodEntry(date: DateTime.now().subtract(const Duration(days: 3)), emoji: '😐'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mood History')),
      body: Column(
        children: [
          TableCalendar(
  firstDay: DateTime.utc(2020),
  lastDay: DateTime.utc(2030),
  focusedDay: _focusedDay,
  calendarFormat: CalendarFormat.month,
  availableCalendarFormats: const {
    CalendarFormat.month: 'Month',
  },
  onFormatChanged: (format) {
    // Prevent changing format
  },
  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
  onDaySelected: (selectedDay, focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  },
  calendarBuilders: CalendarBuilders(
    markerBuilder: (context, date, _) {
      final mood = moodEntries.firstWhere(
        (entry) => isSameDay(entry.date, date),
        orElse: () => MoodEntry(date: date, emoji: ''),
      );
      if (mood.emoji.isNotEmpty) {
        return Center(
          child: Text(mood.emoji, style: const TextStyle(fontSize: 16)),
        );
      }
      return null;
    },
  ),
),

          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: moodEntries.length,
              itemBuilder: (context, index) {
                final entry = moodEntries[index];
                return ListTile(
                  leading: Text(entry.emoji, style: const TextStyle(fontSize: 24)),
                  title: Text(DateFormat('yyyy-MM-dd').format(entry.date)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
