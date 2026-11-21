// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quran_surah_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuranSurahDetailsModel {

 int get number; String get name; String get englishName; String get englishNameTranslation; int get numberOfAyahs; String get revelationType; List<QuranAyahModel> get ayahs;
/// Create a copy of QuranSurahDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuranSurahDetailsModelCopyWith<QuranSurahDetailsModel> get copyWith => _$QuranSurahDetailsModelCopyWithImpl<QuranSurahDetailsModel>(this as QuranSurahDetailsModel, _$identity);

  /// Serializes this QuranSurahDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as QuranSurahDetailsModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuranSurahDetailsModel&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.englishName, _this.englishName) || other.englishName == _this.englishName)&&(identical(other.englishNameTranslation, _this.englishNameTranslation) || other.englishNameTranslation == _this.englishNameTranslation)&&(identical(other.numberOfAyahs, _this.numberOfAyahs) || other.numberOfAyahs == _this.numberOfAyahs)&&(identical(other.revelationType, _this.revelationType) || other.revelationType == _this.revelationType)&&const DeepCollectionEquality().equals(other.ayahs, _this.ayahs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as QuranSurahDetailsModel;
  return Object.hash(runtimeType,_this.number,_this.name,_this.englishName,_this.englishNameTranslation,_this.numberOfAyahs,_this.revelationType,const DeepCollectionEquality().hash(_this.ayahs));
}

@override
String toString() {
  final _this = this as QuranSurahDetailsModel;
  return 'QuranSurahDetailsModel(number: ${_this.number}, name: ${_this.name}, englishName: ${_this.englishName}, englishNameTranslation: ${_this.englishNameTranslation}, numberOfAyahs: ${_this.numberOfAyahs}, revelationType: ${_this.revelationType}, ayahs: ${_this.ayahs})';
}


}

/// @nodoc
abstract mixin class $QuranSurahDetailsModelCopyWith<$Res>  {
  factory $QuranSurahDetailsModelCopyWith(QuranSurahDetailsModel value, $Res Function(QuranSurahDetailsModel) _then) = _$QuranSurahDetailsModelCopyWithImpl;
@useResult
$Res call({
 int number, String name, String englishName, String englishNameTranslation, int numberOfAyahs, String revelationType, List<QuranAyahModel> ayahs
});




}
/// @nodoc
class _$QuranSurahDetailsModelCopyWithImpl<$Res>
    implements $QuranSurahDetailsModelCopyWith<$Res> {
  _$QuranSurahDetailsModelCopyWithImpl(this._self, this._then);

  final QuranSurahDetailsModel _self;
  final $Res Function(QuranSurahDetailsModel) _then;

/// Create a copy of QuranSurahDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? name = null,Object? englishName = null,Object? englishNameTranslation = null,Object? numberOfAyahs = null,Object? revelationType = null,Object? ayahs = null,}) {
  return _then(QuranSurahDetailsModel(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,englishName: null == englishName ? _self.englishName : englishName // ignore: cast_nullable_to_non_nullable
as String,englishNameTranslation: null == englishNameTranslation ? _self.englishNameTranslation : englishNameTranslation // ignore: cast_nullable_to_non_nullable
as String,numberOfAyahs: null == numberOfAyahs ? _self.numberOfAyahs : numberOfAyahs // ignore: cast_nullable_to_non_nullable
as int,revelationType: null == revelationType ? _self.revelationType : revelationType // ignore: cast_nullable_to_non_nullable
as String,ayahs: null == ayahs ? _self.ayahs : ayahs // ignore: cast_nullable_to_non_nullable
as List<QuranAyahModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [QuranSurahDetailsModel].
extension QuranSurahDetailsModelPatterns on QuranSurahDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuranSurahDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuranSurahDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuranSurahDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _QuranSurahDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuranSurahDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuranSurahDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int number,  String name,  String englishName,  String englishNameTranslation,  int numberOfAyahs,  String revelationType,  List<QuranAyahModel> ayahs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuranSurahDetailsModel() when $default != null:
return $default(_that.number,_that.name,_that.englishName,_that.englishNameTranslation,_that.numberOfAyahs,_that.revelationType,_that.ayahs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int number,  String name,  String englishName,  String englishNameTranslation,  int numberOfAyahs,  String revelationType,  List<QuranAyahModel> ayahs)  $default,) {final _that = this;
switch (_that) {
case _QuranSurahDetailsModel():
return $default(_that.number,_that.name,_that.englishName,_that.englishNameTranslation,_that.numberOfAyahs,_that.revelationType,_that.ayahs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int number,  String name,  String englishName,  String englishNameTranslation,  int numberOfAyahs,  String revelationType,  List<QuranAyahModel> ayahs)?  $default,) {final _that = this;
switch (_that) {
case _QuranSurahDetailsModel() when $default != null:
return $default(_that.number,_that.name,_that.englishName,_that.englishNameTranslation,_that.numberOfAyahs,_that.revelationType,_that.ayahs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuranSurahDetailsModel extends QuranSurahDetailsModel {
  const _QuranSurahDetailsModel({required this.number, required this.name, required this.englishName, required this.englishNameTranslation, this.numberOfAyahs = 0, this.revelationType = '',  List<QuranAyahModel> ayahs = const <QuranAyahModel>[]}): _ayahs = ayahs,super._();
  factory _QuranSurahDetailsModel.fromJson(Map<String, dynamic> json) => _$QuranSurahDetailsModelFromJson(json);

@override final  int number;
@override final  String name;
@override final  String englishName;
@override final  String englishNameTranslation;
@override@JsonKey() final  int numberOfAyahs;
@override@JsonKey() final  String revelationType;
 final  List<QuranAyahModel> _ayahs;
@override@JsonKey() List<QuranAyahModel> get ayahs {
  if (_ayahs is EqualUnmodifiableListView) return _ayahs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ayahs);
}


/// Create a copy of QuranSurahDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuranSurahDetailsModelCopyWith<_QuranSurahDetailsModel> get copyWith => __$QuranSurahDetailsModelCopyWithImpl<_QuranSurahDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuranSurahDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuranSurahDetailsModel&&(identical(other.number, number) || other.number == number)&&(identical(other.name, name) || other.name == name)&&(identical(other.englishName, englishName) || other.englishName == englishName)&&(identical(other.englishNameTranslation, englishNameTranslation) || other.englishNameTranslation == englishNameTranslation)&&(identical(other.numberOfAyahs, numberOfAyahs) || other.numberOfAyahs == numberOfAyahs)&&(identical(other.revelationType, revelationType) || other.revelationType == revelationType)&&const DeepCollectionEquality().equals(other.ayahs, _ayahs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,number,name,englishName,englishNameTranslation,numberOfAyahs,revelationType,const DeepCollectionEquality().hash(_ayahs));
}

@override
String toString() {
    return 'QuranSurahDetailsModel(number: $number, name: $name, englishName: $englishName, englishNameTranslation: $englishNameTranslation, numberOfAyahs: $numberOfAyahs, revelationType: $revelationType, ayahs: $ayahs)';
}


}

/// @nodoc
abstract mixin class _$QuranSurahDetailsModelCopyWith<$Res> implements $QuranSurahDetailsModelCopyWith<$Res> {
  factory _$QuranSurahDetailsModelCopyWith(_QuranSurahDetailsModel value, $Res Function(_QuranSurahDetailsModel) _then) = __$QuranSurahDetailsModelCopyWithImpl;
@override @useResult
$Res call({
 int number, String name, String englishName, String englishNameTranslation, int numberOfAyahs, String revelationType, List<QuranAyahModel> ayahs
});




}
/// @nodoc
class __$QuranSurahDetailsModelCopyWithImpl<$Res>
    implements _$QuranSurahDetailsModelCopyWith<$Res> {
  __$QuranSurahDetailsModelCopyWithImpl(this._self, this._then);

  final _QuranSurahDetailsModel _self;
  final $Res Function(_QuranSurahDetailsModel) _then;

/// Create a copy of QuranSurahDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? name = null,Object? englishName = null,Object? englishNameTranslation = null,Object? numberOfAyahs = null,Object? revelationType = null,Object? ayahs = null,}) {
  return _then(_QuranSurahDetailsModel(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,englishName: null == englishName ? _self.englishName : englishName // ignore: cast_nullable_to_non_nullable
as String,englishNameTranslation: null == englishNameTranslation ? _self.englishNameTranslation : englishNameTranslation // ignore: cast_nullable_to_non_nullable
as String,numberOfAyahs: null == numberOfAyahs ? _self.numberOfAyahs : numberOfAyahs // ignore: cast_nullable_to_non_nullable
as int,revelationType: null == revelationType ? _self.revelationType : revelationType // ignore: cast_nullable_to_non_nullable
as String,ayahs: null == ayahs ? _self._ayahs : ayahs // ignore: cast_nullable_to_non_nullable
as List<QuranAyahModel>,
  ));
}


}

// dart format on
