// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizz_lecious/feat/login_or_signup/authentication_bloc/authentication_bloc.dart';
import 'package:user_repository/src/user_repo_actual.dart';

class Pizzelicious extends StatelessWidget {
  final UserRepository userRepository;
  const Pizzelicious(this.userRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthenticationBloc>(create: (context) {});
  }
}
