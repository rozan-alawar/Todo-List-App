import 'package:flutter/material.dart';
import 'package:todo_list_app/src/core/view/component/responsive_widgets/responsive_layouts.dart';
import 'package:todo_list_app/src/feature/profile/presentation/pages/profile_screen_compact.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WindowClassLayout(
      compact: (context) =>
          OrientationLayout(portrait: (context) => ProfileScreenCompact()),
    );
  }
}
