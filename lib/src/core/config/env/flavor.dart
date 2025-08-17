import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flavor.g.dart';

@Riverpod(keepAlive: true)
Flavor flavor(Ref ref) => Flavor.values.byName(appFlavor!);

enum Flavor {
  dev(appTitle: 'Todo List [Dev]'),
  prod(appTitle: 'Todo List');

  const Flavor({required this.appTitle});

  final String appTitle;
}
