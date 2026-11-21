// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_product_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewProductState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ReviewProductState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ReviewProductState()';
  }
}

/// @nodoc
class $ReviewProductStateCopyWith<$Res> {
  $ReviewProductStateCopyWith(
      ReviewProductState _, $Res Function(ReviewProductState) __);
}

/// Adds pattern-matching-related methods to [ReviewProductState].
extension ReviewProductStatePatterns on ReviewProductState {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SuccessReviewProduct value)? successReviewProduct,
    TResult Function(_ErrorReviewProduct value)? errorReviewProduct,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _SuccessReviewProduct() when successReviewProduct != null:
        return successReviewProduct(_that);
      case _ErrorReviewProduct() when errorReviewProduct != null:
        return errorReviewProduct(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SuccessReviewProduct value) successReviewProduct,
    required TResult Function(_ErrorReviewProduct value) errorReviewProduct,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _SuccessReviewProduct():
        return successReviewProduct(_that);
      case _ErrorReviewProduct():
        return errorReviewProduct(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SuccessReviewProduct value)? successReviewProduct,
    TResult? Function(_ErrorReviewProduct value)? errorReviewProduct,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _SuccessReviewProduct() when successReviewProduct != null:
        return successReviewProduct(_that);
      case _ErrorReviewProduct() when errorReviewProduct != null:
        return errorReviewProduct(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? successReviewProduct,
    TResult Function(String message)? errorReviewProduct,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _SuccessReviewProduct() when successReviewProduct != null:
        return successReviewProduct();
      case _ErrorReviewProduct() when errorReviewProduct != null:
        return errorReviewProduct(_that.message);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() successReviewProduct,
    required TResult Function(String message) errorReviewProduct,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _SuccessReviewProduct():
        return successReviewProduct();
      case _ErrorReviewProduct():
        return errorReviewProduct(_that.message);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? successReviewProduct,
    TResult? Function(String message)? errorReviewProduct,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _SuccessReviewProduct() when successReviewProduct != null:
        return successReviewProduct();
      case _ErrorReviewProduct() when errorReviewProduct != null:
        return errorReviewProduct(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements ReviewProductState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ReviewProductState.initial()';
  }
}

/// @nodoc

class _SuccessReviewProduct implements ReviewProductState {
  const _SuccessReviewProduct();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SuccessReviewProduct);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ReviewProductState.successReviewProduct()';
  }
}

/// @nodoc

class _ErrorReviewProduct implements ReviewProductState {
  const _ErrorReviewProduct(this.message);

  final String message;

  /// Create a copy of ReviewProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorReviewProductCopyWith<_ErrorReviewProduct> get copyWith =>
      __$ErrorReviewProductCopyWithImpl<_ErrorReviewProduct>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ErrorReviewProduct &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, message);
  }

  @override
  String toString() {
    return 'ReviewProductState.errorReviewProduct(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorReviewProductCopyWith<$Res>
    implements $ReviewProductStateCopyWith<$Res> {
  factory _$ErrorReviewProductCopyWith(
          _ErrorReviewProduct value, $Res Function(_ErrorReviewProduct) _then) =
      __$ErrorReviewProductCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$ErrorReviewProductCopyWithImpl<$Res>
    implements _$ErrorReviewProductCopyWith<$Res> {
  __$ErrorReviewProductCopyWithImpl(this._self, this._then);

  final _ErrorReviewProduct _self;
  final $Res Function(_ErrorReviewProduct) _then;

  /// Create a copy of ReviewProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_ErrorReviewProduct(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
