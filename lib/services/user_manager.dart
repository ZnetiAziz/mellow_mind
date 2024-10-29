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
      _users = userList
          .map((userString) => User.fromStorageString(userString))
          .toList();
    }
  }

  Future<void> _saveUsers() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> userList =
        _users.map((user) => user.toStorageString()).toList();
    await prefs.setStringList('users', userList);
  }

  bool signup(String username, String email, String password, String gender,
      String civilStatus, int age) {
    if (_users.any((user) => user.email == email)) {
      print('User with this email already exists.');
      return false;
    }

    _users.add(User(
      username: username,
      email: email,
      password: password,
      gender: gender,
      age: age,
      civilStatus: civilStatus,
    ));
    _saveUsers();
    print('Signup successful');
    return true;
  }

  bool login(String email, String password) {
    _currentUser = _users.firstWhere(
      (user) => user.email == email && user.password == password,
      orElse: () => User(
          username: '',
          email: '',
          password: '',
          gender: '',
          age: 0,
          civilStatus: ''),
    );

    return _currentUser?.username.isNotEmpty ?? false;
  }

  void logout() {
    _currentUser = null;
  }

  String getUsernameByEmail(String email) {
    return _users
        .firstWhere((user) => user.email == email,
            orElse: () => User(
                username: '',
                email: '',
                password: '',
                gender: '',
                age: 0,
                civilStatus: ''))
        .username;
  }

  User? get currentUser => _currentUser;
}
