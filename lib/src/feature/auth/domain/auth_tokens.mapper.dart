// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'auth_tokens.dart';

class AuthTokensMapper extends ClassMapperBase<AuthTokens> {
  AuthTokensMapper._();

  static AuthTokensMapper? _instance;
  static AuthTokensMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthTokensMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AuthTokens';

  static String _$accessToken(AuthTokens v) => v.accessToken;
  static const Field<AuthTokens, String> _f$accessToken =
      Field('accessToken', _$accessToken, key: r'token');
  static String? _$refreshToken(AuthTokens v) => v.refreshToken;
  static const Field<AuthTokens, String> _f$refreshToken =
      Field('refreshToken', _$refreshToken, opt: true);

  @override
  final MappableFields<AuthTokens> fields = const {
    #accessToken: _f$accessToken,
    #refreshToken: _f$refreshToken,
  };

  static AuthTokens _instantiate(DecodingData data) {
    return AuthTokens(
        accessToken: data.dec(_f$accessToken),
        refreshToken: data.dec(_f$refreshToken));
  }

  @override
  final Function instantiate = _instantiate;

  static AuthTokens fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthTokens>(map);
  }

  static AuthTokens fromJson(String json) {
    return ensureInitialized().decodeJson<AuthTokens>(json);
  }
}

mixin AuthTokensMappable {
  String toJson() {
    return AuthTokensMapper.ensureInitialized()
        .encodeJson<AuthTokens>(this as AuthTokens);
  }

  Map<String, dynamic> toMap() {
    return AuthTokensMapper.ensureInitialized()
        .encodeMap<AuthTokens>(this as AuthTokens);
  }

  AuthTokensCopyWith<AuthTokens, AuthTokens, AuthTokens> get copyWith =>
      _AuthTokensCopyWithImpl<AuthTokens, AuthTokens>(
          this as AuthTokens, $identity, $identity);
  @override
  String toString() {
    return AuthTokensMapper.ensureInitialized()
        .stringifyValue(this as AuthTokens);
  }

  @override
  bool operator ==(Object other) {
    return AuthTokensMapper.ensureInitialized()
        .equalsValue(this as AuthTokens, other);
  }

  @override
  int get hashCode {
    return AuthTokensMapper.ensureInitialized().hashValue(this as AuthTokens);
  }
}

extension AuthTokensValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AuthTokens, $Out> {
  AuthTokensCopyWith<$R, AuthTokens, $Out> get $asAuthTokens =>
      $base.as((v, t, t2) => _AuthTokensCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AuthTokensCopyWith<$R, $In extends AuthTokens, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? accessToken, String? refreshToken});
  AuthTokensCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AuthTokensCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AuthTokens, $Out>
    implements AuthTokensCopyWith<$R, AuthTokens, $Out> {
  _AuthTokensCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AuthTokens> $mapper =
      AuthTokensMapper.ensureInitialized();
  @override
  $R call({String? accessToken, Object? refreshToken = $none}) =>
      $apply(FieldCopyWithData({
        if (accessToken != null) #accessToken: accessToken,
        if (refreshToken != $none) #refreshToken: refreshToken
      }));
  @override
  AuthTokens $make(CopyWithData data) => AuthTokens(
      accessToken: data.get(#accessToken, or: $value.accessToken),
      refreshToken: data.get(#refreshToken, or: $value.refreshToken));

  @override
  AuthTokensCopyWith<$R2, AuthTokens, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AuthTokensCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
