// user_model.dart
class User {
  final int id;
  final String username;
  final String email;
  final String
      password; // Note: In practice, you should never store passwords in plaintext

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }
}
