// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quran_surah_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuranSurahModel {

 int get number; String get name; String get englishName; String get englishNameTranslation; int get numberOfAyahs; String get revelationType;
/// Create a copy of QuranSurahModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuranSurahModelCopyWith<QuranSurahModel> get copyWith => _$QuranSurahModelCopyWithImpl<QuranSurahModel>(this as QuranSurahModel, _$identity);

  /// Serializes this QuranSurahModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as QuranSurahModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuranSurahModel&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.englishName, _this.englishName) || other.englishName == _this.englishName)&&(identical(other.englishNameTranslation, _this.englishNameTranslation) || other.englishNameTranslation == _this.englishNameTranslation)&&(identical(other.numberOfAyahs, _this.numberOfAyahs) || other.numberOfAyahs == _this.numberOfAyahs)&&(identical(other.revelationType, _this.revelationType) || other.revelationType == _this.revelationType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as QuranSurahModel;
  return Object.hash(runtimeType,_this.number,_this.name,_this.englishName,_this.englishNameTranslation,_this.numberOfAyahs,_this.revelationType);
}

@override
String toString() {
  final _this = this as QuranSurahModel;
  return 'QuranSurahModel(number: ${_this.number}, name: ${_this.name}, englishName: ${_this.englishName}, englishNameTranslation: ${_this.englishNameTranslation}, numberOfAyahs: ${_this.numberOfAyahs}, revelationType: ${_this.revelationType})';
}


}

/// @nodoc
abstract mixin class $QuranSurahModelCopyWith<$Res>  {
  factory $QuranSurahModelCopyWith(QuranSurahModel value, $Res Function(QuranSurahModel) _then) = _$QuranSurahModelCopyWithImpl;
@useResult
$Res call({
 int number, String name, String englishName, String englishNameTranslation, int numberOfAyahs, String revelationType
});




}
/// @nodoc
class _$QuranSurahModelCopyWithImpl<$Res>
    implements $QuranSurahModelCopyWith<$Res> {
  _$QuranSurahModelCopyWithImpl(this._self, this._then);

  final QuranSurahModel _self;
  final $Res Function(QuranSurahModel) _then;

/// Create a copy of QuranSurahModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? name = null,Object? englishName = null,Object? englishNameTranslation = null,Object? numberOfAyahs = null,Object? revelationType = null,}) {
  return _then(QuranSurahModel(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,englishName: null == englishName ? _self.englishName : englishName // ignore: cast_nullable_to_non_nullable
as String,englishNameTranslation: null == englishNameTranslation ? _self.englishNameTranslation : englishNameTranslation // ignore: cast_nullable_to_non_nullable
as String,numberOfAyahs: null == numberOfAyahs ? _self.numberOfAyahs : numberOfAyahs // ignore: cast_nullable_to_non_nullable
as int,revelationType: null == revelationType ? _self.revelationType : revelationType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [QuranSurahModel].
extension QuranSurahModelPatterns on QuranSurahModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuranSurahModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuranSurahModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuranSurahModel value)  $default,){
final _that = this;
switch (_that) {
case _QuranSurahModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuranSurahModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuranSurahModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int number,  String name,  String englishName,  String englishNameTranslation,  int numberOfAyahs,  String revelationType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuranSurahModel() when $default != null:
return $default(_that.number,_that.name,_that.englishName,_that.englishNameTranslation,_that.numberOfAyahs,_that.revelationType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int number,  String name,  String englishName,  String englishNameTranslation,  int numberOfAyahs,  String revelationType)  $default,) {final _that = this;
switch (_that) {
case _QuranSurahModel():
return $default(_that.number,_that.name,_that.englishName,_that.englishNameTranslation,_that.numberOfAyahs,_that.revelationType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int number,  String name,  String englishName,  String englishNameTranslation,  int numberOfAyahs,  String revelationType)?  $default,) {final _that = this;
switch (_that) {
case _QuranSurahModel() when $default != null:
return $default(_that.number,_that.name,_that.englishName,_that.englishNameTranslation,_that.numberOfAyahs,_that.revelationType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuranSurahModel extends QuranSurahModel {
  const _QuranSurahModel({required this.number, required this.name, required this.englishName, required this.englishNameTranslation, this.numberOfAyahs = 0, this.revelationType = ''}): super._();
  factory _QuranSurahModel.fromJson(Map<String, dynamic> json) => _$QuranSurahModelFromJson(json);

@override final  int number;
@override final  String name;
@override final  String englishName;
@override final  String englishNameTranslation;
@override@JsonKey() final  int numberOfAyahs;
@override@JsonKey() final  String revelationType;

/// Create a copy of QuranSurahModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuranSurahModelCopyWith<_QuranSurahModel> get copyWith => __$QuranSurahModelCopyWithImpl<_QuranSurahModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuranSurahModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuranSurahModel&&(identical(other.number, number) || other.number == number)&&(identical(other.name, name) || other.name == name)&&(identical(other.englishName, englishName) || other.englishName == englishName)&&(identical(other.englishNameTranslation, englishNameTranslation) || other.englishNameTranslation == englishNameTranslation)&&(identical(other.numberOfAyahs, numberOfAyahs) || other.numberOfAyahs == numberOfAyahs)&&(identical(other.revelationType, revelationType) || other.revelationType == revelationType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,number,name,englishName,englishNameTranslation,numberOfAyahs,revelationType);
}

@override
String toString() {
    return 'QuranSurahModel(number: $number, name: $name, englishName: $englishName, englishNameTranslation: $englishNameTranslation, numberOfAyahs: $numberOfAyahs, revelationType: $revelationType)';
}


}

/// @nodoc
abstract mixin class _$QuranSurahModelCopyWith<$Res> implements $QuranSurahModelCopyWith<$Res> {
  factory _$QuranSurahModelCopyWith(_QuranSurahModel value, $Res Function(_QuranSurahModel) _then) = __$QuranSurahModelCopyWithImpl;
@override @useResult
$Res call({
 int number, String name, String englishName, String englishNameTranslation, int numberOfAyahs, String revelationType
});




}
/// @nodoc
class __$QuranSurahModelCopyWithImpl<$Res>
    implements _$QuranSurahModelCopyWith<$Res> {
  __$QuranSurahModelCopyWithImpl(this._self, this._then);

  final _QuranSurahModel _self;
  final $Res Function(_QuranSurahModel) _then;

/// Create a copy of QuranSurahModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? name = null,Object? englishName = null,Object? englishNameTranslation = null,Object? numberOfAyahs = null,Object? revelationType = null,}) {
  return _then(_QuranSurahModel(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,englishName: null == englishName ? _self.englishName : englishName // ignore: cast_nullable_to_non_nullable
as String,englishNameTranslation: null == englishNameTranslation ? _self.englishNameTranslation : englishNameTranslation // ignore: cast_nullable_to_non_nullable
as String,numberOfAyahs: null == numberOfAyahs ? _self.numberOfAyahs : numberOfAyahs // ignore: cast_nullable_to_non_nullable
as int,revelationType: null == revelationType ? _self.revelationType : revelationType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
