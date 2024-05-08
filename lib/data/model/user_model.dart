class UserModel {
  final String uid;
  final String userName;
  final String email;
  final bool block;

  UserModel({
    required this.uid,
    required this.userName,
    required this.email,
    required this.block,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      userName: map['userName'] ?? '',
      email: map['email'] ?? '',
      block: map['block'] ?? false,
    );
  }
}
