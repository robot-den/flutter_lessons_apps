class AuthResult {
  AuthResult({
    this.idToken = '',
    this.errorMsg = '',
    expiresAt,
  }) : expiresAt = expiresAt ?? DateTime.now();

  String errorMsg;
  String idToken;
  DateTime expiresAt;

  bool get isAuthd {
    if (idToken.isEmpty || expiresAt.isBefore(DateTime.now())) {
      return false;
    }

    return true;
  }

  bool get isFailed => errorMsg.isNotEmpty;
}
