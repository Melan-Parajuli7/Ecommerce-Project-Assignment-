import "dart:convert"; // this dart convertor helps to convert the object to String (gives us jsonEncode)

import "package:shared_preferences/shared_preferences.dart"; // this is the dart package which helps to store data on the phone

// temporary  , until the phone closes

class AuthService {
  static const String _userKey = "registered_users";
  static const String _sessionKey = "logged_in_user"; // the _ makes them private and make them avaiable in this file only

  Future<SharedPreferences> get _prefs =>
      SharedPreferences.getInstance(); // Making the Storage

  // load All Users
  Future<Map<String, String>> _loadUsers() async {
    final prefs = await _prefs;
    final raw = prefs.getString(_userKey);
    if (raw == null) return {};
    return Map<String, String>.from(jsonDecode(raw) as Map);
  }

  // save all Users
  Future<void> _saveUsers(Map<String, String> users) async {
    final prefs = await _prefs;
    await prefs.setString(_userKey, jsonEncode(users));
  }

  // Creating Register Function

  Future<String?> register({
    required String name,
    required String email,
    required String username,
    required String password,
  }) async {
    final users = await _loadUsers();
    if (users.containsKey(username)) {
      return "Username Already Exists";
    }
    users[username] = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
    });
    await _saveUsers(users);
    return null;
  }

  // Creating Login Function

  Future<String?> login({
    required String username,
    required String password,
  }) async {
    final users = await _loadUsers();
    final raw = users[username];

    if (raw == null) return "Invalid Credientals";

    final data = jsonDecode(raw) as Map<String, dynamic>;
    if (data['password'] != password) return "Invalid Credientals";
    final prefs = await _prefs;
    await prefs.setString(_sessionKey, username);
    return null;
  }

  //logout function
  Future<void> logout() async {
    final prefs = await _prefs;
    await prefs.remove(_sessionKey); // while this key is removed the user after the clicking the logout button is redirected to the login_screen page
  }

  // Show Current User function
  Future<String?> currentUser() async {
    final prefs = await _prefs;
    return prefs.getString(_sessionKey);
  }

  // Show the Profile of User
  Future<Map<String, String>?> profileUser(String username) async {
    final users = await _loadUsers();
    final raw = users[username];
    if (raw == null) return null;
    final data = jsonDecode(raw) as Map<String, dynamic>;
    return {'name': data['name'] as String, 'email': data['email'] as String};
  }
}
