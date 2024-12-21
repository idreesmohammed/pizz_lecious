class MyUserEntity {
  String userId;
  String email;
  String name;
  bool isActive;
  MyUserEntity(
      {required this.email,
      required this.isActive,
      required this.name,
      required this.userId});
  Map<String, Object?> toDocument() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'isActive': isActive,
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> document) {
    return MyUserEntity(
      email: document['email'],
      isActive: document['isActive'],
      name: document['name'],
      userId: document['userId'],
    );
  }
}
