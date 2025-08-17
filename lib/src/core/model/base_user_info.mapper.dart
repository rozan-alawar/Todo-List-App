// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'base_user_info.dart';

class BaseUserInfoMapper extends ClassMapperBase<BaseUserInfo> {
  BaseUserInfoMapper._();

  static BaseUserInfoMapper? _instance;
  static BaseUserInfoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BaseUserInfoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'BaseUserInfo';

  static String _$firstName(BaseUserInfo v) => v.firstName;
  static const Field<BaseUserInfo, String> _f$firstName =
      Field('firstName', _$firstName, key: r'first_name');
  static String _$lastName(BaseUserInfo v) => v.lastName;
  static const Field<BaseUserInfo, String> _f$lastName =
      Field('lastName', _$lastName, key: r'last_name');
  static bool _$subscribeNews(BaseUserInfo v) => v.subscribeNews;
  static const Field<BaseUserInfo, bool> _f$subscribeNews =
      Field('subscribeNews', _$subscribeNews, key: r'subscribe_news');
  static String _$email(BaseUserInfo v) => v.email;
  static const Field<BaseUserInfo, String> _f$email = Field('email', _$email);
  static String? _$dialCode(BaseUserInfo v) => v.dialCode;
  static const Field<BaseUserInfo, String> _f$dialCode =
      Field('dialCode', _$dialCode, key: r'dial_code', opt: true);
  static String? _$phone(BaseUserInfo v) => v.phone;
  static const Field<BaseUserInfo, String> _f$phone =
      Field('phone', _$phone, opt: true);

  @override
  final MappableFields<BaseUserInfo> fields = const {
    #firstName: _f$firstName,
    #lastName: _f$lastName,
    #subscribeNews: _f$subscribeNews,
    #email: _f$email,
    #dialCode: _f$dialCode,
    #phone: _f$phone,
  };

  static BaseUserInfo _instantiate(DecodingData data) {
    return BaseUserInfo(
        firstName: data.dec(_f$firstName),
        lastName: data.dec(_f$lastName),
        subscribeNews: data.dec(_f$subscribeNews),
        email: data.dec(_f$email),
        dialCode: data.dec(_f$dialCode),
        phone: data.dec(_f$phone));
  }

  @override
  final Function instantiate = _instantiate;

  static BaseUserInfo fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BaseUserInfo>(map);
  }

  static BaseUserInfo fromJson(String json) {
    return ensureInitialized().decodeJson<BaseUserInfo>(json);
  }
}

mixin BaseUserInfoMappable {
  String toJson() {
    return BaseUserInfoMapper.ensureInitialized()
        .encodeJson<BaseUserInfo>(this as BaseUserInfo);
  }

  Map<String, dynamic> toMap() {
    return BaseUserInfoMapper.ensureInitialized()
        .encodeMap<BaseUserInfo>(this as BaseUserInfo);
  }

  BaseUserInfoCopyWith<BaseUserInfo, BaseUserInfo, BaseUserInfo> get copyWith =>
      _BaseUserInfoCopyWithImpl<BaseUserInfo, BaseUserInfo>(
          this as BaseUserInfo, $identity, $identity);
  @override
  String toString() {
    return BaseUserInfoMapper.ensureInitialized()
        .stringifyValue(this as BaseUserInfo);
  }

  @override
  bool operator ==(Object other) {
    return BaseUserInfoMapper.ensureInitialized()
        .equalsValue(this as BaseUserInfo, other);
  }

  @override
  int get hashCode {
    return BaseUserInfoMapper.ensureInitialized()
        .hashValue(this as BaseUserInfo);
  }
}

extension BaseUserInfoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BaseUserInfo, $Out> {
  BaseUserInfoCopyWith<$R, BaseUserInfo, $Out> get $asBaseUserInfo =>
      $base.as((v, t, t2) => _BaseUserInfoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BaseUserInfoCopyWith<$R, $In extends BaseUserInfo, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? firstName,
      String? lastName,
      bool? subscribeNews,
      String? email,
      String? dialCode,
      String? phone});
  BaseUserInfoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BaseUserInfoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BaseUserInfo, $Out>
    implements BaseUserInfoCopyWith<$R, BaseUserInfo, $Out> {
  _BaseUserInfoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BaseUserInfo> $mapper =
      BaseUserInfoMapper.ensureInitialized();
  @override
  $R call(
          {String? firstName,
          String? lastName,
          bool? subscribeNews,
          String? email,
          Object? dialCode = $none,
          Object? phone = $none}) =>
      $apply(FieldCopyWithData({
        if (firstName != null) #firstName: firstName,
        if (lastName != null) #lastName: lastName,
        if (subscribeNews != null) #subscribeNews: subscribeNews,
        if (email != null) #email: email,
        if (dialCode != $none) #dialCode: dialCode,
        if (phone != $none) #phone: phone
      }));
  @override
  BaseUserInfo $make(CopyWithData data) => BaseUserInfo(
      firstName: data.get(#firstName, or: $value.firstName),
      lastName: data.get(#lastName, or: $value.lastName),
      subscribeNews: data.get(#subscribeNews, or: $value.subscribeNews),
      email: data.get(#email, or: $value.email),
      dialCode: data.get(#dialCode, or: $value.dialCode),
      phone: data.get(#phone, or: $value.phone));

  @override
  BaseUserInfoCopyWith<$R2, BaseUserInfo, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _BaseUserInfoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
