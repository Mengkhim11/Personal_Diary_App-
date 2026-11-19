
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_diary_app/model/diary.dart';
import 'package:personal_diary_app/model/diary_entry.dart';
import 'package:personal_diary_app/model/mood.dart';
import 'package:personal_diary_app/service/diary_service.dart';

void main() {
  group('DiaryService Tests', () {
    late Diary diary;
    late DiaryService service;

    DiaryEntry createEntry({
      String id = 'E001',
      String title = 'My First Day',
      String content = 'Today was wonderful.',
      DateTime? date,
    }) {
      return DiaryEntry(
        entryId: id,
        title: title,
        content: content,
        date: date ?? DateTime(2026, 1, 1),
        mood: Mood.happy,
      );
    }

    setUp(() {
      diary = Diary(diaryId: 'D001', name: 'My Diary');
      service = DiaryService(diary);
    });

    test('TC-07: Add a valid diary entry', () {
      service.addEntry(createEntry());

      expect(diary.totalEntries, 1);
    });

    test('TC-08: Reject an entry with an empty title', () {
      expect(
        () => service.addEntry(createEntry(title: '   ')),
        throwsArgumentError,
      );

      expect(diary.totalEntries, 0);
    });

    test('TC-09: Reject duplicate entry IDs', () {
      service.addEntry(createEntry());

      expect(
        () => service.addEntry(createEntry()),
        throwsArgumentError,
      );

      expect(diary.totalEntries, 1);
    });

    test('TC-10: Update an existing diary entry', () {
      service.addEntry(createEntry());

      final updatedEntry = createEntry(
        title: 'Updated Title',
        content: 'Updated content.',
      );

      service.updateEntry(updatedEntry);

      expect(diary.entries.first.title, 'Updated Title');
      expect(diary.entries.first.content, 'Updated content.');
    });

    test('TC-11: Delete an existing diary entry', () {
      service.addEntry(createEntry());

      service.deleteEntry('E001');

      expect(diary.totalEntries, 0);
    });

    test('TC-12: Search entries by keyword', () {
      service.addEntry(createEntry(
        id: 'E001',
        title: 'My Holiday',
        content: 'I visited the beach.',
      ));

      service.addEntry(createEntry(
        id: 'E002',
        title: 'My School Day',
        content: 'I studied Flutter.',
      ));

      final results = service.searchEntries('beach');

      expect(results.length, 1);
      expect(results.first.entryId, 'E001');
    });

    test('TC-13: Find entries by date', () {
      service.addEntry(createEntry(
        id: 'E001',
        date: DateTime(2026, 1, 1),
      ));

      service.addEntry(createEntry(
        id: 'E002',
        date: DateTime(2026, 1, 2),
      ));

      final results = service.getEntriesByDate(DateTime(2026, 1, 1));

      expect(results.length, 1);
      expect(results.first.entryId, 'E001');
    });
  });
}
