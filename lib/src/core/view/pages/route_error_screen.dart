import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RouteErrorScreen extends HookConsumerWidget {
  const RouteErrorScreen({
    required this.error,
    required this.onWillPopCallback,
    required this.goHomeCallback,
    super.key,
  });

  final Exception? error;
  final void Function(BuildContext) onWillPopCallback;
  final void Function(BuildContext) goHomeCallback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) => onWillPopCallback(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Sorry, Can't find the page you are looking for"),
              const SizedBox(height: 20),
              Text(error.toString()),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => goHomeCallback(context),
                child: const Text('Go Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
