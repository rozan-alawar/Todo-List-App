import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../gen/firebase_options_dev.dart' as fir_dev;
import '../../gen/firebase_options_prod.dart' as fir_prod;

part 'flavor.g.dart';

@Riverpod(keepAlive: true)
Flavor flavor(Ref ref) => Flavor.values.byName(appFlavor!);

enum Flavor {
  dev(appTitle: 'Todo List [Dev]'),
  prod(appTitle: 'Todo List');

  const Flavor({required this.appTitle});

  final String appTitle;

  FirebaseOptions get firebaseOptions {
    return switch (this) {
      dev => fir_dev.DefaultFirebaseOptions.currentPlatform,
      prod => fir_prod.DefaultFirebaseOptions.currentPlatform,
    };
  }
}
