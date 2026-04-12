// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filters_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FiltersResponse _$FiltersResponseFromJson(Map<String, dynamic> json) {
  return _FiltersResponse.fromJson(json);
}

/// @nodoc
mixin _$FiltersResponse {
  @JsonKey(fromJson: stringListFlexibleFromJson)
  List<String> get categories => throw _privateConstructorUsedError;
  @JsonKey(fromJson: stringListFlexibleFromJson)
  List<String> get brands => throw _privateConstructorUsedError;

  /// Serializes this FiltersResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FiltersResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FiltersResponseCopyWith<FiltersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FiltersResponseCopyWith<$Res> {
  factory $FiltersResponseCopyWith(
    FiltersResponse value,
    $Res Function(FiltersResponse) then,
  ) = _$FiltersResponseCopyWithImpl<$Res, FiltersResponse>;
  @useResult
  $Res call({
    @JsonKey(fromJson: stringListFlexibleFromJson) List<String> categories,
    @JsonKey(fromJson: stringListFlexibleFromJson) List<String> brands,
  });
}

/// @nodoc
class _$FiltersResponseCopyWithImpl<$Res, $Val extends FiltersResponse>
    implements $FiltersResponseCopyWith<$Res> {
  _$FiltersResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FiltersResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categories = null, Object? brands = null}) {
    return _then(
      _value.copyWith(
            categories: null == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            brands: null == brands
                ? _value.brands
                : brands // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FiltersResponseImplCopyWith<$Res>
    implements $FiltersResponseCopyWith<$Res> {
  factory _$$FiltersResponseImplCopyWith(
    _$FiltersResponseImpl value,
    $Res Function(_$FiltersResponseImpl) then,
  ) = __$$FiltersResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: stringListFlexibleFromJson) List<String> categories,
    @JsonKey(fromJson: stringListFlexibleFromJson) List<String> brands,
  });
}

/// @nodoc
class __$$FiltersResponseImplCopyWithImpl<$Res>
    extends _$FiltersResponseCopyWithImpl<$Res, _$FiltersResponseImpl>
    implements _$$FiltersResponseImplCopyWith<$Res> {
  __$$FiltersResponseImplCopyWithImpl(
    _$FiltersResponseImpl _value,
    $Res Function(_$FiltersResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FiltersResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categories = null, Object? brands = null}) {
    return _then(
      _$FiltersResponseImpl(
        categories: null == categories
            ? _value._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        brands: null == brands
            ? _value._brands
            : brands // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$FiltersResponseImpl implements _FiltersResponse {
  const _$FiltersResponseImpl({
    @JsonKey(fromJson: stringListFlexibleFromJson)
    required final List<String> categories,
    @JsonKey(fromJson: stringListFlexibleFromJson)
    required final List<String> brands,
  }) : _categories = categories,
       _brands = brands;

  factory _$FiltersResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FiltersResponseImplFromJson(json);

  final List<String> _categories;
  @override
  @JsonKey(fromJson: stringListFlexibleFromJson)
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<String> _brands;
  @override
  @JsonKey(fromJson: stringListFlexibleFromJson)
  List<String> get brands {
    if (_brands is EqualUnmodifiableListView) return _brands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brands);
  }

  @override
  String toString() {
    return 'FiltersResponse(categories: $categories, brands: $brands)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FiltersResponseImpl &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            const DeepCollectionEquality().equals(other._brands, _brands));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_categories),
    const DeepCollectionEquality().hash(_brands),
  );

  /// Create a copy of FiltersResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FiltersResponseImplCopyWith<_$FiltersResponseImpl> get copyWith =>
      __$$FiltersResponseImplCopyWithImpl<_$FiltersResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FiltersResponseImplToJson(this);
  }
}

abstract class _FiltersResponse implements FiltersResponse {
  const factory _FiltersResponse({
    @JsonKey(fromJson: stringListFlexibleFromJson)
    required final List<String> categories,
    @JsonKey(fromJson: stringListFlexibleFromJson)
    required final List<String> brands,
  }) = _$FiltersResponseImpl;

  factory _FiltersResponse.fromJson(Map<String, dynamic> json) =
      _$FiltersResponseImpl.fromJson;

  @override
  @JsonKey(fromJson: stringListFlexibleFromJson)
  List<String> get categories;
  @override
  @JsonKey(fromJson: stringListFlexibleFromJson)
  List<String> get brands;

  /// Create a copy of FiltersResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FiltersResponseImplCopyWith<_$FiltersResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
