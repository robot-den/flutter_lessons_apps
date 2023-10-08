import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:groceries/models/models.dart';
import 'package:groceries/providers/auth_provider.dart';

enum AuthMode { signup, login }

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({
    super.key,
    required this.authResult,
  });

  final AuthResult authResult;

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  var _authMode = AuthMode.login;
  final Map<String, String> _authData = {'email': '', 'password': ''};
  bool _isLoading = false;
  final _passwordController = TextEditingController();

  void _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    setState(() {
      _isLoading = true;
    });

    if (_authMode == AuthMode.login) {
      await ref.read(authProvider.notifier).logIn(
            _authData['email']!,
            _authData['password']!,
          );
    } else {
      await ref.read(authProvider.notifier).signUp(
            _authData['email']!,
            _authData['password']!,
          );
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.login) {
      setState(() {
        _authMode = AuthMode.signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: deviceSize.width > 600 ? 2 : 1,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 8.0,
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: _authMode == AuthMode.signup ? 320 : 260,
                  ),
                  width: deviceSize.width * 0.75,
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (widget.authResult.isFailed)
                            SizedBox(
                              child: Text(
                                widget.authResult.errorMsg,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Email',
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !value.contains('@')) {
                                return 'Invalid email!';
                              }

                              return null;
                            },
                            onSaved: (value) => _authData['email'] = value!,
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Password'),
                            obscureText: true,
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length < 8) {
                                return 'Password is too short!';
                              }

                              return null;
                            },
                            onSaved: (value) => _authData['password'] = value!,
                          ),
                          if (_authMode == AuthMode.signup)
                            TextFormField(
                              // TODO: try to remove this checks
                              enabled: _authMode == AuthMode.signup,
                              decoration: const InputDecoration(
                                labelText: 'Confirm Password',
                              ),
                              obscureText: true,
                              validator: _authMode == AuthMode.signup
                                  ? (value) {
                                      if (value != _passwordController.text) {
                                        return 'Passwords do not match!';
                                      }

                                      return null;
                                    }
                                  : null,
                            ),
                          const SizedBox(
                            height: 20,
                          ),
                          if (_isLoading)
                            const CircularProgressIndicator()
                          else
                            ElevatedButton(
                              onPressed: _submit,
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0,
                                  vertical: 8.0,
                                ),
                              ),
                              child: Text(
                                _authMode == AuthMode.login
                                    ? 'LOGIN'
                                    : 'SIGN UP',
                              ),
                            ),
                          TextButton(
                            onPressed: _switchAuthMode,
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0,
                                  vertical: 4,
                                ),
                                tapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap),
                            child: Text(
                              '${_authMode == AuthMode.login ? 'SIGNUP' : 'LOGIN'} INSTEAD',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
