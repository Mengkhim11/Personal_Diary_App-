
import '../model/diary.dart';
import '../model/diary_entry.dart';

class DiaryService {
  final Diary diary;

  DiaryService(this.diary);

  // Add a new diary entry
  void addEntry(DiaryEntry entry) {
    if (entry.title.trim().isEmpty) {
      throw ArgumentError('Title cannot be empty.');
    }

    if (entry.content.trim().isEmpty) {
      throw ArgumentError('Content cannot be empty.');
    }

    if (diary.findEntryById(entry.entryId) != null) {
      throw ArgumentError('An entry with this ID already exists.');
    }

    diary.addEntry(entry);
  }

  // Update an existing diary entry
  void updateEntry(DiaryEntry updatedEntry) {
    final index = diary.entries.indexWhere(
      (entry) => entry.entryId == updatedEntry.entryId,
    );

    if (index == -1) {
      throw StateError('Diary entry not found.');
    }

    if (updatedEntry.title.trim().isEmpty) {
      throw ArgumentError('Title cannot be empty.');
    }

    if (updatedEntry.content.trim().isEmpty) {
      throw ArgumentError('Content cannot be empty.');
    }

    diary.entries[index] = updatedEntry;
  }

  // Delete a diary entry
  void deleteEntry(String entryId) {
    final index = diary.entries.indexWhere(
      (entry) => entry.entryId == entryId,
    );

    if (index == -1) {
      throw StateError('Diary entry not found.');
    }

    diary.entries.removeAt(index);
  }

  // Search entries by title or content
  List<DiaryEntry> searchEntries(String keyword) {
    final query = keyword.trim().toLowerCase();

    if (query.isEmpty) {
      return [];
    }

    return diary.entries.where((entry) {
      return entry.title.toLowerCase().contains(query) ||
          entry.content.toLowerCase().contains(query);
    }).toList();
  }

  // Find entries for a specific date
  List<DiaryEntry> getEntriesByDate(DateTime date) {
    return diary.entries.where((entry) {
      return entry.date.year == date.year &&
          entry.date.month == date.month &&
          entry.date.day == date.day;
    }).toList();
  }
}
