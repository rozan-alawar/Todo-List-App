import 'package:flutter/material.dart';
import 'package:todo_list_app/src/core/view/component/responsive_widgets/responsive_layouts.dart';
import 'package:todo_list_app/src/feature/home/presentation/screens/home_screen_compact.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WindowClassLayout(
      compact: (context) =>
          OrientationLayout(portrait: (context) => HomeScreenCompact()),
    );
  }
}
