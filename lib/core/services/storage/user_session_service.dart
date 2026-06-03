import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

//shared prefs provider
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError("shared preferences");
});

//provider
final userSessionServiceProvider = Provider<UserSessionService>((ref) {
  return UserSessionService(prefs: ref.read(sharedPreferencesProvider));
});

class UserSessionService {
  final SharedPreferences _prefs;

  UserSessionService({required SharedPreferences prefs}) : _prefs = prefs;

  //keys for storing data
  static const String _keysIsLoggedIn = 'is_logged_in';
  static const String _keyUserId = 'user_id';
  static const String _keyUserEmail = 'user_email';
  static const String _keyUsername = 'user_name';
  static const String _keyUserFullName = 'user_full_name';
  static const String _keyUserPhoneNumber = 'user_phone_number';
  static const String _keyUserBatchId = 'user_batch_id';
  static const String _keyUserProfileImage = 'user_profile_image';

  //store user session data
  Future<void> saveUserSession({
    required String userId,
    required String email,
    required String username,
    required String fullName,
    required String? phoneNumber,
    required String? batchId,
    String? profilePicture,
  }) async {
    await _prefs.setBool(_keysIsLoggedIn, true);
    await _prefs.setString(_keyUserId, userId);
    await _prefs.setString(_keyUserEmail, email);
    await _prefs.setString(_keyUsername, username);
    await _prefs.setString(_keyUserFullName, fullName);
    if (phoneNumber != null) {
      await _prefs.setString(_keyUserPhoneNumber, phoneNumber);
    }
    if (batchId != null) {
      await _prefs.setString(_keyUserBatchId, batchId);
    }
    if (profilePicture != null) {
      await _prefs.setString(_keyUserProfileImage, profilePicture);
    }
  }

  //clear user session data
  Future<void> clearUserSession() async {
    await _prefs.remove(_keysIsLoggedIn);
    await _prefs.remove(_keyUserId);
    await _prefs.remove(_keyUserEmail);
    await _prefs.remove(_keyUsername);
    await _prefs.remove(_keyUserFullName);
    await _prefs.remove(_keyUserPhoneNumber);
    await _prefs.remove(_keyUserBatchId);
    await _prefs.remove(_keyUserProfileImage);
  }

  bool isLoggedIn() {
    return _prefs.getBool(_keysIsLoggedIn) ?? false;
  }

  String? getUserId() => _prefs.getString(_keyUserId);
  String? getUserEmail() => _prefs.getString(_keyUserEmail);
  String? getUsername() => _prefs.getString(_keyUsername);
  String? getUserFullName() => _prefs.getString(_keyUserFullName);
  String? getUserPhoneNumber() => _prefs.getString(_keyUserPhoneNumber);
  String? getUserBatchId() => _prefs.getString(_keyUserBatchId);
  String? getUserProfileImage() => _prefs.getString(_keyUserProfileImage);
}
