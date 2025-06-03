class MoodEntry {
  final DateTime date;
  final String moodEmoji;

  MoodEntry({required this.date, required this.moodEmoji});

  Map<String, dynamic> toJson() => {
        'date': date.toIso8601String(),
        'moodEmoji': moodEmoji,
      };

  factory MoodEntry.fromJson(Map<String, dynamic> json) => MoodEntry(
        date: DateTime.parse(json['date']),
        moodEmoji: json['moodEmoji'],
      );
}
