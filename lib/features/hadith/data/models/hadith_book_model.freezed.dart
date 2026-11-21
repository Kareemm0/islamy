// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hadith_book_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HadithBookModel {

 String get name; String get slug; int get total;
/// Create a copy of HadithBookModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HadithBookModelCopyWith<HadithBookModel> get copyWith => _$HadithBookModelCopyWithImpl<HadithBookModel>(this as HadithBookModel, _$identity);

  /// Serializes this HadithBookModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HadithBookModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HadithBookModel&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.slug, _this.slug) || other.slug == _this.slug)&&(identical(other.total, _this.total) || other.total == _this.total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HadithBookModel;
  return Object.hash(runtimeType,_this.name,_this.slug,_this.total);
}

@override
String toString() {
  final _this = this as HadithBookModel;
  return 'HadithBookModel(name: ${_this.name}, slug: ${_this.slug}, total: ${_this.total})';
}


}

/// @nodoc
abstract mixin class $HadithBookModelCopyWith<$Res>  {
  factory $HadithBookModelCopyWith(HadithBookModel value, $Res Function(HadithBookModel) _then) = _$HadithBookModelCopyWithImpl;
@useResult
$Res call({
 String name, String slug, int total
});




}
/// @nodoc
class _$HadithBookModelCopyWithImpl<$Res>
    implements $HadithBookModelCopyWith<$Res> {
  _$HadithBookModelCopyWithImpl(this._self, this._then);

  final HadithBookModel _self;
  final $Res Function(HadithBookModel) _then;

/// Create a copy of HadithBookModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? slug = null,Object? total = null,}) {
  return _then(HadithBookModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HadithBookModel].
extension HadithBookModelPatterns on HadithBookModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HadithBookModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HadithBookModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HadithBookModel value)  $default,){
final _that = this;
switch (_that) {
case _HadithBookModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HadithBookModel value)?  $default,){
final _that = this;
switch (_that) {
case _HadithBookModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String slug,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HadithBookModel() when $default != null:
return $default(_that.name,_that.slug,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String slug,  int total)  $default,) {final _that = this;
switch (_that) {
case _HadithBookModel():
return $default(_that.name,_that.slug,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String slug,  int total)?  $default,) {final _that = this;
switch (_that) {
case _HadithBookModel() when $default != null:
return $default(_that.name,_that.slug,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HadithBookModel extends HadithBookModel {
  const _HadithBookModel({required this.name, required this.slug, this.total = 0}): super._();
  factory _HadithBookModel.fromJson(Map<String, dynamic> json) => _$HadithBookModelFromJson(json);

@override final  String name;
@override final  String slug;
@override@JsonKey() final  int total;

/// Create a copy of HadithBookModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HadithBookModelCopyWith<_HadithBookModel> get copyWith => __$HadithBookModelCopyWithImpl<_HadithBookModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HadithBookModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HadithBookModel&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,slug,total);
}

@override
String toString() {
    return 'HadithBookModel(name: $name, slug: $slug, total: $total)';
}


}

/// @nodoc
abstract mixin class _$HadithBookModelCopyWith<$Res> implements $HadithBookModelCopyWith<$Res> {
  factory _$HadithBookModelCopyWith(_HadithBookModel value, $Res Function(_HadithBookModel) _then) = __$HadithBookModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String slug, int total
});




}
/// @nodoc
class __$HadithBookModelCopyWithImpl<$Res>
    implements _$HadithBookModelCopyWith<$Res> {
  __$HadithBookModelCopyWithImpl(this._self, this._then);

  final _HadithBookModel _self;
  final $Res Function(_HadithBookModel) _then;

/// Create a copy of HadithBookModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? slug = null,Object? total = null,}) {
  return _then(_HadithBookModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
