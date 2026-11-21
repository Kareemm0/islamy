// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quran_ayah_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuranAyahModel {

 int get number; int get numberInSurah; String get text; int get juz; int get page;@JsonKey(name: 'sajda', fromJson: _parseSajda) bool get hasSajda;
/// Create a copy of QuranAyahModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuranAyahModelCopyWith<QuranAyahModel> get copyWith => _$QuranAyahModelCopyWithImpl<QuranAyahModel>(this as QuranAyahModel, _$identity);

  /// Serializes this QuranAyahModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as QuranAyahModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuranAyahModel&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.numberInSurah, _this.numberInSurah) || other.numberInSurah == _this.numberInSurah)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.juz, _this.juz) || other.juz == _this.juz)&&(identical(other.page, _this.page) || other.page == _this.page)&&(identical(other.hasSajda, _this.hasSajda) || other.hasSajda == _this.hasSajda));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as QuranAyahModel;
  return Object.hash(runtimeType,_this.number,_this.numberInSurah,_this.text,_this.juz,_this.page,_this.hasSajda);
}

@override
String toString() {
  final _this = this as QuranAyahModel;
  return 'QuranAyahModel(number: ${_this.number}, numberInSurah: ${_this.numberInSurah}, text: ${_this.text}, juz: ${_this.juz}, page: ${_this.page}, hasSajda: ${_this.hasSajda})';
}


}

/// @nodoc
abstract mixin class $QuranAyahModelCopyWith<$Res>  {
  factory $QuranAyahModelCopyWith(QuranAyahModel value, $Res Function(QuranAyahModel) _then) = _$QuranAyahModelCopyWithImpl;
@useResult
$Res call({
 int number, int numberInSurah, String text, int juz, int page,@JsonKey(name: 'sajda', fromJson: _parseSajda) bool hasSajda
});




}
/// @nodoc
class _$QuranAyahModelCopyWithImpl<$Res>
    implements $QuranAyahModelCopyWith<$Res> {
  _$QuranAyahModelCopyWithImpl(this._self, this._then);

  final QuranAyahModel _self;
  final $Res Function(QuranAyahModel) _then;

/// Create a copy of QuranAyahModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? numberInSurah = null,Object? text = null,Object? juz = null,Object? page = null,Object? hasSajda = null,}) {
  return _then(QuranAyahModel(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,numberInSurah: null == numberInSurah ? _self.numberInSurah : numberInSurah // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,juz: null == juz ? _self.juz : juz // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasSajda: null == hasSajda ? _self.hasSajda : hasSajda // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [QuranAyahModel].
extension QuranAyahModelPatterns on QuranAyahModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuranAyahModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuranAyahModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuranAyahModel value)  $default,){
final _that = this;
switch (_that) {
case _QuranAyahModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuranAyahModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuranAyahModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int number,  int numberInSurah,  String text,  int juz,  int page, @JsonKey(name: 'sajda', fromJson: _parseSajda)  bool hasSajda)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuranAyahModel() when $default != null:
return $default(_that.number,_that.numberInSurah,_that.text,_that.juz,_that.page,_that.hasSajda);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int number,  int numberInSurah,  String text,  int juz,  int page, @JsonKey(name: 'sajda', fromJson: _parseSajda)  bool hasSajda)  $default,) {final _that = this;
switch (_that) {
case _QuranAyahModel():
return $default(_that.number,_that.numberInSurah,_that.text,_that.juz,_that.page,_that.hasSajda);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int number,  int numberInSurah,  String text,  int juz,  int page, @JsonKey(name: 'sajda', fromJson: _parseSajda)  bool hasSajda)?  $default,) {final _that = this;
switch (_that) {
case _QuranAyahModel() when $default != null:
return $default(_that.number,_that.numberInSurah,_that.text,_that.juz,_that.page,_that.hasSajda);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuranAyahModel extends QuranAyahModel {
  const _QuranAyahModel({required this.number, required this.numberInSurah, required this.text, this.juz = 0, this.page = 0, @JsonKey(name: 'sajda', fromJson: _parseSajda) this.hasSajda = false}): super._();
  factory _QuranAyahModel.fromJson(Map<String, dynamic> json) => _$QuranAyahModelFromJson(json);

@override final  int number;
@override final  int numberInSurah;
@override final  String text;
@override@JsonKey() final  int juz;
@override@JsonKey() final  int page;
@override@JsonKey(name: 'sajda', fromJson: _parseSajda) final  bool hasSajda;

/// Create a copy of QuranAyahModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuranAyahModelCopyWith<_QuranAyahModel> get copyWith => __$QuranAyahModelCopyWithImpl<_QuranAyahModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuranAyahModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuranAyahModel&&(identical(other.number, number) || other.number == number)&&(identical(other.numberInSurah, numberInSurah) || other.numberInSurah == numberInSurah)&&(identical(other.text, text) || other.text == text)&&(identical(other.juz, juz) || other.juz == juz)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasSajda, hasSajda) || other.hasSajda == hasSajda));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,number,numberInSurah,text,juz,page,hasSajda);
}

@override
String toString() {
    return 'QuranAyahModel(number: $number, numberInSurah: $numberInSurah, text: $text, juz: $juz, page: $page, hasSajda: $hasSajda)';
}


}

/// @nodoc
abstract mixin class _$QuranAyahModelCopyWith<$Res> implements $QuranAyahModelCopyWith<$Res> {
  factory _$QuranAyahModelCopyWith(_QuranAyahModel value, $Res Function(_QuranAyahModel) _then) = __$QuranAyahModelCopyWithImpl;
@override @useResult
$Res call({
 int number, int numberInSurah, String text, int juz, int page,@JsonKey(name: 'sajda', fromJson: _parseSajda) bool hasSajda
});




}
/// @nodoc
class __$QuranAyahModelCopyWithImpl<$Res>
    implements _$QuranAyahModelCopyWith<$Res> {
  __$QuranAyahModelCopyWithImpl(this._self, this._then);

  final _QuranAyahModel _self;
  final $Res Function(_QuranAyahModel) _then;

/// Create a copy of QuranAyahModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? numberInSurah = null,Object? text = null,Object? juz = null,Object? page = null,Object? hasSajda = null,}) {
  return _then(_QuranAyahModel(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,numberInSurah: null == numberInSurah ? _self.numberInSurah : numberInSurah // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,juz: null == juz ? _self.juz : juz // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasSajda: null == hasSajda ? _self.hasSajda : hasSajda // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
