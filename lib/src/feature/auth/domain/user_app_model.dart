import 'package:dart_mappable/dart_mappable.dart';

import '../../../core/model/base_user_info.dart';

part 'user_app_model.mapper.dart';

@MappableClass()
class UserApp extends BaseUserInfo with UserAppMappable {
  const UserApp({
    required this.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phone,
    required super.subscribeNews,
    @MappableField(key: 'full_name') required this.fullName,
    @MappableField(key: 'phone_number') required this.phoneNumber,
    @MappableField(key: 'image') required this.imageUrl,
  });

  final int id;
  final String fullName;
  final String phoneNumber;
  final String imageUrl;
}
