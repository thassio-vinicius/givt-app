enum GrantRequest {
  password('password'),
  refreshToken('refresh_token');

  const GrantRequest(this.type);

  final String type;
}
