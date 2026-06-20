class AuthResponse {
  final String token;
  final String email;
  final String name;

  AuthResponse({
    required this.token,
    required this.email,
    required this.name,
  });

  factory AuthResponse.fromJson(
      Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'],
      email: json['email'],
      name: json['name'],
    );
  }
}