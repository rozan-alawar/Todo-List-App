import 'package:flutter/material.dart';
import 'package:todo_list_app/src/core/view/component/responsive_widgets/responsive_layouts.dart';
import 'package:todo_list_app/src/feature/home/presentation/screens/add_task_screen_compact.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WindowClassLayout(
      compact: (context) =>
          OrientationLayout(portrait: (context) => AddTaskScreenCompact()),
    );
  }
}
