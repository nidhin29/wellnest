class TokenManager {
  TokenManager._internal();
  static TokenManager instance = TokenManager._internal();
  factory TokenManager() => instance;

  String? _email;

  String? get email => _email;

  setEmail(String email) {
    _email = email;
  }
}
