import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_list_app/src/feature/auth/data/data_source/auth_remote_data_source.dart';
import 'package:todo_list_app/src/feature/auth/domain/user_app_model.dart';

part 'profile_provider.g.dart';

@riverpod
class ProfileManager extends _$ProfileManager {
  @override
  FutureOr<UserApp?> build() {
    return ref.read(authRemoteDataSourceProvider).getCurrentUser();
  }
}
