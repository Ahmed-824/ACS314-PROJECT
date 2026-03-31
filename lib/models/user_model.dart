class UserModel {
  final String id;
  final String name;
  final String email;
  final String? profilePicUrl; // Optional, in case you add photos later

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.profilePicUrl,
  });

  // Method to turn a JSON Map (from FlyEnv/API) into a User Object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'].toString(),
      name: json['name'] ?? 'Spotify User',
      email: json['email'] ?? '',
      profilePicUrl: json['profile_pic'],
    );
  }

  // Method to turn a User Object back into JSON (useful for local storage)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profile_pic': profilePicUrl,
    };
  }
}