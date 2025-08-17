import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/paginated_page.dart';
import 'util.dart';
import 'widget_ref_extension.dart';

extension PaginationExt on WidgetRef {
  Widget? buildPaginatedItem<T>({
    required int index,
    required ProviderListenable<AsyncValue<PaginatedItem<T>>> itemProvider,
    required Widget Function(T item) itemWidget,
    required ErrorCallback errorWidget,
    required Widget Function() loadingWidget,
    Widget? separatorWidget,
    Axis scrollDirection = Axis.vertical,
    int totalLimit = 1000,
    ({
      ProviderListenable<AsyncValue<PaginatedItem<T>>> prevItemProvider,
      bool singleLoading,
      bool singleError,
      Widget? singleLoadingWidget,
      ErrorCallback? singleErrorWidget,
    })?
    pageBehavior,
  }) {
    // Limit items to prevent unnecessary calls
    if (index >= totalLimit) return null;

    // Watch the item provider and previous item provider if defined
    final itemAsync = watch(itemProvider);
    final loadingDisabled = shouldDisableLoading(index, pageBehavior);
    final errorDisabled = shouldDisableError(index, pageBehavior);

    // Debug log to track each page request in sequence
    // log('pagination: Requesting page at index: $index');

    Widget separatedItem(Widget itemWidget) {
      return buildSeparatedItem(
        itemWidget,
        separatorWidget,
        scrollDirection,
        index,
      );
    }

    return itemAsync.when(
      skipLoadingOnReload: !itemAsync.hasError,
      skipError: itemAsync.error is! PaginationEndException,
      data: (paginatedItem) {
        // Log successful data retrieval for debugging
        // log('pagination: Data loaded for page $index');
        return separatedItem(itemWidget(paginatedItem.item));
      },
      loading: () {
        if (loadingDisabled) return null;
        // log('pagination: Loading page at index: $index');
        return buildLoadingWidget(pageBehavior, loadingWidget, separatedItem);
      },
      error: (e, st) {
        if (e is PaginationEndException || errorDisabled) return null;
        // log('pagination: Error on page at index: $index, error: $e');
        return buildErrorWidget(
          pageBehavior,
          e,
          st,
          errorWidget,
          separatedItem,
        );
      },
    );
  }

  bool shouldDisableLoading<T>(
    int index,
    ({
      ProviderListenable<AsyncValue<PaginatedItem<T>>> prevItemProvider,
      bool singleLoading,
      bool singleError,
      Widget? singleLoadingWidget,
      ErrorCallback? singleErrorWidget,
    })?
    pageBehavior,
  ) {
    if (pageBehavior == null || index == 0) return false;

    final noValueOnPrevItem = watch(
      pageBehavior.prevItemProvider.select(
        (asyncValue) => !asyncValue.hasValue,
      ),
    );
    return noValueOnPrevItem && pageBehavior.singleLoading;
  }

  bool shouldDisableError<T>(
    int index,
    ({
      ProviderListenable<AsyncValue<PaginatedItem<T>>> prevItemProvider,
      bool singleLoading,
      bool singleError,
      Widget? singleLoadingWidget,
      ErrorCallback? singleErrorWidget,
    })?
    pageBehavior,
  ) {
    if (pageBehavior == null || index == 0) return false;

    final noValueOnPrevItem = watch(
      pageBehavior.prevItemProvider.select(
        (asyncValue) => !asyncValue.hasValue,
      ),
    );
    return noValueOnPrevItem && pageBehavior.singleError;
  }

  Widget buildSeparatedItem(
    Widget itemWidget,
    Widget? separatorWidget,
    Axis scrollDirection,
    int index,
  ) {
    if (separatorWidget == null) return itemWidget;

    if (scrollDirection == Axis.vertical) {
      return Column(children: [if (index != 0) separatorWidget, itemWidget]);
    } else {
      return Row(children: [if (index != 0) separatorWidget, itemWidget]);
    }
  }

  Widget? buildLoadingWidget<T>(
    ({
      ProviderListenable<AsyncValue<PaginatedItem<T>>> prevItemProvider,
      bool singleLoading,
      bool singleError,
      Widget? singleLoadingWidget,
      ErrorCallback? singleErrorWidget,
    })?
    pageBehavior,
    Widget Function() loadingWidget,
    Widget Function(Widget) separatedItem,
  ) {
    return switch (pageBehavior) {
      (
        prevItemProvider: _,
        singleError: _,
        singleErrorWidget: _,
        singleLoading: true,
        singleLoadingWidget: final Widget singleLoadingWidget,
      ) =>
        singleLoadingWidget,
      _ => separatedItem(loadingWidget()),
    };
  }

  Widget? buildErrorWidget<T>(
    ({
      ProviderListenable<AsyncValue<PaginatedItem<T>>> prevItemProvider,
      bool singleLoading,
      bool singleError,
      Widget? singleLoadingWidget,
      ErrorCallback? singleErrorWidget,
    })?
    pageBehavior,
    Object e,
    StackTrace st,
    ErrorCallback errorWidget,
    Widget Function(Widget) separatedItem,
  ) {
    return switch (pageBehavior) {
      (
        prevItemProvider: _,
        singleLoading: _,
        singleLoadingWidget: _,
        singleError: true,
        singleErrorWidget: final ErrorCallback singleErrorWidget,
      ) =>
        singleErrorWidget.call(e, st),
      _ => separatedItem(errorWidget(e, st)),
    };
  }
}
