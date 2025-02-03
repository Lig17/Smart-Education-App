
class UserModel {
  final String id;
  final String name;
  final String email;
  final String profilePicture;
  final List<String> enrolledCourses;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePicture,
    required this.enrolledCourses,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
      enrolledCourses: List<String>.from(json['enrolledCourses'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profilePicture': profilePicture,
      'enrolledCourses': enrolledCourses,
    };
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? profilePicture,
    List<String>? enrolledCourses,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profilePicture: profilePicture ?? this.profilePicture,
      enrolledCourses: enrolledCourses ?? this.enrolledCourses,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, profilePicture: $profilePicture, enrolledCourses: $enrolledCourses)';
  }
}
