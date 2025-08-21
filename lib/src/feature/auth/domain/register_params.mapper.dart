// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'register_params.dart';

class RegisterParamsMapper extends ClassMapperBase<RegisterParams> {
  RegisterParamsMapper._();

  static RegisterParamsMapper? _instance;
  static RegisterParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RegisterParamsMapper._());
      BaseUserInfoMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RegisterParams';

  static String _$firstName(RegisterParams v) => v.firstName;
  static const Field<RegisterParams, String> _f$firstName =
      Field('firstName', _$firstName);
  static String _$lastName(RegisterParams v) => v.lastName;
  static const Field<RegisterParams, String> _f$lastName =
      Field('lastName', _$lastName);
  static String _$confirmPassword(RegisterParams v) => v.confirmPassword;
  static const Field<RegisterParams, String> _f$confirmPassword =
      Field('confirmPassword', _$confirmPassword);
  static String _$email(RegisterParams v) => v.email;
  static const Field<RegisterParams, String> _f$email = Field('email', _$email);
  static String _$password(RegisterParams v) => v.password;
  static const Field<RegisterParams, String> _f$password =
      Field('password', _$password);
  static String? _$phone(RegisterParams v) => v.phone;
  static const Field<RegisterParams, String> _f$phone =
      Field('phone', _$phone, opt: true);

  @override
  final MappableFields<RegisterParams> fields = const {
    #firstName: _f$firstName,
    #lastName: _f$lastName,
    #confirmPassword: _f$confirmPassword,
    #email: _f$email,
    #password: _f$password,
    #phone: _f$phone,
  };

  static RegisterParams _instantiate(DecodingData data) {
    return RegisterParams(
        firstName: data.dec(_f$firstName),
        lastName: data.dec(_f$lastName),
        confirmPassword: data.dec(_f$confirmPassword),
        email: data.dec(_f$email),
        password: data.dec(_f$password),
        phone: data.dec(_f$phone));
  }

  @override
  final Function instantiate = _instantiate;

  static RegisterParams fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RegisterParams>(map);
  }

  static RegisterParams deserialize(String json) {
    return ensureInitialized().decodeJson<RegisterParams>(json);
  }
}

mixin RegisterParamsMappable {
  String serialize() {
    return RegisterParamsMapper.ensureInitialized()
        .encodeJson<RegisterParams>(this as RegisterParams);
  }

  Map<String, dynamic> toJson() {
    return RegisterParamsMapper.ensureInitialized()
        .encodeMap<RegisterParams>(this as RegisterParams);
  }

  RegisterParamsCopyWith<RegisterParams, RegisterParams, RegisterParams>
      get copyWith =>
          _RegisterParamsCopyWithImpl<RegisterParams, RegisterParams>(
              this as RegisterParams, $identity, $identity);
  @override
  String toString() {
    return RegisterParamsMapper.ensureInitialized()
        .stringifyValue(this as RegisterParams);
  }

  @override
  bool operator ==(Object other) {
    return RegisterParamsMapper.ensureInitialized()
        .equalsValue(this as RegisterParams, other);
  }

  @override
  int get hashCode {
    return RegisterParamsMapper.ensureInitialized()
        .hashValue(this as RegisterParams);
  }
}

extension RegisterParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RegisterParams, $Out> {
  RegisterParamsCopyWith<$R, RegisterParams, $Out> get $asRegisterParams =>
      $base.as((v, t, t2) => _RegisterParamsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RegisterParamsCopyWith<$R, $In extends RegisterParams, $Out>
    implements BaseUserInfoCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? firstName,
      String? lastName,
      String? confirmPassword,
      String? email,
      String? password,
      String? phone});
  RegisterParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _RegisterParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RegisterParams, $Out>
    implements RegisterParamsCopyWith<$R, RegisterParams, $Out> {
  _RegisterParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RegisterParams> $mapper =
      RegisterParamsMapper.ensureInitialized();
  @override
  $R call(
          {String? firstName,
          String? lastName,
          String? confirmPassword,
          String? email,
          String? password,
          Object? phone = $none}) =>
      $apply(FieldCopyWithData({
        if (firstName != null) #firstName: firstName,
        if (lastName != null) #lastName: lastName,
        if (confirmPassword != null) #confirmPassword: confirmPassword,
        if (email != null) #email: email,
        if (password != null) #password: password,
        if (phone != $none) #phone: phone
      }));
  @override
  RegisterParams $make(CopyWithData data) => RegisterParams(
      firstName: data.get(#firstName, or: $value.firstName),
      lastName: data.get(#lastName, or: $value.lastName),
      confirmPassword: data.get(#confirmPassword, or: $value.confirmPassword),
      email: data.get(#email, or: $value.email),
      password: data.get(#password, or: $value.password),
      phone: data.get(#phone, or: $value.phone));

  @override
  RegisterParamsCopyWith<$R2, RegisterParams, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _RegisterParamsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
