// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hadith_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HadithItemModel {

 int get number; String get arab; String get id;
/// Create a copy of HadithItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HadithItemModelCopyWith<HadithItemModel> get copyWith => _$HadithItemModelCopyWithImpl<HadithItemModel>(this as HadithItemModel, _$identity);

  /// Serializes this HadithItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HadithItemModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HadithItemModel&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.arab, _this.arab) || other.arab == _this.arab)&&(identical(other.id, _this.id) || other.id == _this.id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HadithItemModel;
  return Object.hash(runtimeType,_this.number,_this.arab,_this.id);
}

@override
String toString() {
  final _this = this as HadithItemModel;
  return 'HadithItemModel(number: ${_this.number}, arab: ${_this.arab}, id: ${_this.id})';
}


}

/// @nodoc
abstract mixin class $HadithItemModelCopyWith<$Res>  {
  factory $HadithItemModelCopyWith(HadithItemModel value, $Res Function(HadithItemModel) _then) = _$HadithItemModelCopyWithImpl;
@useResult
$Res call({
 int number, String arab, String id
});




}
/// @nodoc
class _$HadithItemModelCopyWithImpl<$Res>
    implements $HadithItemModelCopyWith<$Res> {
  _$HadithItemModelCopyWithImpl(this._self, this._then);

  final HadithItemModel _self;
  final $Res Function(HadithItemModel) _then;

/// Create a copy of HadithItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? arab = null,Object? id = null,}) {
  return _then(HadithItemModel(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,arab: null == arab ? _self.arab : arab // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HadithItemModel].
extension HadithItemModelPatterns on HadithItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HadithItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HadithItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HadithItemModel value)  $default,){
final _that = this;
switch (_that) {
case _HadithItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HadithItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _HadithItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int number,  String arab,  String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HadithItemModel() when $default != null:
return $default(_that.number,_that.arab,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int number,  String arab,  String id)  $default,) {final _that = this;
switch (_that) {
case _HadithItemModel():
return $default(_that.number,_that.arab,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int number,  String arab,  String id)?  $default,) {final _that = this;
switch (_that) {
case _HadithItemModel() when $default != null:
return $default(_that.number,_that.arab,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HadithItemModel extends HadithItemModel {
  const _HadithItemModel({required this.number, this.arab = '', this.id = ''}): super._();
  factory _HadithItemModel.fromJson(Map<String, dynamic> json) => _$HadithItemModelFromJson(json);

@override final  int number;
@override@JsonKey() final  String arab;
@override@JsonKey() final  String id;

/// Create a copy of HadithItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HadithItemModelCopyWith<_HadithItemModel> get copyWith => __$HadithItemModelCopyWithImpl<_HadithItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HadithItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HadithItemModel&&(identical(other.number, number) || other.number == number)&&(identical(other.arab, arab) || other.arab == arab)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,number,arab,id);
}

@override
String toString() {
    return 'HadithItemModel(number: $number, arab: $arab, id: $id)';
}


}

/// @nodoc
abstract mixin class _$HadithItemModelCopyWith<$Res> implements $HadithItemModelCopyWith<$Res> {
  factory _$HadithItemModelCopyWith(_HadithItemModel value, $Res Function(_HadithItemModel) _then) = __$HadithItemModelCopyWithImpl;
@override @useResult
$Res call({
 int number, String arab, String id
});




}
/// @nodoc
class __$HadithItemModelCopyWithImpl<$Res>
    implements _$HadithItemModelCopyWith<$Res> {
  __$HadithItemModelCopyWithImpl(this._self, this._then);

  final _HadithItemModel _self;
  final $Res Function(_HadithItemModel) _then;

/// Create a copy of HadithItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? arab = null,Object? id = null,}) {
  return _then(_HadithItemModel(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,arab: null == arab ? _self.arab : arab // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
