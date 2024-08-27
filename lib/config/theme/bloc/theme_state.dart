part of 'theme_cubit.dart';

class ThemeState {
  final bool isDark;
  ThemeState({required this.isDark});

  ThemeState copyWith({bool? changeMode}) {
    return ThemeState(isDark: changeMode ?? isDark);
  }
}
