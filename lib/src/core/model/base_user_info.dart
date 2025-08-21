import 'package:dart_mappable/dart_mappable.dart';

part 'base_user_info.mapper.dart';

@MappableClass()
class BaseUserInfo with BaseUserInfoMappable {
  const BaseUserInfo({required this.email, this.phone});
  final String email;
  final String? phone;
}
