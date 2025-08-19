import 'package:dart_mappable/dart_mappable.dart';

part 'auth_tokens.mapper.dart';

@MappableClass()
class AuthTokens with AuthTokensMappable {
  const AuthTokens({
    @MappableField(key: 'token') required this.accessToken,
    this.refreshToken,
  });

  final String accessToken;
  final String? refreshToken;
}
