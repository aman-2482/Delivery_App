import 'dart:async';

/// Simple in-memory stand-in for the project's SharedPreference helper.
/// This avoids build-time errors on web. Replace with the real
/// `shared_preferences` backed implementation when available.
class SharedPreferenceHelper {
  static final Map<String, String> _memory = {};

  Future<void> saveUserName(String name) async {
    _memory['name'] = name;
  }

  Future<void> saveUserEmail(String email) async {
    _memory['email'] = email;
  }

  Future<void> saveUserWallet(String wallet) async {
    _memory['wallet'] = wallet;
  }

  Future<void> saveUserid(String id) async {
    _memory['userid'] = id;
  }

  Future<void> saveUserprofile(String profileUrl) async {
    _memory['profile'] = profileUrl;
  }

  Future<String?> getUserId() async {
    return _memory['userid'];
  }

  Future<String?> getUserWallet() async {
    return _memory['wallet'];
  }

  Future<String?> getUserProfile() async {
    return _memory['profile'];
  }

  Future<String?> getUserName() async {
    return _memory['name'];
  }

  Future<String?> getUserEmail() async {
    return _memory['email'];
  }
}
