// ignore_for_file: implementation_imports

import 'package:equatable/equatable.dart';
import 'package:user_repository/src/models/models.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationUserChanges extends AuthenticationEvent {
  final MyUser? user;
  const AuthenticationUserChanges(this.user);
}
