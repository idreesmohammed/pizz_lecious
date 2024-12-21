import 'package:user_repository/src/entities/entities.dart';
export 'user.dart';

class MyUser {
  String userId;
  String email;
  String name;
  bool isActive;
  MyUser(
      {required this.email,
      required this.isActive,
      required this.name,
      required this.userId});
  static final emptyUser = MyUser(
    email: "",
    isActive: false,
    name: "",
    userId: "",
  );
  MyUserEntity toEntity() {
    return MyUserEntity(
      userId: userId,
      email: email,
      name: name,
      isActive: isActive,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      email: entity.email,
      isActive: entity.isActive,
      name: entity.name,
      userId: entity.userId,
    );
  }

  @override
  String toString() {
    return "MyUser: $userId, $email, $name, $isActive";
  }
}
