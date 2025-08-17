import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/paginated_page.dart';

class PaginationEndException implements Exception {}

class EmptyPageException implements Exception {}

class AbortedException implements Exception {}

Future<PaginatedItem<T>> fetchPaginatedItem<T>({
  required int index,
  required Future<PaginatedPage<T>> Function(int pageIndex) itemPageCallback,
  required Future<PaginatedItem<T>> Function() prevItemCallback,
}) async {
  // First item, no previous item yet.
  if (index == 0) {
    final firstPage = await itemPageCallback(1);
    if (firstPage.totalItems == 0) throw EmptyPageException();
    return PaginatedItem(item: firstPage.items.first, page: firstPage);
  }

  final prevItem = await prevItemCallback();
  final prevItemPage = prevItem.page;

  // This will be used by the builder to end the pagination.
  if (prevItemPage.totalItems <= index) throw PaginationEndException();

  final pageSize = prevItemPage.pageSize;
  final itemIndexInPage = PaginatedItem.calculateItemIndexInPage(index, pageSize);
  final itemPageIndex = PaginatedItem.calculatePageIndex(index, pageSize);
  final itemPage = await itemPageCallback(itemPageIndex);
  return PaginatedItem(item: itemPage.items[itemIndexInPage], page: itemPage);
}

int? calculateItemPageIndex<T>({
  required int itemIndex,
  required AsyncValue<PaginatedPage<T>> firstPageAsync,
}) {
  return firstPageAsync.maybeWhen(
    // Use first page data to get pageSize to invalidate item's exact page.
    data: (paginatedPage) {
      final pageSize = paginatedPage.pageSize;
      if (pageSize == 0) return null;

      return PaginatedItem.calculatePageIndex(itemIndex, pageSize);
    },
    orElse: () => null,
  );
}
