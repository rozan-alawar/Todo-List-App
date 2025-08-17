import 'app_theme.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_app_theme_provider.g.dart';

@Riverpod(keepAlive: true)
AppThemeMode currentAppThemeMode(CurrentAppThemeModeRef ref) {
  return AppThemeMode.dark;
}

// Riverpod(keepAlive: true)
// class AppThemeMode extends _$AppThemeMode {
//   static const _storageKey = 'theme_mode';

//   @override
//   ThemeMode build() {
//     final savedThemeMode = ref.read(sharedPrefFacadeProvider).restoreData<int>(_storageKey);

//     /// Returns the theme mode based on the saved theme mode value.
//     /// If the saved theme mode value is not null, it returns the corresponding ThemeMode value.
//     /// Otherwise, it returns the system theme mode.
//     return savedThemeMode != null ? ThemeMode.values[savedThemeMode] : ThemeMode.dark;
//   }

//   /// Toggles the theme between light and dark mode.
//   ///
//   /// If the current theme is dark, it changes the theme to light mode.
//   /// If the current theme is light, it changes the theme to dark mode.
//   void toggleTheme() {
//     if (state == ThemeMode.dark) {
//       _changeTheme(ThemeMode.light);
//     } else {
//       _changeTheme(ThemeMode.dark);
//     }
//   }

//   /// Changes the theme mode of the application.
//   ///
//   /// The [themeMode] parameter specifies the new theme mode to be set.
//   /// It updates the theme mode in the shared preferences and updates the state of the theme controller.
//   void _changeTheme(ThemeMode themeMode) {
//     ref.read(sharedPrefFacadeProvider).saveData(key: _storageKey, value: themeMode.index);
//     state = themeMode;
//   }
// }
