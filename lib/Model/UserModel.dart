class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;
  UserModel(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatar});
  factory UserModel.fromJson(Map<String, dynamic> j) {
    return UserModel(
        id: j['id'],
        email: j['email'],
        firstName: j['first_name'],
        lastName: j['last_name'],
        avatar: j['avatar'] ??
            'https://www.freepik.com/free-icon/volleyball_15489367.htm');
  }
}
