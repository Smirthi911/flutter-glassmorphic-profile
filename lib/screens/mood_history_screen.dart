import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:ui_blocks/models/mood_entry.dart';
import 'package:ui_blocks/services/mood_storage.dart';

class MoodHistoryScreen extends StatefulWidget {
  const MoodHistoryScreen({super.key});

  @override
  State<MoodHistoryScreen> createState() => _MoodHistoryScreenState();
}

class _MoodHistoryScreenState extends State<MoodHistoryScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<MoodEntry> moodEntries = [];

  @override
  void initState() {
    super.initState();
    _loadMoodEntries();
  }

  Future<void> _loadMoodEntries() async {
    final entries = await MoodStorage.loadMoodEntries();
    setState(() {
      moodEntries = entries;
    });
  }

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
            onFormatChanged: (format) {},
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
                  orElse: () => MoodEntry(date: date, moodEmoji: ''),
                );
                if (mood.moodEmoji.isNotEmpty) {
                  return Center(
                    child: Text(mood.moodEmoji, style: const TextStyle(fontSize: 16)),
                  );
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: moodEntries.isEmpty
                ? const Center(child: Text("No mood data available."))
                : ListView.builder(
                    itemCount: moodEntries.length,
                    itemBuilder: (context, index) {
                      final entry = moodEntries[index];
                      return ListTile(
                        leading: Text(entry.moodEmoji, style: const TextStyle(fontSize: 24)),
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
