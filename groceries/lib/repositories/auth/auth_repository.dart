import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:groceries/secrets.dart';
import 'package:groceries/models/models.dart';

// Local storage stub
String localToken = '';
// NOTE: it's broken because it updates on every app start. It must be saved in db
DateTime _localExpiresAt = DateTime.now();

class AuthRepository {
  AuthRepository({required this.dio});

  final Dio dio;

  Future<AuthResult> initialAuth() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? savedLocalToken = prefs.getString('savedLocalToken');
    final String? savedExpiresAt = prefs.getString('savedExpiresAt');
    if (savedLocalToken != null &&
        savedLocalToken.isNotEmpty &&
        savedExpiresAt != null &&
        savedExpiresAt.isNotEmpty) {
      final expiresAt = DateTime.parse(savedExpiresAt);
      localToken = savedLocalToken;
      _localExpiresAt = expiresAt;
      return AuthResult(idToken: savedLocalToken, expiresAt: expiresAt);
    }
    return AuthResult();
  }

  Future<AuthResult> signUp(String email, String password) async {
    String url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$WEB_API_KEY';
    Response response;

    try {
      response = await dio.post(
        url,
        data: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }),
      );
    } on DioException catch (e) {
      print(e.response);
      if (e.response != null) {
        final errorData = e.response!.data['error'] as Map<String, dynamic>;
        final errorMsg = errorData['message'] as String;
        return AuthResult(errorMsg: errorMsg);
      }

      return AuthResult(errorMsg: 'UNHANDLED_AUTH_ERROR 1');
    }

    print(response.data);
    if (response.statusCode == 200) {
      localToken = response.data['idToken'] as String;
      final expiresIn = int.parse(response.data['expiresIn'] as String);
      _localExpiresAt = _localExpiresAt.add(Duration(seconds: expiresIn));

      return AuthResult(idToken: localToken, expiresAt: _localExpiresAt);
    } else {
      return AuthResult(errorMsg: 'UNHANDLED_AUTH_ERROR 2');
    }
  }

  Future<AuthResult> logIn(String email, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$WEB_API_KEY';
    Response response;

    try {
      response = await dio.post(
        url,
        data: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }),
      );
    } on DioException catch (e) {
      print(e.response);
      if (e.response != null) {
        final errorData = e.response!.data['error'] as Map<String, dynamic>;
        final errorMsg = errorData['message'] as String;
        return AuthResult(errorMsg: errorMsg);
      }

      return AuthResult(errorMsg: 'UNHANDLED_AUTH_ERROR 3');
    }

    print(response.data);
    if (response.statusCode == 200) {
      localToken = response.data['idToken'] as String;
      final expiresIn = int.parse(response.data['expiresIn'] as String);
      _localExpiresAt = _localExpiresAt.add(Duration(seconds: expiresIn));

      await prefs.setString('savedLocalToken', localToken);
      await prefs.setString(
        'savedExpiresAt',
        _localExpiresAt.toIso8601String(),
      );

      return AuthResult(idToken: localToken, expiresAt: _localExpiresAt);
    } else {
      return AuthResult(errorMsg: 'UNHANDLED_AUTH_ERROR 4');
    }
  }
}
