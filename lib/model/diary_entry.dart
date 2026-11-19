
import 'mood.dart';

class DiaryEntry {
  final String entryId;
  final String title;
  final String content;
  final DateTime date;
  final Mood mood;

  const DiaryEntry({
    required this.entryId,
    required this.title,
    required this.content,
    required this.date,
    required this.mood,
  });

  DiaryEntry copyWith({
    String? title,
    String? content,
    DateTime? date,
    Mood? mood,
  }) {
    return DiaryEntry(
      entryId: entryId,
      title: title ?? this.title,
      content: content ?? this.content,
      date: date ?? this.date,
      mood: mood ?? this.mood,
    );
  }
}
