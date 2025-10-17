import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/src/feature/auth/domain/user_app_model.dart';

final sharedPreferencesServiceProvider = Provider<SharedPreferencesService>((
  ref,
) {
  return SharedPreferencesService();
});

class SharedPreferencesService {
  static const _userKey = 'user_data';
  static const _isLoggedInKey = 'is_logged_in';

  // Save user data
  Future<void> saveUser(UserApp user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, jsonEncode(user.toJson()));
    await prefs.setBool(_isLoggedInKey, true);
  }

  // Get saved user data
  Future<UserApp?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);

    if (userJson != null) {
      try {
        return UserAppMapper.fromJson(jsonDecode(userJson));
      } catch (e) {
        print('Error parsing user data: $e');
        return null;
      }
    }

    return null;
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  // Clear user data on logout
  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
    await prefs.setBool(_isLoggedInKey, false);
  }
}
