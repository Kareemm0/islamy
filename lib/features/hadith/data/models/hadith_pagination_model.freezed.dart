// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hadith_pagination_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HadithPaginationModel {

 int get totalItems; int get currentPage; int get pageSize; int get totalPages; List<int> get pages;
/// Create a copy of HadithPaginationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HadithPaginationModelCopyWith<HadithPaginationModel> get copyWith => _$HadithPaginationModelCopyWithImpl<HadithPaginationModel>(this as HadithPaginationModel, _$identity);

  /// Serializes this HadithPaginationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HadithPaginationModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HadithPaginationModel&&(identical(other.totalItems, _this.totalItems) || other.totalItems == _this.totalItems)&&(identical(other.currentPage, _this.currentPage) || other.currentPage == _this.currentPage)&&(identical(other.pageSize, _this.pageSize) || other.pageSize == _this.pageSize)&&(identical(other.totalPages, _this.totalPages) || other.totalPages == _this.totalPages)&&const DeepCollectionEquality().equals(other.pages, _this.pages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HadithPaginationModel;
  return Object.hash(runtimeType,_this.totalItems,_this.currentPage,_this.pageSize,_this.totalPages,const DeepCollectionEquality().hash(_this.pages));
}

@override
String toString() {
  final _this = this as HadithPaginationModel;
  return 'HadithPaginationModel(totalItems: ${_this.totalItems}, currentPage: ${_this.currentPage}, pageSize: ${_this.pageSize}, totalPages: ${_this.totalPages}, pages: ${_this.pages})';
}


}

/// @nodoc
abstract mixin class $HadithPaginationModelCopyWith<$Res>  {
  factory $HadithPaginationModelCopyWith(HadithPaginationModel value, $Res Function(HadithPaginationModel) _then) = _$HadithPaginationModelCopyWithImpl;
@useResult
$Res call({
 int totalItems, int currentPage, int pageSize, int totalPages, List<int> pages
});




}
/// @nodoc
class _$HadithPaginationModelCopyWithImpl<$Res>
    implements $HadithPaginationModelCopyWith<$Res> {
  _$HadithPaginationModelCopyWithImpl(this._self, this._then);

  final HadithPaginationModel _self;
  final $Res Function(HadithPaginationModel) _then;

/// Create a copy of HadithPaginationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalItems = null,Object? currentPage = null,Object? pageSize = null,Object? totalPages = null,Object? pages = null,}) {
  return _then(HadithPaginationModel(
totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [HadithPaginationModel].
extension HadithPaginationModelPatterns on HadithPaginationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HadithPaginationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HadithPaginationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HadithPaginationModel value)  $default,){
final _that = this;
switch (_that) {
case _HadithPaginationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HadithPaginationModel value)?  $default,){
final _that = this;
switch (_that) {
case _HadithPaginationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalItems,  int currentPage,  int pageSize,  int totalPages,  List<int> pages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HadithPaginationModel() when $default != null:
return $default(_that.totalItems,_that.currentPage,_that.pageSize,_that.totalPages,_that.pages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalItems,  int currentPage,  int pageSize,  int totalPages,  List<int> pages)  $default,) {final _that = this;
switch (_that) {
case _HadithPaginationModel():
return $default(_that.totalItems,_that.currentPage,_that.pageSize,_that.totalPages,_that.pages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalItems,  int currentPage,  int pageSize,  int totalPages,  List<int> pages)?  $default,) {final _that = this;
switch (_that) {
case _HadithPaginationModel() when $default != null:
return $default(_that.totalItems,_that.currentPage,_that.pageSize,_that.totalPages,_that.pages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HadithPaginationModel extends HadithPaginationModel {
  const _HadithPaginationModel({this.totalItems = 0, this.currentPage = 1, this.pageSize = 20, this.totalPages = 1,  List<int> pages = const <int>[]}): _pages = pages,super._();
  factory _HadithPaginationModel.fromJson(Map<String, dynamic> json) => _$HadithPaginationModelFromJson(json);

@override@JsonKey() final  int totalItems;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int pageSize;
@override@JsonKey() final  int totalPages;
 final  List<int> _pages;
@override@JsonKey() List<int> get pages {
  if (_pages is EqualUnmodifiableListView) return _pages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pages);
}


/// Create a copy of HadithPaginationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HadithPaginationModelCopyWith<_HadithPaginationModel> get copyWith => __$HadithPaginationModelCopyWithImpl<_HadithPaginationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HadithPaginationModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HadithPaginationModel&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&const DeepCollectionEquality().equals(other.pages, _pages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,totalItems,currentPage,pageSize,totalPages,const DeepCollectionEquality().hash(_pages));
}

@override
String toString() {
    return 'HadithPaginationModel(totalItems: $totalItems, currentPage: $currentPage, pageSize: $pageSize, totalPages: $totalPages, pages: $pages)';
}


}

/// @nodoc
abstract mixin class _$HadithPaginationModelCopyWith<$Res> implements $HadithPaginationModelCopyWith<$Res> {
  factory _$HadithPaginationModelCopyWith(_HadithPaginationModel value, $Res Function(_HadithPaginationModel) _then) = __$HadithPaginationModelCopyWithImpl;
@override @useResult
$Res call({
 int totalItems, int currentPage, int pageSize, int totalPages, List<int> pages
});




}
/// @nodoc
class __$HadithPaginationModelCopyWithImpl<$Res>
    implements _$HadithPaginationModelCopyWith<$Res> {
  __$HadithPaginationModelCopyWithImpl(this._self, this._then);

  final _HadithPaginationModel _self;
  final $Res Function(_HadithPaginationModel) _then;

/// Create a copy of HadithPaginationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalItems = null,Object? currentPage = null,Object? pageSize = null,Object? totalPages = null,Object? pages = null,}) {
  return _then(_HadithPaginationModel(
totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self._pages : pages // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
