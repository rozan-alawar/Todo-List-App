import 'dart:ui';

import 'package:dart_mappable/dart_mappable.dart';

part 'paginated_page.mapper.dart';

@MappableClass()
class PaginatedPage<T> with PaginatedPageMappable<T> {
  const PaginatedPage({
    required this.items,
    @MappableField(key: 'meta', hook: _TotalItemsHook())
    required this.totalItems,
    @MappableField(key: 'meta', hook: _PageSizeHook()) required this.pageSize,
  });

  factory PaginatedPage.empty() =>
      const PaginatedPage(items: [], totalItems: 0, pageSize: 0);

  final List<T> items;
  final int totalItems;
  final int pageSize;

  static const listWarmupPageSize = 6;
  static const gridWarmupPageSize = 21;

  /// Pass ensureInitialized() method of the generic type as it must be called at least once
  /// to support the given type.
  /// Check: https://pub.dev/documentation/dart_mappable/latest/topics/Generics-topic.html
  static PaginatedPage<T> fromJsonGeneric<T>(
    VoidCallback ensureInitialized,
    Map<String, dynamic> json,
  ) {
    ensureInitialized();
    return PaginatedPageMapper.fromJson<T>(json.toString());
  }
}

@MappableClass()
class PaginatedItem<T> with PaginatedItemMappable<T> {
  PaginatedItem({required this.item, required this.page});

  final T item;
  final PaginatedPage<T> page;

  static int calculateItemIndexInPage(int index, int pageSize) =>
      index % pageSize;
  static int calculatePageIndex(int index, int pageSize) =>
      index ~/ pageSize + 1;
}

class _TotalItemsHook extends MappingHook {
  const _TotalItemsHook();

  @override
  Object? beforeDecode(Object? value) {
    if (value is Map<dynamic, dynamic>) {
      return value['total'];
    }
    return value;
  }
}

class _PageSizeHook extends MappingHook {
  const _PageSizeHook();

  @override
  Object? beforeDecode(Object? value) {
    if (value is Map<dynamic, dynamic>) {
      return value['count'];
    }
    return value;
  }
}
