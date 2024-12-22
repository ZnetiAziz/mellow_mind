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

    // Assign default values for missing fields
    return User(
      username: parts.length > 0 ? parts[0] : 'Unknown',
      email: parts.length > 1 ? parts[1] : 'unknown@example.com',
      password: parts.length > 2 ? parts[2] : '',
      gender: parts.length > 3 ? parts[3] : 'Not Specified',
      age: parts.length > 4 ? int.tryParse(parts[4]) ?? 0 : 0,
      civilStatus: parts.length > 5 ? parts[5] : 'Unknown',
    );
  }
}
