import 'package:dart_mappable/dart_mappable.dart';

part 'base_user_info.mapper.dart';

@MappableClass()
class BaseUserInfo with BaseUserInfoMappable {
  const BaseUserInfo({
    @MappableField(key: 'first_name') required this.firstName,
    @MappableField(key: 'last_name') required this.lastName,
    @MappableField(key: 'subscribe_news') required this.subscribeNews,
    required this.email,

    this.phone,
  });
  final String firstName;
  final String lastName;
  final String email;
  final String? phone;
  final bool subscribeNews;
}
