// user_model.dart
class User {
  final String username;
  final String email;
  final String password;

  User({required this.username, required this.email, required this.password});
}

class UserManager {
  List<User> _users = [];

  bool signup(String username, String email, String password) {
    if (_users.any((user) => user.email == email)) {
      return false; // User with this email already exists
    }
    _users.add(User(username: username, email: email, password: password));
    return true;
  }

  bool login(String email, String password) {
    return _users
        .any((user) => user.email == email && user.password == password);
  }

  String getUsernameByEmail(String email) {
    final user = _users.firstWhere((user) => user.email == email,
        orElse: () => throw Exception('User not found'));
    return user.username;
  }
}
