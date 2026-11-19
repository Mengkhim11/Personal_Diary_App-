
import 'diary_entry.dart';
import 'app_settings.dart';

class Diary {
  final String diaryId;
  final String name;
  final List<DiaryEntry> entries;
  AppSettings settings;

  Diary({
    required this.diaryId,
    required this.name,
    List<DiaryEntry> entries = const [],
    this.settings = const AppSettings(),
  }) : entries = List<DiaryEntry>.from(entries);

  void addEntry(DiaryEntry entry) {
    entries.add(entry);
  }

  DiaryEntry? findEntryById(String entryId) {
    for (final entry in entries) {
      if (entry.entryId == entryId) {
        return entry;
      }
    }
    return null;
  }

  int get totalEntries => entries.length;
}
