// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredTasksHash() => r'bb5abfc9d399dc791e23bd2f442bf71000460649';

/// See also [filteredTasks].
@ProviderFor(filteredTasks)
final filteredTasksProvider = AutoDisposeProvider<List<Task>>.internal(
  filteredTasks,
  name: r'filteredTasksProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredTasksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FilteredTasksRef = AutoDisposeProviderRef<List<Task>>;
String _$homeHash() => r'e203b9325cc5512d5bf595390a8c2ddabe9c7190';

/// See also [Home].
@ProviderFor(Home)
final homeProvider =
    AutoDisposeAsyncNotifierProvider<Home, List<Task>>.internal(
      Home.new,
      name: r'homeProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$homeHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Home = AutoDisposeAsyncNotifier<List<Task>>;
String _$selectedDateHash() => r'83de326e83c2069423df12b38d6b601c2370c676';

/// See also [SelectedDate].
@ProviderFor(SelectedDate)
final selectedDateProvider =
    AutoDisposeNotifierProvider<SelectedDate, DateTime>.internal(
      SelectedDate.new,
      name: r'selectedDateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$selectedDateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedDate = AutoDisposeNotifier<DateTime>;
String _$taskFilterStateHash() => r'471800d8d141aec1ce03620a7204137fe5a18d87';

/// See also [TaskFilterState].
@ProviderFor(TaskFilterState)
final taskFilterStateProvider =
    AutoDisposeNotifierProvider<TaskFilterState, TaskFilter>.internal(
      TaskFilterState.new,
      name: r'taskFilterStateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$taskFilterStateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TaskFilterState = AutoDisposeNotifier<TaskFilter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
