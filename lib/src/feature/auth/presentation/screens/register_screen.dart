import 'package:flutter/material.dart';

import '../../../../core/view/component/responsive_widgets/responsive_layouts.dart';
import 'register_screen_compact.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WindowClassLayout(
      compact: (_) => OrientationLayout(
        portrait: (_) => const RegisterScreenCompact(),
      ),
    );
  }
}
