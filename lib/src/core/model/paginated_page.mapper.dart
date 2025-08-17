// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'paginated_page.dart';

class PaginatedPageMapper extends ClassMapperBase<PaginatedPage> {
  PaginatedPageMapper._();

  static PaginatedPageMapper? _instance;
  static PaginatedPageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PaginatedPageMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PaginatedPage';
  @override
  Function get typeFactory => <T>(f) => f<PaginatedPage<T>>();

  static List<dynamic> _$items(PaginatedPage v) => v.items;
  static dynamic _arg$items<T>(f) => f<List<T>>();
  static const Field<PaginatedPage, List<dynamic>> _f$items =
      Field('items', _$items, arg: _arg$items);
  static int _$totalItems(PaginatedPage v) => v.totalItems;
  static const Field<PaginatedPage, int> _f$totalItems =
      Field('totalItems', _$totalItems, key: r'meta', hook: _TotalItemsHook());
  static int _$pageSize(PaginatedPage v) => v.pageSize;
  static const Field<PaginatedPage, int> _f$pageSize =
      Field('pageSize', _$pageSize, key: r'meta', hook: _PageSizeHook());

  @override
  final MappableFields<PaginatedPage> fields = const {
    #items: _f$items,
    #totalItems: _f$totalItems,
    #pageSize: _f$pageSize,
  };

  static PaginatedPage<T> _instantiate<T>(DecodingData data) {
    return PaginatedPage(
        items: data.dec(_f$items),
        totalItems: data.dec(_f$totalItems),
        pageSize: data.dec(_f$pageSize));
  }

  @override
  final Function instantiate = _instantiate;

  static PaginatedPage<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PaginatedPage<T>>(map);
  }

  static PaginatedPage<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<PaginatedPage<T>>(json);
  }
}

mixin PaginatedPageMappable<T> {
  String toJson() {
    return PaginatedPageMapper.ensureInitialized()
        .encodeJson<PaginatedPage<T>>(this as PaginatedPage<T>);
  }

  Map<String, dynamic> toMap() {
    return PaginatedPageMapper.ensureInitialized()
        .encodeMap<PaginatedPage<T>>(this as PaginatedPage<T>);
  }

  PaginatedPageCopyWith<PaginatedPage<T>, PaginatedPage<T>, PaginatedPage<T>, T>
      get copyWith =>
          _PaginatedPageCopyWithImpl<PaginatedPage<T>, PaginatedPage<T>, T>(
              this as PaginatedPage<T>, $identity, $identity);
  @override
  String toString() {
    return PaginatedPageMapper.ensureInitialized()
        .stringifyValue(this as PaginatedPage<T>);
  }

  @override
  bool operator ==(Object other) {
    return PaginatedPageMapper.ensureInitialized()
        .equalsValue(this as PaginatedPage<T>, other);
  }

  @override
  int get hashCode {
    return PaginatedPageMapper.ensureInitialized()
        .hashValue(this as PaginatedPage<T>);
  }
}

extension PaginatedPageValueCopy<$R, $Out, T>
    on ObjectCopyWith<$R, PaginatedPage<T>, $Out> {
  PaginatedPageCopyWith<$R, PaginatedPage<T>, $Out, T> get $asPaginatedPage =>
      $base.as((v, t, t2) => _PaginatedPageCopyWithImpl<$R, $Out, T>(v, t, t2));
}

abstract class PaginatedPageCopyWith<$R, $In extends PaginatedPage<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get items;
  $R call({List<T>? items, int? totalItems, int? pageSize});
  PaginatedPageCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PaginatedPageCopyWithImpl<$R, $Out, T>
    extends ClassCopyWithBase<$R, PaginatedPage<T>, $Out>
    implements PaginatedPageCopyWith<$R, PaginatedPage<T>, $Out, T> {
  _PaginatedPageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PaginatedPage> $mapper =
      PaginatedPageMapper.ensureInitialized();
  @override
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get items => ListCopyWith(
      $value.items,
      (v, t) => ObjectCopyWith(v, $identity, t),
      (v) => call(items: v));
  @override
  $R call({List<T>? items, int? totalItems, int? pageSize}) =>
      $apply(FieldCopyWithData({
        if (items != null) #items: items,
        if (totalItems != null) #totalItems: totalItems,
        if (pageSize != null) #pageSize: pageSize
      }));
  @override
  PaginatedPage<T> $make(CopyWithData data) => PaginatedPage(
      items: data.get(#items, or: $value.items),
      totalItems: data.get(#totalItems, or: $value.totalItems),
      pageSize: data.get(#pageSize, or: $value.pageSize));

  @override
  PaginatedPageCopyWith<$R2, PaginatedPage<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PaginatedPageCopyWithImpl<$R2, $Out2, T>($value, $cast, t);
}

class PaginatedItemMapper extends ClassMapperBase<PaginatedItem> {
  PaginatedItemMapper._();

  static PaginatedItemMapper? _instance;
  static PaginatedItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PaginatedItemMapper._());
      PaginatedPageMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PaginatedItem';
  @override
  Function get typeFactory => <T>(f) => f<PaginatedItem<T>>();

  static dynamic _$item(PaginatedItem v) => v.item;
  static dynamic _arg$item<T>(f) => f<T>();
  static const Field<PaginatedItem, dynamic> _f$item =
      Field('item', _$item, arg: _arg$item);
  static PaginatedPage<dynamic> _$page(PaginatedItem v) => v.page;
  static dynamic _arg$page<T>(f) => f<PaginatedPage<T>>();
  static const Field<PaginatedItem, PaginatedPage<dynamic>> _f$page =
      Field('page', _$page, arg: _arg$page);

  @override
  final MappableFields<PaginatedItem> fields = const {
    #item: _f$item,
    #page: _f$page,
  };

  static PaginatedItem<T> _instantiate<T>(DecodingData data) {
    return PaginatedItem(item: data.dec(_f$item), page: data.dec(_f$page));
  }

  @override
  final Function instantiate = _instantiate;

  static PaginatedItem<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PaginatedItem<T>>(map);
  }

  static PaginatedItem<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<PaginatedItem<T>>(json);
  }
}

mixin PaginatedItemMappable<T> {
  String toJson() {
    return PaginatedItemMapper.ensureInitialized()
        .encodeJson<PaginatedItem<T>>(this as PaginatedItem<T>);
  }

  Map<String, dynamic> toMap() {
    return PaginatedItemMapper.ensureInitialized()
        .encodeMap<PaginatedItem<T>>(this as PaginatedItem<T>);
  }

  PaginatedItemCopyWith<PaginatedItem<T>, PaginatedItem<T>, PaginatedItem<T>, T>
      get copyWith =>
          _PaginatedItemCopyWithImpl<PaginatedItem<T>, PaginatedItem<T>, T>(
              this as PaginatedItem<T>, $identity, $identity);
  @override
  String toString() {
    return PaginatedItemMapper.ensureInitialized()
        .stringifyValue(this as PaginatedItem<T>);
  }

  @override
  bool operator ==(Object other) {
    return PaginatedItemMapper.ensureInitialized()
        .equalsValue(this as PaginatedItem<T>, other);
  }

  @override
  int get hashCode {
    return PaginatedItemMapper.ensureInitialized()
        .hashValue(this as PaginatedItem<T>);
  }
}

extension PaginatedItemValueCopy<$R, $Out, T>
    on ObjectCopyWith<$R, PaginatedItem<T>, $Out> {
  PaginatedItemCopyWith<$R, PaginatedItem<T>, $Out, T> get $asPaginatedItem =>
      $base.as((v, t, t2) => _PaginatedItemCopyWithImpl<$R, $Out, T>(v, t, t2));
}

abstract class PaginatedItemCopyWith<$R, $In extends PaginatedItem<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  PaginatedPageCopyWith<$R, PaginatedPage<T>, PaginatedPage<T>, T> get page;
  $R call({T? item, PaginatedPage<T>? page});
  PaginatedItemCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PaginatedItemCopyWithImpl<$R, $Out, T>
    extends ClassCopyWithBase<$R, PaginatedItem<T>, $Out>
    implements PaginatedItemCopyWith<$R, PaginatedItem<T>, $Out, T> {
  _PaginatedItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PaginatedItem> $mapper =
      PaginatedItemMapper.ensureInitialized();
  @override
  PaginatedPageCopyWith<$R, PaginatedPage<T>, PaginatedPage<T>, T> get page =>
      $value.page.copyWith.$chain((v) => call(page: v));
  @override
  $R call({Object? item = $none, PaginatedPage<T>? page}) =>
      $apply(FieldCopyWithData(
          {if (item != $none) #item: item, if (page != null) #page: page}));
  @override
  PaginatedItem<T> $make(CopyWithData data) => PaginatedItem(
      item: data.get(#item, or: $value.item),
      page: data.get(#page, or: $value.page));

  @override
  PaginatedItemCopyWith<$R2, PaginatedItem<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PaginatedItemCopyWithImpl<$R2, $Out2, T>($value, $cast, t);
}
