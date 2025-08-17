import 'package:flutter/material.dart';
import 'package:todo_list_app/src/core/view/component/responsive_widgets/responsive_layouts.dart';
import 'package:todo_list_app/src/feature/intro/presentation/screens/splash_screen_compact.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WindowClassLayout(
      compact: (context) =>
          OrientationLayout(portrait: (context) => SplashScreenCompact()),
    );
  }
}
