// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_app_model.dart';

class UserAppMapper extends ClassMapperBase<UserApp> {
  UserAppMapper._();

  static UserAppMapper? _instance;
  static UserAppMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserAppMapper._());
      BaseUserInfoMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserApp';

  static int _$id(UserApp v) => v.id;
  static const Field<UserApp, int> _f$id = Field('id', _$id);
  static String _$firstName(UserApp v) => v.firstName;
  static const Field<UserApp, String> _f$firstName =
      Field('firstName', _$firstName, key: r'first_name');
  static String _$lastName(UserApp v) => v.lastName;
  static const Field<UserApp, String> _f$lastName =
      Field('lastName', _$lastName, key: r'last_name');
  static String _$email(UserApp v) => v.email;
  static const Field<UserApp, String> _f$email = Field('email', _$email);
  static String? _$phone(UserApp v) => v.phone;
  static const Field<UserApp, String> _f$phone = Field('phone', _$phone);
  static bool _$subscribeNews(UserApp v) => v.subscribeNews;
  static const Field<UserApp, bool> _f$subscribeNews =
      Field('subscribeNews', _$subscribeNews, key: r'subscribe_news');
  static String _$fullName(UserApp v) => v.fullName;
  static const Field<UserApp, String> _f$fullName =
      Field('fullName', _$fullName, key: r'full_name');
  static String _$phoneNumber(UserApp v) => v.phoneNumber;
  static const Field<UserApp, String> _f$phoneNumber =
      Field('phoneNumber', _$phoneNumber, key: r'phone_number');
  static String _$imageUrl(UserApp v) => v.imageUrl;
  static const Field<UserApp, String> _f$imageUrl =
      Field('imageUrl', _$imageUrl, key: r'image');

  @override
  final MappableFields<UserApp> fields = const {
    #id: _f$id,
    #firstName: _f$firstName,
    #lastName: _f$lastName,
    #email: _f$email,
    #phone: _f$phone,
    #subscribeNews: _f$subscribeNews,
    #fullName: _f$fullName,
    #phoneNumber: _f$phoneNumber,
    #imageUrl: _f$imageUrl,
  };

  static UserApp _instantiate(DecodingData data) {
    return UserApp(
        id: data.dec(_f$id),
        firstName: data.dec(_f$firstName),
        lastName: data.dec(_f$lastName),
        email: data.dec(_f$email),
        phone: data.dec(_f$phone),
        subscribeNews: data.dec(_f$subscribeNews),
        fullName: data.dec(_f$fullName),
        phoneNumber: data.dec(_f$phoneNumber),
        imageUrl: data.dec(_f$imageUrl));
  }

  @override
  final Function instantiate = _instantiate;

  static UserApp fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserApp>(map);
  }

  static UserApp fromJson(String json) {
    return ensureInitialized().decodeJson<UserApp>(json);
  }
}

mixin UserAppMappable {
  String toJson() {
    return UserAppMapper.ensureInitialized()
        .encodeJson<UserApp>(this as UserApp);
  }

  Map<String, dynamic> toMap() {
    return UserAppMapper.ensureInitialized()
        .encodeMap<UserApp>(this as UserApp);
  }

  UserAppCopyWith<UserApp, UserApp, UserApp> get copyWith =>
      _UserAppCopyWithImpl<UserApp, UserApp>(
          this as UserApp, $identity, $identity);
  @override
  String toString() {
    return UserAppMapper.ensureInitialized().stringifyValue(this as UserApp);
  }

  @override
  bool operator ==(Object other) {
    return UserAppMapper.ensureInitialized()
        .equalsValue(this as UserApp, other);
  }

  @override
  int get hashCode {
    return UserAppMapper.ensureInitialized().hashValue(this as UserApp);
  }
}

extension UserAppValueCopy<$R, $Out> on ObjectCopyWith<$R, UserApp, $Out> {
  UserAppCopyWith<$R, UserApp, $Out> get $asUserApp =>
      $base.as((v, t, t2) => _UserAppCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserAppCopyWith<$R, $In extends UserApp, $Out>
    implements BaseUserInfoCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {int? id,
      String? firstName,
      String? lastName,
      String? email,
      String? phone,
      bool? subscribeNews,
      String? fullName,
      String? phoneNumber,
      String? imageUrl});
  UserAppCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserAppCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserApp, $Out>
    implements UserAppCopyWith<$R, UserApp, $Out> {
  _UserAppCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserApp> $mapper =
      UserAppMapper.ensureInitialized();
  @override
  $R call(
          {int? id,
          String? firstName,
          String? lastName,
          String? email,
          Object? phone = $none,
          bool? subscribeNews,
          String? fullName,
          String? phoneNumber,
          String? imageUrl}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (firstName != null) #firstName: firstName,
        if (lastName != null) #lastName: lastName,
        if (email != null) #email: email,
        if (phone != $none) #phone: phone,
        if (subscribeNews != null) #subscribeNews: subscribeNews,
        if (fullName != null) #fullName: fullName,
        if (phoneNumber != null) #phoneNumber: phoneNumber,
        if (imageUrl != null) #imageUrl: imageUrl
      }));
  @override
  UserApp $make(CopyWithData data) => UserApp(
      id: data.get(#id, or: $value.id),
      firstName: data.get(#firstName, or: $value.firstName),
      lastName: data.get(#lastName, or: $value.lastName),
      email: data.get(#email, or: $value.email),
      phone: data.get(#phone, or: $value.phone),
      subscribeNews: data.get(#subscribeNews, or: $value.subscribeNews),
      fullName: data.get(#fullName, or: $value.fullName),
      phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
      imageUrl: data.get(#imageUrl, or: $value.imageUrl));

  @override
  UserAppCopyWith<$R2, UserApp, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _UserAppCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
