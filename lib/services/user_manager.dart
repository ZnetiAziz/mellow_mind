import 'package:flutter_application_1/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserManager {
  List<User> _users = [];
  User? _currentUser;

  UserManager() {
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? userList = prefs.getStringList('users');

    if (userList != null) {
      _users = userList.map((userString) {
        final parts = userString.split(',');
        return User(username: parts[0], email: parts[1], password: parts[2]);
      }).toList();
    }
  }

  Future<void> _saveUsers() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> userList = _users
        .map((user) => '${user.username},${user.email},${user.password}')
        .toList();
    await prefs.setStringList('users', userList);
  }

  bool signup(String username, String email, String password) {
    if (_users.any((user) => user.email == email)) {
      print('User with this email already exists.');
      return false;
    }

    _users.add(User(username: username, email: email, password: password));
    _saveUsers();
    print('Signup successful');
    return true;
  }

  bool login(String email, String password) {
    _currentUser = _users.firstWhere(
      (user) => user.email == email && user.password == password,
      orElse: () =>
          User(username: '', email: '', password: ''), // Return a default User
    );

    // Check if the username is not empty to determine login success
    return _currentUser?.username.isNotEmpty ?? false;
  }

  void logout() {
    _currentUser = null;
  }

  String getUsernameByEmail(String email) {
    return _users
        .firstWhere((user) => user.email == email,
            orElse: () => User(username: '', email: '', password: ''))
        .username;
  }

  User? get currentUser => _currentUser;
}
