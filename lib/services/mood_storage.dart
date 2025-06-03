import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_blocks/models/mood_entry.dart';

class MoodStorage {
  static const _key = 'mood_entries';


  static Future<void> saveMoodEntry(MoodEntry entry) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);

    Map<String, dynamic> allEntries = {};

    if (data != null) {
      allEntries = jsonDecode(data);
    }

    final dateKey = entry.date.toIso8601String().split('T').first;
    allEntries[dateKey] = entry.toJson();

    await prefs.setString(_key, jsonEncode(allEntries));
  }

  static Future<List<MoodEntry>> loadMoodEntries() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);

    if (data == null) return [];

    final Map<String, dynamic> decoded = jsonDecode(data);

    return decoded.values
        .map((e) => MoodEntry.fromJson(e))
        .toList()
      ..sort((a, b) => b.date.compareTo(a.date)); // newest first
  }


  static Future<MoodEntry?> getMoodForDate(DateTime date) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);

    if (data == null) return null;

    final Map<String, dynamic> allEntries = jsonDecode(data);
    final dateKey = date.toIso8601String().split('T').first;

    if (allEntries.containsKey(dateKey)) {
      return MoodEntry.fromJson(allEntries[dateKey]);
    }

    return null;
  }
}
