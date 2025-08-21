import 'package:dart_mappable/dart_mappable.dart';

import '../../../core/model/base_user_info.dart';

part 'register_params.mapper.dart';

@MappableClass()
class RegisterParams extends BaseUserInfo with RegisterParamsMappable {
  const RegisterParams({
    required this.firstName,
    required this.lastName,
    required this.confirmPassword,
    required super.email,
    required this.password,
    super.phone,
  });

  final String password;
  final String confirmPassword;
  final String firstName;
  final String lastName;
}
