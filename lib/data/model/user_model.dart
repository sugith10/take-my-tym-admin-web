class UserModel {
   String uid;
   String userName;
   String email;
   bool blocked;

  UserModel({
    required this.uid,
    required this.userName,
    required this.email,
    required this.blocked,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      userName: map['userName'] ?? '',
      email: map['email'] ?? '',
      blocked: map['blocked'] ?? '',
    );
  }
}
