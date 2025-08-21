import 'package:dart_mappable/dart_mappable.dart';

import '../../../core/model/base_user_info.dart';

part 'user_app_model.mapper.dart';

@MappableClass()
class UserApp extends BaseUserInfo with UserAppMappable {
  const UserApp({
    required this.id,
    required super.email,
    required super.phone,
    @MappableField(key: 'full_name') required this.fullName,
    @MappableField(key: 'image') required this.imageUrl,
  });

  final String id;
  final String fullName;
  final String imageUrl;
}
