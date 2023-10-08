import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:groceries/features/groceries/view/groceries_list_screen.dart';
import 'package:groceries/models/models.dart';
import 'package:groceries/providers/auth_provider.dart';
import 'package:groceries/features/auth/view/auth_screen.dart';
import 'package:groceries/theme/theme.dart';

import 'repositories/auth/auth_repository.dart';

class GroceryApp extends ConsumerStatefulWidget {
  const GroceryApp({super.key});

  @override
  ConsumerState<GroceryApp> createState() => _GroceryAppState();
}

class _GroceryAppState extends ConsumerState<GroceryApp> {
  bool _isCheckingAuth = true;
  AuthResult? _initialAuthResult;

  @override
  void initState() {
    super.initState();

    GetIt.I<AuthRepository>().initialAuth().then((value) {
      setState(() {
        _initialAuthResult = value;
        _isCheckingAuth = false;
      });
    });
  }

  Widget mainContent() {
    if (_isCheckingAuth) {
      return const Center(child: CircularProgressIndicator());
    } else if (_initialAuthResult != null && _initialAuthResult!.isAuthd) {
      return const GroceriesListScreen();
    } else {
      AuthResult authResult = ref.watch(authProvider);

      return authResult.isAuthd
          ? const GroceriesListScreen()
          : AuthScreen(authResult: authResult);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: mainContent(),
    );
  }
}
