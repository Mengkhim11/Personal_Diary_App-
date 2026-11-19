
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_diary_app/model/diary.dart';
import 'package:personal_diary_app/model/diary_entry.dart';
import 'package:personal_diary_app/model/mood.dart';
import 'package:personal_diary_app/model/app_settings.dart';

void main() {
  group('Personal Diary Model Tests', () {

    test('TC-01: Predefined moods should contain four moods', () {
      expect(Mood.predefinedMoods.length, 4);
    });

    test('TC-02: Diary should add a new entry', () {
      final diary = Diary(
        diaryId: 'D001',
        name: 'My Diary',
      );

      final entry = DiaryEntry(
        entryId: 'E001',
        title: 'My First Day',
        content: 'Today was wonderful.',
        date: DateTime(2026, 1, 1),
        mood: Mood.happy,
      );

      diary.addEntry(entry);

      expect(diary.totalEntries, 1);
    });

    test('TC-03: Diary should find an existing entry', () {
      final diary = Diary(
        diaryId: 'D001',
        name: 'My Diary',
      );

      final entry = DiaryEntry(
        entryId: 'E001',
        title: 'My First Day',
        content: 'Hello diary.',
        date: DateTime(2026, 1, 1),
        mood: Mood.happy,
      );

      diary.addEntry(entry);

      expect(diary.findEntryById('E001'), isNotNull);
    });

    test('TC-04: Diary should return null for missing entry', () {
      final diary = Diary(
        diaryId: 'D001',
        name: 'My Diary',
      );

      expect(diary.findEntryById('E999'), isNull);
    });

    test('TC-05: DiaryEntry copyWith should update title', () {
      final entry = DiaryEntry(
        entryId: 'E001',
        title: 'Old Title',
        content: 'My content',
        date: DateTime(2026, 1, 1),
        mood: Mood.happy,
      );

      final updatedEntry = entry.copyWith(
        title: 'New Title',
      );

      expect(updatedEntry.title, 'New Title');
      expect(updatedEntry.content, 'My content');
    });

    test('TC-06: AppSettings should use light theme by default', () {
      const settings = AppSettings();

      expect(settings.theme, AppTheme.light);
      expect(settings.isPinEnabled, false);
    });

  });
}
