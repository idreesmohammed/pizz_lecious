// ignore_for_file: implementation_imports

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:pizz_lecious/feat/login_or_signup/authentication_bloc/authentication_event.dart';
import 'package:pizz_lecious/feat/login_or_signup/authentication_bloc/authentication_state.dart';
import 'package:user_repository/src/user_repo_actual.dart';
import 'package:user_repository/src/models/models.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  late final StreamSubscription<MyUser?> userSubscription;
  AuthenticationBloc({
    required this.userRepository,
  }) : super(const AuthenticationState.unknown()) {
    userSubscription = userRepository.user.listen(
      (eventUser) {
        add(AuthenticationUserChanges(eventUser));
      },
    );
    on<AuthenticationUserChanges>((event, emit) {
      if (event.user != MyUser.emptyUser) {}
    });
  }
}
