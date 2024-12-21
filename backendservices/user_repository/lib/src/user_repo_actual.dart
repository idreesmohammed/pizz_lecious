// ? This class is the actual user class which is used across the app

import 'package:user_repository/src/models/user.dart';

abstract class UserRepository {
  //? this is used to check the user authentication
  Stream<MyUser?> get user;
  Future<MyUser> signUp(MyUser myUser, String password);
  Future<void> signIn(String email, String password);
  Future<void> signOut();
  Future<void> setUserData(MyUser myUser);
}
