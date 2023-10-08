import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:groceries/models/models.dart';
import 'package:groceries/repositories/auth/auth_repository.dart';

class AuthNotifier extends StateNotifier<AuthResult> {
  AuthNotifier() : super(AuthResult());

  final repo = GetIt.I<AuthRepository>();

  Future<void> signUp(String email, String password) async {
    state = await repo.signUp(email, password);
  }

  Future<void> logIn(String email, String password) async {
    state = await repo.logIn(email, password);
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthResult>(
  (ref) => AuthNotifier(),
);
