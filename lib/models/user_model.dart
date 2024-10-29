// user_model.dart
class User {
  final String username;
  final String email;
  final String password;
  final String gender; // Added gender field
  final int age; // Added age field
  final String civilStatus; // Added civilStatus field

  User({
    required this.username,
    required this.email,
    required this.password,
    required this.gender,
    required this.age,
    required this.civilStatus,
  });

  // Converts a User to a string for storage
  String toStorageString() {
    return '$username,$email,$password,$gender,$age,$civilStatus';
  }

  // Creates a User from a storage string
  factory User.fromStorageString(String storageString) {
    final parts = storageString.split(',');
    return User(
      username: parts[0],
      email: parts[1],
      password: parts[2],
      gender: parts[3],
      age: int.parse(parts[4]),
      civilStatus: parts[5],
    );
  }
}
