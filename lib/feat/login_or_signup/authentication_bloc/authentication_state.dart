// ignore_for_file: implementation_imports

import 'package:equatable/equatable.dart';
import 'package:user_repository/src/models/models.dart';

enum AuthenticationStatus { authenticated, unauthenticated, unknown }

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final MyUser? user;
  const AuthenticationState._(
      {this.status = AuthenticationStatus.unknown, this.user});
  const AuthenticationState.unknown() : this._();
  const AuthenticationState.authenticated(MyUser user)
      : this._(status: AuthenticationStatus.authenticated, user: user);
  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object?> get props => [status, user];
}
