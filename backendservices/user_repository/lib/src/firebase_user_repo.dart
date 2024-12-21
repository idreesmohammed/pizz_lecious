import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:user_repository/constants/user_constants.dart';
import 'package:user_repository/src/entities/entities.dart';
import 'package:user_repository/src/models/user.dart';
import 'package:user_repository/src/user_repo_actual.dart';

class FirebaseUserRepo implements UserRepository {
  final FirebaseAuth _firebaseAuth;
  final userCollection =
      FirebaseFirestore.instance.collection(UserConstants.userCollection);
  FirebaseUserRepo({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<void> setUserData(MyUser myUser) async {
    try {
      await userCollection
          .doc(myUser.userId)
          .set(myUser.toEntity().toDocument());
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<MyUser> signUp(MyUser myUser, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: myUser.email, password: password);
      myUser.userId = user.user!.uid;
      return myUser;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Stream<MyUser?> get user {
    return _firebaseAuth.authStateChanges().flatMap((value) async* {
      if (value == null) {
        yield MyUser.emptyUser;
      } else {
        yield await userCollection.doc(value.uid).get().then(
              (val) =>
                  MyUser.fromEntity(MyUserEntity.fromDocument(val.data()!)),
            );
      }
    });
  }
}
