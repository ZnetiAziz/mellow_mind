import 'package:flutter_application_1/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/services/openai_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserManager {
  List<User> _users = [];
  User? _currentUser;
  late OpenAIService _openAIService;

  UserManager() {
    _loadUsers();
    _initializeOpenAIService();
  }

  // Initialize OpenAIService with API key
  void _initializeOpenAIService() {
    final apiKey = dotenv.env[
            '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'] ??
        '';
    _openAIService = OpenAIService(apiKey);
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
