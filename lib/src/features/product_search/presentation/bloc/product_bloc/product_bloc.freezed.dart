// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProductEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductEvent()';
  }
}

/// @nodoc
class $ProductEventCopyWith<$Res> {
  $ProductEventCopyWith(ProductEvent _, $Res Function(ProductEvent) __);
}

/// Adds pattern-matching-related methods to [ProductEvent].
extension ProductEventPatterns on ProductEvent {
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
    TResult Function(SearchProductsEvent value)? searchProductsEvent,
    TResult Function(GetProductDetailEvent value)? getProductDetailEvent,
    TResult Function(GetSimilarProductsEvent value)? getSimilarProductsEvent,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SearchProductsEvent() when searchProductsEvent != null:
        return searchProductsEvent(_that);
      case GetProductDetailEvent() when getProductDetailEvent != null:
        return getProductDetailEvent(_that);
      case GetSimilarProductsEvent() when getSimilarProductsEvent != null:
        return getSimilarProductsEvent(_that);
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
    required TResult Function(SearchProductsEvent value) searchProductsEvent,
    required TResult Function(GetProductDetailEvent value)
        getProductDetailEvent,
    required TResult Function(GetSimilarProductsEvent value)
        getSimilarProductsEvent,
  }) {
    final _that = this;
    switch (_that) {
      case SearchProductsEvent():
        return searchProductsEvent(_that);
      case GetProductDetailEvent():
        return getProductDetailEvent(_that);
      case GetSimilarProductsEvent():
        return getSimilarProductsEvent(_that);
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
    TResult? Function(SearchProductsEvent value)? searchProductsEvent,
    TResult? Function(GetProductDetailEvent value)? getProductDetailEvent,
    TResult? Function(GetSimilarProductsEvent value)? getSimilarProductsEvent,
  }) {
    final _that = this;
    switch (_that) {
      case SearchProductsEvent() when searchProductsEvent != null:
        return searchProductsEvent(_that);
      case GetProductDetailEvent() when getProductDetailEvent != null:
        return getProductDetailEvent(_that);
      case GetSimilarProductsEvent() when getSimilarProductsEvent != null:
        return getSimilarProductsEvent(_that);
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
    TResult Function(String query)? searchProductsEvent,
    TResult Function(String handler)? getProductDetailEvent,
    TResult Function(String productId)? getSimilarProductsEvent,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SearchProductsEvent() when searchProductsEvent != null:
        return searchProductsEvent(_that.query);
      case GetProductDetailEvent() when getProductDetailEvent != null:
        return getProductDetailEvent(_that.handler);
      case GetSimilarProductsEvent() when getSimilarProductsEvent != null:
        return getSimilarProductsEvent(_that.productId);
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
    required TResult Function(String query) searchProductsEvent,
    required TResult Function(String handler) getProductDetailEvent,
    required TResult Function(String productId) getSimilarProductsEvent,
  }) {
    final _that = this;
    switch (_that) {
      case SearchProductsEvent():
        return searchProductsEvent(_that.query);
      case GetProductDetailEvent():
        return getProductDetailEvent(_that.handler);
      case GetSimilarProductsEvent():
        return getSimilarProductsEvent(_that.productId);
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
    TResult? Function(String query)? searchProductsEvent,
    TResult? Function(String handler)? getProductDetailEvent,
    TResult? Function(String productId)? getSimilarProductsEvent,
  }) {
    final _that = this;
    switch (_that) {
      case SearchProductsEvent() when searchProductsEvent != null:
        return searchProductsEvent(_that.query);
      case GetProductDetailEvent() when getProductDetailEvent != null:
        return getProductDetailEvent(_that.handler);
      case GetSimilarProductsEvent() when getSimilarProductsEvent != null:
        return getSimilarProductsEvent(_that.productId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class SearchProductsEvent implements ProductEvent {
  SearchProductsEvent({required this.query});

  final String query;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchProductsEventCopyWith<SearchProductsEvent> get copyWith =>
      _$SearchProductsEventCopyWithImpl<SearchProductsEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchProductsEvent &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'ProductEvent.searchProductsEvent(query: $query)';
  }
}

/// @nodoc
abstract mixin class $SearchProductsEventCopyWith<$Res>
    implements $ProductEventCopyWith<$Res> {
  factory $SearchProductsEventCopyWith(
          SearchProductsEvent value, $Res Function(SearchProductsEvent) _then) =
      _$SearchProductsEventCopyWithImpl;
  @useResult
  $Res call({String query});
}

/// @nodoc
class _$SearchProductsEventCopyWithImpl<$Res>
    implements $SearchProductsEventCopyWith<$Res> {
  _$SearchProductsEventCopyWithImpl(this._self, this._then);

  final SearchProductsEvent _self;
  final $Res Function(SearchProductsEvent) _then;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
  }) {
    return _then(SearchProductsEvent(
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetProductDetailEvent implements ProductEvent {
  GetProductDetailEvent({required this.handler});

  final String handler;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetProductDetailEventCopyWith<GetProductDetailEvent> get copyWith =>
      _$GetProductDetailEventCopyWithImpl<GetProductDetailEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetProductDetailEvent &&
            (identical(other.handler, handler) || other.handler == handler));
  }

  @override
  int get hashCode => Object.hash(runtimeType, handler);

  @override
  String toString() {
    return 'ProductEvent.getProductDetailEvent(handler: $handler)';
  }
}

/// @nodoc
abstract mixin class $GetProductDetailEventCopyWith<$Res>
    implements $ProductEventCopyWith<$Res> {
  factory $GetProductDetailEventCopyWith(GetProductDetailEvent value,
          $Res Function(GetProductDetailEvent) _then) =
      _$GetProductDetailEventCopyWithImpl;
  @useResult
  $Res call({String handler});
}

/// @nodoc
class _$GetProductDetailEventCopyWithImpl<$Res>
    implements $GetProductDetailEventCopyWith<$Res> {
  _$GetProductDetailEventCopyWithImpl(this._self, this._then);

  final GetProductDetailEvent _self;
  final $Res Function(GetProductDetailEvent) _then;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? handler = null,
  }) {
    return _then(GetProductDetailEvent(
      handler: null == handler
          ? _self.handler
          : handler // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetSimilarProductsEvent implements ProductEvent {
  GetSimilarProductsEvent({required this.productId});

  final String productId;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetSimilarProductsEventCopyWith<GetSimilarProductsEvent> get copyWith =>
      _$GetSimilarProductsEventCopyWithImpl<GetSimilarProductsEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetSimilarProductsEvent &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @override
  String toString() {
    return 'ProductEvent.getSimilarProductsEvent(productId: $productId)';
  }
}

/// @nodoc
abstract mixin class $GetSimilarProductsEventCopyWith<$Res>
    implements $ProductEventCopyWith<$Res> {
  factory $GetSimilarProductsEventCopyWith(GetSimilarProductsEvent value,
          $Res Function(GetSimilarProductsEvent) _then) =
      _$GetSimilarProductsEventCopyWithImpl;
  @useResult
  $Res call({String productId});
}

/// @nodoc
class _$GetSimilarProductsEventCopyWithImpl<$Res>
    implements $GetSimilarProductsEventCopyWith<$Res> {
  _$GetSimilarProductsEventCopyWithImpl(this._self, this._then);

  final GetSimilarProductsEvent _self;
  final $Res Function(GetSimilarProductsEvent) _then;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
  }) {
    return _then(GetSimilarProductsEvent(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ProductState {
  bool get isLoading;
  List<Product> get products;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductStateCopyWith<ProductState> get copyWith =>
      _$ProductStateCopyWithImpl<ProductState>(
          this as ProductState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other.products, products));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(products));

  @override
  String toString() {
    return 'ProductState(isLoading: $isLoading, products: $products)';
  }
}

/// @nodoc
abstract mixin class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) _then) =
      _$ProductStateCopyWithImpl;
  @useResult
  $Res call({bool isLoading, List<Product> products});
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res> implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._self, this._then);

  final ProductState _self;
  final $Res Function(ProductState) _then;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? products = null,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      products: null == products
          ? _self.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ProductState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductState() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_ProductState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductState():
        return $default(_that);
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ProductState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductState() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool isLoading, List<Product> products)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductState() when $default != null:
        return $default(_that.isLoading, _that.products);
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
  TResult when<TResult extends Object?>(
    TResult Function(bool isLoading, List<Product> products) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductState():
        return $default(_that.isLoading, _that.products);
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool isLoading, List<Product> products)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductState() when $default != null:
        return $default(_that.isLoading, _that.products);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProductState implements ProductState {
  const _ProductState(
      {required this.isLoading, required final List<Product> products})
      : _products = products;

  @override
  final bool isLoading;
  final List<Product> _products;
  @override
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductStateCopyWith<_ProductState> get copyWith =>
      __$ProductStateCopyWithImpl<_ProductState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_products));

  @override
  String toString() {
    return 'ProductState(isLoading: $isLoading, products: $products)';
  }
}

/// @nodoc
abstract mixin class _$ProductStateCopyWith<$Res>
    implements $ProductStateCopyWith<$Res> {
  factory _$ProductStateCopyWith(
          _ProductState value, $Res Function(_ProductState) _then) =
      __$ProductStateCopyWithImpl;
  @override
  @useResult
  $Res call({bool isLoading, List<Product> products});
}

/// @nodoc
class __$ProductStateCopyWithImpl<$Res>
    implements _$ProductStateCopyWith<$Res> {
  __$ProductStateCopyWithImpl(this._self, this._then);

  final _ProductState _self;
  final $Res Function(_ProductState) _then;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? products = null,
  }) {
    return _then(_ProductState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      products: null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

// dart format on
