import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:todo_list_app/src/core/exceptions/future_extensions.dart';
import 'package:todo_list_app/src/core/services/local_db/shared_preferences_facade.dart';
import 'package:todo_list_app/src/core/services/riverpod/provider_observers.dart';
import 'package:todo_list_app/src/feature/app/presentation/todo_list_app.dart';

import '../../../core/utils/app_logger/app_logger.dart';

final log = Logger('Bootstrap init');

final class Bootstrap {
  static Future<ProviderContainer> init() async {
    final binding = WidgetsFlutterBinding.ensureInitialized();

    initLogger();

    // Setup Riverpod observer
    final container = ProviderContainer(
      observers: [ProviderLogger()],
      // overrides: [
      //   apiInterceptorsProvider.overrideWith(
      //     (ref) => IList(ApiConfig.interceptorsCollection(ref)),
      //   ),
      // ],
    );

    await container.read(sharedPrefAsyncProvider.future).suppressError();
    // This Prevent closing native splash screen until we finish warming-up custom splash images.
    // App layout will be built but not displayed.
    binding.deferFirstFrame();

    binding.addPostFrameCallback((_) async {
      // Run any function you want to wait for before showing app layout.
      // final BuildContext context = binding.rootElement!;

      // When the native splash screen is full screen, iOS will not automatically show the notification
      // bar when the app loads. To show it, setEnabledSystemUIMode has to be explicitly set:
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

      // Closes splash screen, and show the app layout.
      binding.allowFirstFrame();
    });

    return container;
  }

  static void run(ProviderContainer container) {
    runApp(
      UncontrolledProviderScope(
        container: container,
        child: const TodoListApp(),
      ),
    );
  }
}

void initLogger() {
  Logger.root.level = Level.ALL;
  hierarchicalLoggingEnabled = true;
  log.onRecord.listen((record) => record.logMessage());
}

void logFlutterErrorBootstrap(FlutterErrorDetails flutterErrorDetails) {
  log.shout(
    'flutterErrorDetails',
    flutterErrorDetails.exception,
    flutterErrorDetails.stack,
  );
}

bool logPlatformDispatcherErrorBootstrap(Object error, StackTrace stackTrace) {
  log.shout('flutterErrorDetails', error, stackTrace);
  return true;
}
