
enum AppTheme {
  light,
  dark,
}

class AppSettings {
  final String? pinHash;
  final bool isPinEnabled;
  final AppTheme theme;

  const AppSettings({
    this.pinHash,
    this.isPinEnabled = false,
    this.theme = AppTheme.light,
  });

  AppSettings copyWith({
    String? pinHash,
    bool? isPinEnabled,
    AppTheme? theme,
  }) {
    return AppSettings(
      pinHash: pinHash ?? this.pinHash,
      isPinEnabled: isPinEnabled ?? this.isPinEnabled,
      theme: theme ?? this.theme,
    );
  }
}
