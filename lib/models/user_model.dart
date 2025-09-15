class UserModel {
  final String uid;
  final String? username;
  final String email;
  final String location;

  UserModel({
    required this.uid,
    required this.username,
    required this.email,
    required this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "username": username,
      "email": email,
      "location": location,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map["uid"],
      username: map["username"],
      email: map["email"],
      location: map["location"],
    );
  }
}