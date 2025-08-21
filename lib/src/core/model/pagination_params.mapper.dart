// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pagination_params.dart';

class PaginatedPageParamsMapper extends ClassMapperBase<PaginatedPageParams> {
  PaginatedPageParamsMapper._();

  static PaginatedPageParamsMapper? _instance;
  static PaginatedPageParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PaginatedPageParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PaginatedPageParams';

  static int _$page(PaginatedPageParams v) => v.page;
  static const Field<PaginatedPageParams, int> _f$page = Field('page', _$page);
  static int _$limit(PaginatedPageParams v) => v.limit;
  static const Field<PaginatedPageParams, int> _f$limit =
      Field('limit', _$limit, key: r'per_page', opt: true, def: 35);
  static String? _$search(PaginatedPageParams v) => v.search;
  static const Field<PaginatedPageParams, String> _f$search =
      Field('search', _$search, opt: true);

  @override
  final MappableFields<PaginatedPageParams> fields = const {
    #page: _f$page,
    #limit: _f$limit,
    #search: _f$search,
  };

  static PaginatedPageParams _instantiate(DecodingData data) {
    return PaginatedPageParams(
        page: data.dec(_f$page),
        limit: data.dec(_f$limit),
        search: data.dec(_f$search));
  }

  @override
  final Function instantiate = _instantiate;

  static PaginatedPageParams fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PaginatedPageParams>(map);
  }

  static PaginatedPageParams deserialize(String json) {
    return ensureInitialized().decodeJson<PaginatedPageParams>(json);
  }
}

mixin PaginatedPageParamsMappable {
  String serialize() {
    return PaginatedPageParamsMapper.ensureInitialized()
        .encodeJson<PaginatedPageParams>(this as PaginatedPageParams);
  }

  Map<String, dynamic> toJson() {
    return PaginatedPageParamsMapper.ensureInitialized()
        .encodeMap<PaginatedPageParams>(this as PaginatedPageParams);
  }

  PaginatedPageParamsCopyWith<PaginatedPageParams, PaginatedPageParams,
      PaginatedPageParams> get copyWith => _PaginatedPageParamsCopyWithImpl<
          PaginatedPageParams, PaginatedPageParams>(
      this as PaginatedPageParams, $identity, $identity);
  @override
  String toString() {
    return PaginatedPageParamsMapper.ensureInitialized()
        .stringifyValue(this as PaginatedPageParams);
  }

  @override
  bool operator ==(Object other) {
    return PaginatedPageParamsMapper.ensureInitialized()
        .equalsValue(this as PaginatedPageParams, other);
  }

  @override
  int get hashCode {
    return PaginatedPageParamsMapper.ensureInitialized()
        .hashValue(this as PaginatedPageParams);
  }
}

extension PaginatedPageParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PaginatedPageParams, $Out> {
  PaginatedPageParamsCopyWith<$R, PaginatedPageParams, $Out>
      get $asPaginatedPageParams => $base.as(
          (v, t, t2) => _PaginatedPageParamsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PaginatedPageParamsCopyWith<$R, $In extends PaginatedPageParams,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? page, int? limit, String? search});
  PaginatedPageParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PaginatedPageParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PaginatedPageParams, $Out>
    implements PaginatedPageParamsCopyWith<$R, PaginatedPageParams, $Out> {
  _PaginatedPageParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PaginatedPageParams> $mapper =
      PaginatedPageParamsMapper.ensureInitialized();
  @override
  $R call({int? page, int? limit, Object? search = $none}) =>
      $apply(FieldCopyWithData({
        if (page != null) #page: page,
        if (limit != null) #limit: limit,
        if (search != $none) #search: search
      }));
  @override
  PaginatedPageParams $make(CopyWithData data) => PaginatedPageParams(
      page: data.get(#page, or: $value.page),
      limit: data.get(#limit, or: $value.limit),
      search: data.get(#search, or: $value.search));

  @override
  PaginatedPageParamsCopyWith<$R2, PaginatedPageParams, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _PaginatedPageParamsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
