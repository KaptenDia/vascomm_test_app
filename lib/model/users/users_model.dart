class UserModel {
  final String email;
  final String token;
  final String? avatar;
  final String? firstName;
  final String? lastName;

  UserModel({
    required this.email,
    required this.token,
    this.avatar,
    this.firstName,
    this.lastName,
  });
}
