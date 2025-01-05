class User {
  final String username;
  final String email;
  final String hashedPassword; //hashPassword stored instead of password for security re

  User({
    required this.username,
    required this.email,
    required this.hashedPassword, 
  });

  String get getHashedPassword => hashedPassword;
}
