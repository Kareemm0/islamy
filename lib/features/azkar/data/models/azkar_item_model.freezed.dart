// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'azkar_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AzkarItemModel {

 String get category; String get count; String get description; String get reference; String get content;
/// Create a copy of AzkarItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AzkarItemModelCopyWith<AzkarItemModel> get copyWith => _$AzkarItemModelCopyWithImpl<AzkarItemModel>(this as AzkarItemModel, _$identity);

  /// Serializes this AzkarItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AzkarItemModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AzkarItemModel&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.count, _this.count) || other.count == _this.count)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.reference, _this.reference) || other.reference == _this.reference)&&(identical(other.content, _this.content) || other.content == _this.content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AzkarItemModel;
  return Object.hash(runtimeType,_this.category,_this.count,_this.description,_this.reference,_this.content);
}

@override
String toString() {
  final _this = this as AzkarItemModel;
  return 'AzkarItemModel(category: ${_this.category}, count: ${_this.count}, description: ${_this.description}, reference: ${_this.reference}, content: ${_this.content})';
}


}

/// @nodoc
abstract mixin class $AzkarItemModelCopyWith<$Res>  {
  factory $AzkarItemModelCopyWith(AzkarItemModel value, $Res Function(AzkarItemModel) _then) = _$AzkarItemModelCopyWithImpl;
@useResult
$Res call({
 String category, String count, String description, String reference, String content
});




}
/// @nodoc
class _$AzkarItemModelCopyWithImpl<$Res>
    implements $AzkarItemModelCopyWith<$Res> {
  _$AzkarItemModelCopyWithImpl(this._self, this._then);

  final AzkarItemModel _self;
  final $Res Function(AzkarItemModel) _then;

/// Create a copy of AzkarItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? count = null,Object? description = null,Object? reference = null,Object? content = null,}) {
  return _then(AzkarItemModel(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AzkarItemModel].
extension AzkarItemModelPatterns on AzkarItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AzkarItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AzkarItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AzkarItemModel value)  $default,){
final _that = this;
switch (_that) {
case _AzkarItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AzkarItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _AzkarItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String category,  String count,  String description,  String reference,  String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AzkarItemModel() when $default != null:
return $default(_that.category,_that.count,_that.description,_that.reference,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String category,  String count,  String description,  String reference,  String content)  $default,) {final _that = this;
switch (_that) {
case _AzkarItemModel():
return $default(_that.category,_that.count,_that.description,_that.reference,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String category,  String count,  String description,  String reference,  String content)?  $default,) {final _that = this;
switch (_that) {
case _AzkarItemModel() when $default != null:
return $default(_that.category,_that.count,_that.description,_that.reference,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AzkarItemModel extends AzkarItemModel {
  const _AzkarItemModel({this.category = '', this.count = '1', this.description = '', this.reference = '', this.content = ''}): super._();
  factory _AzkarItemModel.fromJson(Map<String, dynamic> json) => _$AzkarItemModelFromJson(json);

@override@JsonKey() final  String category;
@override@JsonKey() final  String count;
@override@JsonKey() final  String description;
@override@JsonKey() final  String reference;
@override@JsonKey() final  String content;

/// Create a copy of AzkarItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AzkarItemModelCopyWith<_AzkarItemModel> get copyWith => __$AzkarItemModelCopyWithImpl<_AzkarItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AzkarItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AzkarItemModel&&(identical(other.category, category) || other.category == category)&&(identical(other.count, count) || other.count == count)&&(identical(other.description, description) || other.description == description)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,category,count,description,reference,content);
}

@override
String toString() {
    return 'AzkarItemModel(category: $category, count: $count, description: $description, reference: $reference, content: $content)';
}


}

/// @nodoc
abstract mixin class _$AzkarItemModelCopyWith<$Res> implements $AzkarItemModelCopyWith<$Res> {
  factory _$AzkarItemModelCopyWith(_AzkarItemModel value, $Res Function(_AzkarItemModel) _then) = __$AzkarItemModelCopyWithImpl;
@override @useResult
$Res call({
 String category, String count, String description, String reference, String content
});




}
/// @nodoc
class __$AzkarItemModelCopyWithImpl<$Res>
    implements _$AzkarItemModelCopyWith<$Res> {
  __$AzkarItemModelCopyWithImpl(this._self, this._then);

  final _AzkarItemModel _self;
  final $Res Function(_AzkarItemModel) _then;

/// Create a copy of AzkarItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? count = null,Object? description = null,Object? reference = null,Object? content = null,}) {
  return _then(_AzkarItemModel(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
