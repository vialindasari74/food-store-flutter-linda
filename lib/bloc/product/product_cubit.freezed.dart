// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProductState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductState()';
  }
}

/// @nodoc
class $ProductStateCopyWith<$Res> {
  $ProductStateCopyWith(ProductState _, $Res Function(ProductState) __);
}

/// Adds pattern-matching-related methods to [ProductState].
extension ProductStatePatterns on ProductState {
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
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedProduct value)? loadedProduct,
    TResult Function(_LoadedDetailProduct value)? loadedDetailProduct,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _LoadedProduct() when loadedProduct != null:
        return loadedProduct(_that);
      case _LoadedDetailProduct() when loadedDetailProduct != null:
        return loadedDetailProduct(_that);
      case _Error() when error != null:
        return error(_that);
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadedProduct value) loadedProduct,
    required TResult Function(_LoadedDetailProduct value) loadedDetailProduct,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _LoadedProduct():
        return loadedProduct(_that);
      case _LoadedDetailProduct():
        return loadedDetailProduct(_that);
      case _Error():
        return error(_that);
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadedProduct value)? loadedProduct,
    TResult? Function(_LoadedDetailProduct value)? loadedDetailProduct,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _LoadedProduct() when loadedProduct != null:
        return loadedProduct(_that);
      case _LoadedDetailProduct() when loadedDetailProduct != null:
        return loadedDetailProduct(_that);
      case _Error() when error != null:
        return error(_that);
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
    TResult Function()? loading,
    TResult Function(List<ProductModel> products, bool hasMore)? loadedProduct,
    TResult Function(ProductModel product)? loadedDetailProduct,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _LoadedProduct() when loadedProduct != null:
        return loadedProduct(_that.products, _that.hasMore);
      case _LoadedDetailProduct() when loadedDetailProduct != null:
        return loadedDetailProduct(_that.product);
      case _Error() when error != null:
        return error(_that.message);
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
    required TResult Function() loading,
    required TResult Function(List<ProductModel> products, bool hasMore)
        loadedProduct,
    required TResult Function(ProductModel product) loadedDetailProduct,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _LoadedProduct():
        return loadedProduct(_that.products, _that.hasMore);
      case _LoadedDetailProduct():
        return loadedDetailProduct(_that.product);
      case _Error():
        return error(_that.message);
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
    TResult? Function()? loading,
    TResult? Function(List<ProductModel> products, bool hasMore)? loadedProduct,
    TResult? Function(ProductModel product)? loadedDetailProduct,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _LoadedProduct() when loadedProduct != null:
        return loadedProduct(_that.products, _that.hasMore);
      case _LoadedDetailProduct() when loadedDetailProduct != null:
        return loadedDetailProduct(_that.product);
      case _Error() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements ProductState {
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
    return 'ProductState.initial()';
  }
}

/// @nodoc

class _Loading implements ProductState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductState.loading()';
  }
}

/// @nodoc

class _LoadedProduct implements ProductState {
  const _LoadedProduct(List<ProductModel> products, {required this.hasMore})
      : _products = products;

  final List<ProductModel> _products;
  List<ProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final bool hasMore;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadedProductCopyWith<_LoadedProduct> get copyWith =>
      __$LoadedProductCopyWithImpl<_LoadedProduct>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadedProduct &&
            const DeepCollectionEquality().equals(other.products, _products) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, const DeepCollectionEquality().hash(_products), hasMore);
  }

  @override
  String toString() {
    return 'ProductState.loadedProduct(products: $products, hasMore: $hasMore)';
  }
}

/// @nodoc
abstract mixin class _$LoadedProductCopyWith<$Res>
    implements $ProductStateCopyWith<$Res> {
  factory _$LoadedProductCopyWith(
          _LoadedProduct value, $Res Function(_LoadedProduct) _then) =
      __$LoadedProductCopyWithImpl;
  @useResult
  $Res call({List<ProductModel> products, bool hasMore});
}

/// @nodoc
class __$LoadedProductCopyWithImpl<$Res>
    implements _$LoadedProductCopyWith<$Res> {
  __$LoadedProductCopyWithImpl(this._self, this._then);

  final _LoadedProduct _self;
  final $Res Function(_LoadedProduct) _then;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? products = null,
    Object? hasMore = null,
  }) {
    return _then(_LoadedProduct(
      null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      hasMore: null == hasMore
          ? _self.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _LoadedDetailProduct implements ProductState {
  const _LoadedDetailProduct(this.product);

  final ProductModel product;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadedDetailProductCopyWith<_LoadedDetailProduct> get copyWith =>
      __$LoadedDetailProductCopyWithImpl<_LoadedDetailProduct>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadedDetailProduct &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, product);
  }

  @override
  String toString() {
    return 'ProductState.loadedDetailProduct(product: $product)';
  }
}

/// @nodoc
abstract mixin class _$LoadedDetailProductCopyWith<$Res>
    implements $ProductStateCopyWith<$Res> {
  factory _$LoadedDetailProductCopyWith(_LoadedDetailProduct value,
          $Res Function(_LoadedDetailProduct) _then) =
      __$LoadedDetailProductCopyWithImpl;
  @useResult
  $Res call({ProductModel product});
}

/// @nodoc
class __$LoadedDetailProductCopyWithImpl<$Res>
    implements _$LoadedDetailProductCopyWith<$Res> {
  __$LoadedDetailProductCopyWithImpl(this._self, this._then);

  final _LoadedDetailProduct _self;
  final $Res Function(_LoadedDetailProduct) _then;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
  }) {
    return _then(_LoadedDetailProduct(
      null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
    ));
  }
}

/// @nodoc

class _Error implements ProductState {
  const _Error(this.message);

  final String message;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, message);
  }

  @override
  String toString() {
    return 'ProductState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $ProductStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_Error(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
