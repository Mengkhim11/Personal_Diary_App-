
class Mood {
  final String moodId;
  final String moodName;
  final String emoji;

  const Mood({
    required this.moodId,
    required this.moodName,
    required this.emoji,
  });

  static const happy = Mood(
    moodId: '1',
    moodName: 'Happy',
    emoji: '😊',
  );

  static const sad = Mood(
    moodId: '2',
    moodName: 'Sad',
    emoji: '😢',
  );

  static const calm = Mood(
    moodId: '3',
    moodName: 'Calm',
    emoji: '😌',
  );

  static const excited = Mood(
    moodId: '4',
    moodName: 'Excited',
    emoji: '🤩',
  );

  static const List<Mood> predefinedMoods = [
    happy,
    sad,
    calm,
    excited,
  ];
}
