import 'package:dart_mappable/dart_mappable.dart';

part 'pagination_params.mapper.dart';

@MappableClass()
class PaginatedPageParams with PaginatedPageParamsMappable {
  PaginatedPageParams({
    required this.page,
    @MappableField(key: 'per_page') this.limit = 35,
    // @MappableField(key: 'order') this.typeSorting,
    this.search,
  });

  final int page;
  final int limit;
  // final TypeSorting? typeSorting;
  final String? search;
}
