// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hadith_collection_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HadithCollectionPageModel {

 String get name; String get slug; int get total; HadithPaginationModel get pagination; List<HadithItemModel> get items;
/// Create a copy of HadithCollectionPageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HadithCollectionPageModelCopyWith<HadithCollectionPageModel> get copyWith => _$HadithCollectionPageModelCopyWithImpl<HadithCollectionPageModel>(this as HadithCollectionPageModel, _$identity);

  /// Serializes this HadithCollectionPageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HadithCollectionPageModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HadithCollectionPageModel&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.slug, _this.slug) || other.slug == _this.slug)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.pagination, _this.pagination) || other.pagination == _this.pagination)&&const DeepCollectionEquality().equals(other.items, _this.items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HadithCollectionPageModel;
  return Object.hash(runtimeType,_this.name,_this.slug,_this.total,_this.pagination,const DeepCollectionEquality().hash(_this.items));
}

@override
String toString() {
  final _this = this as HadithCollectionPageModel;
  return 'HadithCollectionPageModel(name: ${_this.name}, slug: ${_this.slug}, total: ${_this.total}, pagination: ${_this.pagination}, items: ${_this.items})';
}


}

/// @nodoc
abstract mixin class $HadithCollectionPageModelCopyWith<$Res>  {
  factory $HadithCollectionPageModelCopyWith(HadithCollectionPageModel value, $Res Function(HadithCollectionPageModel) _then) = _$HadithCollectionPageModelCopyWithImpl;
@useResult
$Res call({
 String name, String slug, int total, HadithPaginationModel pagination, List<HadithItemModel> items
});


$HadithPaginationModelCopyWith<$Res> get pagination;

}
/// @nodoc
class _$HadithCollectionPageModelCopyWithImpl<$Res>
    implements $HadithCollectionPageModelCopyWith<$Res> {
  _$HadithCollectionPageModelCopyWithImpl(this._self, this._then);

  final HadithCollectionPageModel _self;
  final $Res Function(HadithCollectionPageModel) _then;

/// Create a copy of HadithCollectionPageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? slug = null,Object? total = null,Object? pagination = null,Object? items = null,}) {
  return _then(HadithCollectionPageModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as HadithPaginationModel,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<HadithItemModel>,
  ));
}
/// Create a copy of HadithCollectionPageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HadithPaginationModelCopyWith<$Res> get pagination {
  
  return $HadithPaginationModelCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [HadithCollectionPageModel].
extension HadithCollectionPageModelPatterns on HadithCollectionPageModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HadithCollectionPageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HadithCollectionPageModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HadithCollectionPageModel value)  $default,){
final _that = this;
switch (_that) {
case _HadithCollectionPageModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HadithCollectionPageModel value)?  $default,){
final _that = this;
switch (_that) {
case _HadithCollectionPageModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String slug,  int total,  HadithPaginationModel pagination,  List<HadithItemModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HadithCollectionPageModel() when $default != null:
return $default(_that.name,_that.slug,_that.total,_that.pagination,_that.items);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String slug,  int total,  HadithPaginationModel pagination,  List<HadithItemModel> items)  $default,) {final _that = this;
switch (_that) {
case _HadithCollectionPageModel():
return $default(_that.name,_that.slug,_that.total,_that.pagination,_that.items);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String slug,  int total,  HadithPaginationModel pagination,  List<HadithItemModel> items)?  $default,) {final _that = this;
switch (_that) {
case _HadithCollectionPageModel() when $default != null:
return $default(_that.name,_that.slug,_that.total,_that.pagination,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HadithCollectionPageModel extends HadithCollectionPageModel {
  const _HadithCollectionPageModel({this.name = '', this.slug = '', this.total = 0, this.pagination = const HadithPaginationModel(),  List<HadithItemModel> items = const <HadithItemModel>[]}): _items = items,super._();
  factory _HadithCollectionPageModel.fromJson(Map<String, dynamic> json) => _$HadithCollectionPageModelFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  String slug;
@override@JsonKey() final  int total;
@override@JsonKey() final  HadithPaginationModel pagination;
 final  List<HadithItemModel> _items;
@override@JsonKey() List<HadithItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of HadithCollectionPageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HadithCollectionPageModelCopyWith<_HadithCollectionPageModel> get copyWith => __$HadithCollectionPageModelCopyWithImpl<_HadithCollectionPageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HadithCollectionPageModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HadithCollectionPageModel&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.total, total) || other.total == total)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&const DeepCollectionEquality().equals(other.items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,slug,total,pagination,const DeepCollectionEquality().hash(_items));
}

@override
String toString() {
    return 'HadithCollectionPageModel(name: $name, slug: $slug, total: $total, pagination: $pagination, items: $items)';
}


}

/// @nodoc
abstract mixin class _$HadithCollectionPageModelCopyWith<$Res> implements $HadithCollectionPageModelCopyWith<$Res> {
  factory _$HadithCollectionPageModelCopyWith(_HadithCollectionPageModel value, $Res Function(_HadithCollectionPageModel) _then) = __$HadithCollectionPageModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String slug, int total, HadithPaginationModel pagination, List<HadithItemModel> items
});


@override $HadithPaginationModelCopyWith<$Res> get pagination;

}
/// @nodoc
class __$HadithCollectionPageModelCopyWithImpl<$Res>
    implements _$HadithCollectionPageModelCopyWith<$Res> {
  __$HadithCollectionPageModelCopyWithImpl(this._self, this._then);

  final _HadithCollectionPageModel _self;
  final $Res Function(_HadithCollectionPageModel) _then;

/// Create a copy of HadithCollectionPageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? slug = null,Object? total = null,Object? pagination = null,Object? items = null,}) {
  return _then(_HadithCollectionPageModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as HadithPaginationModel,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<HadithItemModel>,
  ));
}

/// Create a copy of HadithCollectionPageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HadithPaginationModelCopyWith<$Res> get pagination {
  
  return $HadithPaginationModelCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}

// dart format on
