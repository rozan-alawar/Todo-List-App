import '../../utils/app_logger/app_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';

const _riverpodEmoji = '🌊🌊🌊 ';

class ProviderLogger extends ProviderObserver {
  ProviderLogger() : _logger = Logger('Riverpod') {
    _logger.level = Level.FINER; //Turn off logging for messages whose level is under this level.
    _logger.onRecord.listen((record) => record.logMessage(_riverpodEmoji));
  }

  final Logger _logger;

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    // This avoid duplicate logs or other logic execution,
    // until https://github.com/rrousselGit/riverpod/issues/3146 is fixed.
    if (value is Exception || value is AsyncError) return;

    _logger.fine(
      '[ ➕ 🌝 DidAddProvider ]: ${provider.providerName}'
      ' => value: $value',
    );
  }

  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    // This avoid duplicate logs or other logic execution,
    // until https://github.com/rrousselGit/riverpod/issues/3146 is fixed.
    if (newValue is AsyncError) return;

    _logger.finer(
      '[ 🔄 DidUpdateProvider] : ${provider.providerName}\n'
      ' => 🌚 oldValue: $previousValue\n'
      ' => 🌝 newValue: $newValue\n',
    );
  }

  @override
  void didDisposeProvider(ProviderBase<dynamic> provider, ProviderContainer container) {
    _logger.fine('🗑️ DidDisposeProvider: ${provider.providerName}');
  }
}

extension _ProviderBaseX on ProviderBase<dynamic> {
  String get providerName => (name ?? runtimeType).toString();
}
