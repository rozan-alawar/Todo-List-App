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

  Future<void> updateProfile({
    String? fullName,
    String? email,
    String? phoneNumber,
    String? imageUrl,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      // TODO: Implement actual profile update logic
      // This is a placeholder - you'll need to add actual update functionality
      final currentUser = state.valueOrNull;
      if (currentUser == null) {
        throw Exception('No user logged in');
      }

      final updatedUser = UserApp(
        id: currentUser.id,
        email: email ?? currentUser.email,
        phone: phoneNumber ?? currentUser.phone,
        fullName: fullName ?? currentUser.fullName,
        imageUrl: imageUrl ?? currentUser.imageUrl,
      );

      // In a real implementation, you would call a backend service to update the user
      return updatedUser;
    });
  }

  Future<void> uploadProfileImage(String imagePath) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      // TODO: Implement image upload logic
      // This would typically involve:
      // 1. Uploading the image to Firebase Storage or similar
      // 2. Getting the download URL
      // 3. Updating the user's profile with the new image URL
      final currentUser = state.valueOrNull;
      if (currentUser == null) {
        throw Exception('No user logged in');
      }

      // Placeholder for image upload logic
      // In a real app, you'd use Firebase Storage or a similar service
      final newImageUrl = 'https://example.com/new_profile_image.jpg';

      final updatedUser = UserApp(
        id: currentUser.id,
        email: currentUser.email,
        phone: currentUser.phone,
        fullName: currentUser.fullName,
        imageUrl: newImageUrl,
      );

      return updatedUser;
    });
  }
}
