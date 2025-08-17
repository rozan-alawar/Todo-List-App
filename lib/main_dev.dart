import 'package:todo_list_app/src/feature/app/domain/bootstrap.dart';

void main() async {
  final container = await Bootstrap.init();
  Bootstrap.run(container);
}
