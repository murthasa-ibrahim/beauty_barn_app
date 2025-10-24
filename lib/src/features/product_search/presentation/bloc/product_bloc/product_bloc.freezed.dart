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
    TResult Function(ToggleBrandEvent value)? toggleBrand,
    TResult Function(SelectPriceRangeEvent value)? selectPriceRange,
    TResult Function(SetCustomPriceRangeEvent value)? setCustomPriceRange,
    TResult Function(SelectRatingEvent value)? selectRating,
    TResult Function(ResetFiltersEvent value)? resetFilters,
    TResult Function(ApplyFiltersEvent value)? applyFilters,
    TResult Function(RefreshUiEvent value)? refreshUi,
    TResult Function(FetchBrandsEvent value)? fetchBrands,
    TResult Function(GetProductDetail value)? getProductDetail,
    TResult Function(GetSearchSuggestion value)? getSearchSuggestion,
    TResult Function(ClearSearchSuggestions value)? clearSearchSuggestions,
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
      case ToggleBrandEvent() when toggleBrand != null:
        return toggleBrand(_that);
      case SelectPriceRangeEvent() when selectPriceRange != null:
        return selectPriceRange(_that);
      case SetCustomPriceRangeEvent() when setCustomPriceRange != null:
        return setCustomPriceRange(_that);
      case SelectRatingEvent() when selectRating != null:
        return selectRating(_that);
      case ResetFiltersEvent() when resetFilters != null:
        return resetFilters(_that);
      case ApplyFiltersEvent() when applyFilters != null:
        return applyFilters(_that);
      case RefreshUiEvent() when refreshUi != null:
        return refreshUi(_that);
      case FetchBrandsEvent() when fetchBrands != null:
        return fetchBrands(_that);
      case GetProductDetail() when getProductDetail != null:
        return getProductDetail(_that);
      case GetSearchSuggestion() when getSearchSuggestion != null:
        return getSearchSuggestion(_that);
      case ClearSearchSuggestions() when clearSearchSuggestions != null:
        return clearSearchSuggestions(_that);
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
    required TResult Function(ToggleBrandEvent value) toggleBrand,
    required TResult Function(SelectPriceRangeEvent value) selectPriceRange,
    required TResult Function(SetCustomPriceRangeEvent value)
        setCustomPriceRange,
    required TResult Function(SelectRatingEvent value) selectRating,
    required TResult Function(ResetFiltersEvent value) resetFilters,
    required TResult Function(ApplyFiltersEvent value) applyFilters,
    required TResult Function(RefreshUiEvent value) refreshUi,
    required TResult Function(FetchBrandsEvent value) fetchBrands,
    required TResult Function(GetProductDetail value) getProductDetail,
    required TResult Function(GetSearchSuggestion value) getSearchSuggestion,
    required TResult Function(ClearSearchSuggestions value)
        clearSearchSuggestions,
  }) {
    final _that = this;
    switch (_that) {
      case SearchProductsEvent():
        return searchProductsEvent(_that);
      case GetProductDetailEvent():
        return getProductDetailEvent(_that);
      case GetSimilarProductsEvent():
        return getSimilarProductsEvent(_that);
      case ToggleBrandEvent():
        return toggleBrand(_that);
      case SelectPriceRangeEvent():
        return selectPriceRange(_that);
      case SetCustomPriceRangeEvent():
        return setCustomPriceRange(_that);
      case SelectRatingEvent():
        return selectRating(_that);
      case ResetFiltersEvent():
        return resetFilters(_that);
      case ApplyFiltersEvent():
        return applyFilters(_that);
      case RefreshUiEvent():
        return refreshUi(_that);
      case FetchBrandsEvent():
        return fetchBrands(_that);
      case GetProductDetail():
        return getProductDetail(_that);
      case GetSearchSuggestion():
        return getSearchSuggestion(_that);
      case ClearSearchSuggestions():
        return clearSearchSuggestions(_that);
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
    TResult? Function(ToggleBrandEvent value)? toggleBrand,
    TResult? Function(SelectPriceRangeEvent value)? selectPriceRange,
    TResult? Function(SetCustomPriceRangeEvent value)? setCustomPriceRange,
    TResult? Function(SelectRatingEvent value)? selectRating,
    TResult? Function(ResetFiltersEvent value)? resetFilters,
    TResult? Function(ApplyFiltersEvent value)? applyFilters,
    TResult? Function(RefreshUiEvent value)? refreshUi,
    TResult? Function(FetchBrandsEvent value)? fetchBrands,
    TResult? Function(GetProductDetail value)? getProductDetail,
    TResult? Function(GetSearchSuggestion value)? getSearchSuggestion,
    TResult? Function(ClearSearchSuggestions value)? clearSearchSuggestions,
  }) {
    final _that = this;
    switch (_that) {
      case SearchProductsEvent() when searchProductsEvent != null:
        return searchProductsEvent(_that);
      case GetProductDetailEvent() when getProductDetailEvent != null:
        return getProductDetailEvent(_that);
      case GetSimilarProductsEvent() when getSimilarProductsEvent != null:
        return getSimilarProductsEvent(_that);
      case ToggleBrandEvent() when toggleBrand != null:
        return toggleBrand(_that);
      case SelectPriceRangeEvent() when selectPriceRange != null:
        return selectPriceRange(_that);
      case SetCustomPriceRangeEvent() when setCustomPriceRange != null:
        return setCustomPriceRange(_that);
      case SelectRatingEvent() when selectRating != null:
        return selectRating(_that);
      case ResetFiltersEvent() when resetFilters != null:
        return resetFilters(_that);
      case ApplyFiltersEvent() when applyFilters != null:
        return applyFilters(_that);
      case RefreshUiEvent() when refreshUi != null:
        return refreshUi(_that);
      case FetchBrandsEvent() when fetchBrands != null:
        return fetchBrands(_that);
      case GetProductDetail() when getProductDetail != null:
        return getProductDetail(_that);
      case GetSearchSuggestion() when getSearchSuggestion != null:
        return getSearchSuggestion(_that);
      case ClearSearchSuggestions() when clearSearchSuggestions != null:
        return clearSearchSuggestions(_that);
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
    TResult Function(String brand)? toggleBrand,
    TResult Function(String? range)? selectPriceRange,
    TResult Function(String? min, String? max)? setCustomPriceRange,
    TResult Function(double rating)? selectRating,
    TResult Function()? resetFilters,
    TResult Function()? applyFilters,
    TResult Function()? refreshUi,
    TResult Function(String? search)? fetchBrands,
    TResult Function(String? id)? getProductDetail,
    TResult Function(String? query)? getSearchSuggestion,
    TResult Function()? clearSearchSuggestions,
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
      case ToggleBrandEvent() when toggleBrand != null:
        return toggleBrand(_that.brand);
      case SelectPriceRangeEvent() when selectPriceRange != null:
        return selectPriceRange(_that.range);
      case SetCustomPriceRangeEvent() when setCustomPriceRange != null:
        return setCustomPriceRange(_that.min, _that.max);
      case SelectRatingEvent() when selectRating != null:
        return selectRating(_that.rating);
      case ResetFiltersEvent() when resetFilters != null:
        return resetFilters();
      case ApplyFiltersEvent() when applyFilters != null:
        return applyFilters();
      case RefreshUiEvent() when refreshUi != null:
        return refreshUi();
      case FetchBrandsEvent() when fetchBrands != null:
        return fetchBrands(_that.search);
      case GetProductDetail() when getProductDetail != null:
        return getProductDetail(_that.id);
      case GetSearchSuggestion() when getSearchSuggestion != null:
        return getSearchSuggestion(_that.query);
      case ClearSearchSuggestions() when clearSearchSuggestions != null:
        return clearSearchSuggestions();
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
    required TResult Function(String brand) toggleBrand,
    required TResult Function(String? range) selectPriceRange,
    required TResult Function(String? min, String? max) setCustomPriceRange,
    required TResult Function(double rating) selectRating,
    required TResult Function() resetFilters,
    required TResult Function() applyFilters,
    required TResult Function() refreshUi,
    required TResult Function(String? search) fetchBrands,
    required TResult Function(String? id) getProductDetail,
    required TResult Function(String? query) getSearchSuggestion,
    required TResult Function() clearSearchSuggestions,
  }) {
    final _that = this;
    switch (_that) {
      case SearchProductsEvent():
        return searchProductsEvent(_that.query);
      case GetProductDetailEvent():
        return getProductDetailEvent(_that.handler);
      case GetSimilarProductsEvent():
        return getSimilarProductsEvent(_that.productId);
      case ToggleBrandEvent():
        return toggleBrand(_that.brand);
      case SelectPriceRangeEvent():
        return selectPriceRange(_that.range);
      case SetCustomPriceRangeEvent():
        return setCustomPriceRange(_that.min, _that.max);
      case SelectRatingEvent():
        return selectRating(_that.rating);
      case ResetFiltersEvent():
        return resetFilters();
      case ApplyFiltersEvent():
        return applyFilters();
      case RefreshUiEvent():
        return refreshUi();
      case FetchBrandsEvent():
        return fetchBrands(_that.search);
      case GetProductDetail():
        return getProductDetail(_that.id);
      case GetSearchSuggestion():
        return getSearchSuggestion(_that.query);
      case ClearSearchSuggestions():
        return clearSearchSuggestions();
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
    TResult? Function(String brand)? toggleBrand,
    TResult? Function(String? range)? selectPriceRange,
    TResult? Function(String? min, String? max)? setCustomPriceRange,
    TResult? Function(double rating)? selectRating,
    TResult? Function()? resetFilters,
    TResult? Function()? applyFilters,
    TResult? Function()? refreshUi,
    TResult? Function(String? search)? fetchBrands,
    TResult? Function(String? id)? getProductDetail,
    TResult? Function(String? query)? getSearchSuggestion,
    TResult? Function()? clearSearchSuggestions,
  }) {
    final _that = this;
    switch (_that) {
      case SearchProductsEvent() when searchProductsEvent != null:
        return searchProductsEvent(_that.query);
      case GetProductDetailEvent() when getProductDetailEvent != null:
        return getProductDetailEvent(_that.handler);
      case GetSimilarProductsEvent() when getSimilarProductsEvent != null:
        return getSimilarProductsEvent(_that.productId);
      case ToggleBrandEvent() when toggleBrand != null:
        return toggleBrand(_that.brand);
      case SelectPriceRangeEvent() when selectPriceRange != null:
        return selectPriceRange(_that.range);
      case SetCustomPriceRangeEvent() when setCustomPriceRange != null:
        return setCustomPriceRange(_that.min, _that.max);
      case SelectRatingEvent() when selectRating != null:
        return selectRating(_that.rating);
      case ResetFiltersEvent() when resetFilters != null:
        return resetFilters();
      case ApplyFiltersEvent() when applyFilters != null:
        return applyFilters();
      case RefreshUiEvent() when refreshUi != null:
        return refreshUi();
      case FetchBrandsEvent() when fetchBrands != null:
        return fetchBrands(_that.search);
      case GetProductDetail() when getProductDetail != null:
        return getProductDetail(_that.id);
      case GetSearchSuggestion() when getSearchSuggestion != null:
        return getSearchSuggestion(_that.query);
      case ClearSearchSuggestions() when clearSearchSuggestions != null:
        return clearSearchSuggestions();
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

class ToggleBrandEvent implements ProductEvent {
  ToggleBrandEvent(this.brand);

  final String brand;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleBrandEventCopyWith<ToggleBrandEvent> get copyWith =>
      _$ToggleBrandEventCopyWithImpl<ToggleBrandEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleBrandEvent &&
            (identical(other.brand, brand) || other.brand == brand));
  }

  @override
  int get hashCode => Object.hash(runtimeType, brand);

  @override
  String toString() {
    return 'ProductEvent.toggleBrand(brand: $brand)';
  }
}

/// @nodoc
abstract mixin class $ToggleBrandEventCopyWith<$Res>
    implements $ProductEventCopyWith<$Res> {
  factory $ToggleBrandEventCopyWith(
          ToggleBrandEvent value, $Res Function(ToggleBrandEvent) _then) =
      _$ToggleBrandEventCopyWithImpl;
  @useResult
  $Res call({String brand});
}

/// @nodoc
class _$ToggleBrandEventCopyWithImpl<$Res>
    implements $ToggleBrandEventCopyWith<$Res> {
  _$ToggleBrandEventCopyWithImpl(this._self, this._then);

  final ToggleBrandEvent _self;
  final $Res Function(ToggleBrandEvent) _then;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? brand = null,
  }) {
    return _then(ToggleBrandEvent(
      null == brand
          ? _self.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class SelectPriceRangeEvent implements ProductEvent {
  SelectPriceRangeEvent(this.range);

  final String? range;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectPriceRangeEventCopyWith<SelectPriceRangeEvent> get copyWith =>
      _$SelectPriceRangeEventCopyWithImpl<SelectPriceRangeEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectPriceRangeEvent &&
            (identical(other.range, range) || other.range == range));
  }

  @override
  int get hashCode => Object.hash(runtimeType, range);

  @override
  String toString() {
    return 'ProductEvent.selectPriceRange(range: $range)';
  }
}

/// @nodoc
abstract mixin class $SelectPriceRangeEventCopyWith<$Res>
    implements $ProductEventCopyWith<$Res> {
  factory $SelectPriceRangeEventCopyWith(SelectPriceRangeEvent value,
          $Res Function(SelectPriceRangeEvent) _then) =
      _$SelectPriceRangeEventCopyWithImpl;
  @useResult
  $Res call({String? range});
}

/// @nodoc
class _$SelectPriceRangeEventCopyWithImpl<$Res>
    implements $SelectPriceRangeEventCopyWith<$Res> {
  _$SelectPriceRangeEventCopyWithImpl(this._self, this._then);

  final SelectPriceRangeEvent _self;
  final $Res Function(SelectPriceRangeEvent) _then;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? range = freezed,
  }) {
    return _then(SelectPriceRangeEvent(
      freezed == range
          ? _self.range
          : range // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class SetCustomPriceRangeEvent implements ProductEvent {
  SetCustomPriceRangeEvent({this.min, this.max});

  final String? min;
  final String? max;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetCustomPriceRangeEventCopyWith<SetCustomPriceRangeEvent> get copyWith =>
      _$SetCustomPriceRangeEventCopyWithImpl<SetCustomPriceRangeEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetCustomPriceRangeEvent &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @override
  int get hashCode => Object.hash(runtimeType, min, max);

  @override
  String toString() {
    return 'ProductEvent.setCustomPriceRange(min: $min, max: $max)';
  }
}

/// @nodoc
abstract mixin class $SetCustomPriceRangeEventCopyWith<$Res>
    implements $ProductEventCopyWith<$Res> {
  factory $SetCustomPriceRangeEventCopyWith(SetCustomPriceRangeEvent value,
          $Res Function(SetCustomPriceRangeEvent) _then) =
      _$SetCustomPriceRangeEventCopyWithImpl;
  @useResult
  $Res call({String? min, String? max});
}

/// @nodoc
class _$SetCustomPriceRangeEventCopyWithImpl<$Res>
    implements $SetCustomPriceRangeEventCopyWith<$Res> {
  _$SetCustomPriceRangeEventCopyWithImpl(this._self, this._then);

  final SetCustomPriceRangeEvent _self;
  final $Res Function(SetCustomPriceRangeEvent) _then;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? min = freezed,
    Object? max = freezed,
  }) {
    return _then(SetCustomPriceRangeEvent(
      min: freezed == min
          ? _self.min
          : min // ignore: cast_nullable_to_non_nullable
              as String?,
      max: freezed == max
          ? _self.max
          : max // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class SelectRatingEvent implements ProductEvent {
  SelectRatingEvent(this.rating);

  final double rating;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectRatingEventCopyWith<SelectRatingEvent> get copyWith =>
      _$SelectRatingEventCopyWithImpl<SelectRatingEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectRatingEvent &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rating);

  @override
  String toString() {
    return 'ProductEvent.selectRating(rating: $rating)';
  }
}

/// @nodoc
abstract mixin class $SelectRatingEventCopyWith<$Res>
    implements $ProductEventCopyWith<$Res> {
  factory $SelectRatingEventCopyWith(
          SelectRatingEvent value, $Res Function(SelectRatingEvent) _then) =
      _$SelectRatingEventCopyWithImpl;
  @useResult
  $Res call({double rating});
}

/// @nodoc
class _$SelectRatingEventCopyWithImpl<$Res>
    implements $SelectRatingEventCopyWith<$Res> {
  _$SelectRatingEventCopyWithImpl(this._self, this._then);

  final SelectRatingEvent _self;
  final $Res Function(SelectRatingEvent) _then;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? rating = null,
  }) {
    return _then(SelectRatingEvent(
      null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class ResetFiltersEvent implements ProductEvent {
  ResetFiltersEvent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ResetFiltersEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductEvent.resetFilters()';
  }
}

/// @nodoc

class ApplyFiltersEvent implements ProductEvent {
  ApplyFiltersEvent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ApplyFiltersEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductEvent.applyFilters()';
  }
}

/// @nodoc

class RefreshUiEvent implements ProductEvent {
  RefreshUiEvent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RefreshUiEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductEvent.refreshUi()';
  }
}

/// @nodoc

class FetchBrandsEvent implements ProductEvent {
  const FetchBrandsEvent({this.search});

  final String? search;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FetchBrandsEventCopyWith<FetchBrandsEvent> get copyWith =>
      _$FetchBrandsEventCopyWithImpl<FetchBrandsEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FetchBrandsEvent &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search);

  @override
  String toString() {
    return 'ProductEvent.fetchBrands(search: $search)';
  }
}

/// @nodoc
abstract mixin class $FetchBrandsEventCopyWith<$Res>
    implements $ProductEventCopyWith<$Res> {
  factory $FetchBrandsEventCopyWith(
          FetchBrandsEvent value, $Res Function(FetchBrandsEvent) _then) =
      _$FetchBrandsEventCopyWithImpl;
  @useResult
  $Res call({String? search});
}

/// @nodoc
class _$FetchBrandsEventCopyWithImpl<$Res>
    implements $FetchBrandsEventCopyWith<$Res> {
  _$FetchBrandsEventCopyWithImpl(this._self, this._then);

  final FetchBrandsEvent _self;
  final $Res Function(FetchBrandsEvent) _then;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? search = freezed,
  }) {
    return _then(FetchBrandsEvent(
      search: freezed == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class GetProductDetail implements ProductEvent {
  const GetProductDetail({this.id});

  final String? id;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetProductDetailCopyWith<GetProductDetail> get copyWith =>
      _$GetProductDetailCopyWithImpl<GetProductDetail>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetProductDetail &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'ProductEvent.getProductDetail(id: $id)';
  }
}

/// @nodoc
abstract mixin class $GetProductDetailCopyWith<$Res>
    implements $ProductEventCopyWith<$Res> {
  factory $GetProductDetailCopyWith(
          GetProductDetail value, $Res Function(GetProductDetail) _then) =
      _$GetProductDetailCopyWithImpl;
  @useResult
  $Res call({String? id});
}

/// @nodoc
class _$GetProductDetailCopyWithImpl<$Res>
    implements $GetProductDetailCopyWith<$Res> {
  _$GetProductDetailCopyWithImpl(this._self, this._then);

  final GetProductDetail _self;
  final $Res Function(GetProductDetail) _then;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
  }) {
    return _then(GetProductDetail(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class GetSearchSuggestion implements ProductEvent {
  const GetSearchSuggestion({this.query});

  final String? query;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetSearchSuggestionCopyWith<GetSearchSuggestion> get copyWith =>
      _$GetSearchSuggestionCopyWithImpl<GetSearchSuggestion>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetSearchSuggestion &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'ProductEvent.getSearchSuggestion(query: $query)';
  }
}

/// @nodoc
abstract mixin class $GetSearchSuggestionCopyWith<$Res>
    implements $ProductEventCopyWith<$Res> {
  factory $GetSearchSuggestionCopyWith(
          GetSearchSuggestion value, $Res Function(GetSearchSuggestion) _then) =
      _$GetSearchSuggestionCopyWithImpl;
  @useResult
  $Res call({String? query});
}

/// @nodoc
class _$GetSearchSuggestionCopyWithImpl<$Res>
    implements $GetSearchSuggestionCopyWith<$Res> {
  _$GetSearchSuggestionCopyWithImpl(this._self, this._then);

  final GetSearchSuggestion _self;
  final $Res Function(GetSearchSuggestion) _then;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = freezed,
  }) {
    return _then(GetSearchSuggestion(
      query: freezed == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class ClearSearchSuggestions implements ProductEvent {
  const ClearSearchSuggestions();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ClearSearchSuggestions);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductEvent.clearSearchSuggestions()';
  }
}

/// @nodoc
mixin _$ProductState {
  bool get isLoading;
  List<SearchProduct> get searchProducts;
  Set<String> get selectedBrands;
  String? get selectedPriceRange;
  double? get selectedRating;
  String? get minPrice;
  String? get maxPrice;
  Map<String, dynamic>? get appliedFilters;
  String? get lastQuery;
  List<Brand> get allBrands;
  bool get isBrandLoading;
  ProductDetailData? get productDetail;
  List<SimilarProduct> get similarProducts;
  List<SearchProduct> get searchSuggestions;

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
            const DeepCollectionEquality()
                .equals(other.searchProducts, searchProducts) &&
            const DeepCollectionEquality()
                .equals(other.selectedBrands, selectedBrands) &&
            (identical(other.selectedPriceRange, selectedPriceRange) ||
                other.selectedPriceRange == selectedPriceRange) &&
            (identical(other.selectedRating, selectedRating) ||
                other.selectedRating == selectedRating) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice) &&
            const DeepCollectionEquality()
                .equals(other.appliedFilters, appliedFilters) &&
            (identical(other.lastQuery, lastQuery) ||
                other.lastQuery == lastQuery) &&
            const DeepCollectionEquality().equals(other.allBrands, allBrands) &&
            (identical(other.isBrandLoading, isBrandLoading) ||
                other.isBrandLoading == isBrandLoading) &&
            (identical(other.productDetail, productDetail) ||
                other.productDetail == productDetail) &&
            const DeepCollectionEquality()
                .equals(other.similarProducts, similarProducts) &&
            const DeepCollectionEquality()
                .equals(other.searchSuggestions, searchSuggestions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(searchProducts),
      const DeepCollectionEquality().hash(selectedBrands),
      selectedPriceRange,
      selectedRating,
      minPrice,
      maxPrice,
      const DeepCollectionEquality().hash(appliedFilters),
      lastQuery,
      const DeepCollectionEquality().hash(allBrands),
      isBrandLoading,
      productDetail,
      const DeepCollectionEquality().hash(similarProducts),
      const DeepCollectionEquality().hash(searchSuggestions));

  @override
  String toString() {
    return 'ProductState(isLoading: $isLoading, searchProducts: $searchProducts, selectedBrands: $selectedBrands, selectedPriceRange: $selectedPriceRange, selectedRating: $selectedRating, minPrice: $minPrice, maxPrice: $maxPrice, appliedFilters: $appliedFilters, lastQuery: $lastQuery, allBrands: $allBrands, isBrandLoading: $isBrandLoading, productDetail: $productDetail, similarProducts: $similarProducts, searchSuggestions: $searchSuggestions)';
  }
}

/// @nodoc
abstract mixin class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) _then) =
      _$ProductStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      List<SearchProduct> searchProducts,
      Set<String> selectedBrands,
      String? selectedPriceRange,
      double? selectedRating,
      String? minPrice,
      String? maxPrice,
      Map<String, dynamic>? appliedFilters,
      String? lastQuery,
      List<Brand> allBrands,
      bool isBrandLoading,
      ProductDetailData? productDetail,
      List<SimilarProduct> similarProducts,
      List<SearchProduct> searchSuggestions});
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
    Object? searchProducts = null,
    Object? selectedBrands = null,
    Object? selectedPriceRange = freezed,
    Object? selectedRating = freezed,
    Object? minPrice = freezed,
    Object? maxPrice = freezed,
    Object? appliedFilters = freezed,
    Object? lastQuery = freezed,
    Object? allBrands = null,
    Object? isBrandLoading = null,
    Object? productDetail = freezed,
    Object? similarProducts = null,
    Object? searchSuggestions = null,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchProducts: null == searchProducts
          ? _self.searchProducts
          : searchProducts // ignore: cast_nullable_to_non_nullable
              as List<SearchProduct>,
      selectedBrands: null == selectedBrands
          ? _self.selectedBrands
          : selectedBrands // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      selectedPriceRange: freezed == selectedPriceRange
          ? _self.selectedPriceRange
          : selectedPriceRange // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedRating: freezed == selectedRating
          ? _self.selectedRating
          : selectedRating // ignore: cast_nullable_to_non_nullable
              as double?,
      minPrice: freezed == minPrice
          ? _self.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      maxPrice: freezed == maxPrice
          ? _self.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      appliedFilters: freezed == appliedFilters
          ? _self.appliedFilters
          : appliedFilters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      lastQuery: freezed == lastQuery
          ? _self.lastQuery
          : lastQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      allBrands: null == allBrands
          ? _self.allBrands
          : allBrands // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
      isBrandLoading: null == isBrandLoading
          ? _self.isBrandLoading
          : isBrandLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      productDetail: freezed == productDetail
          ? _self.productDetail
          : productDetail // ignore: cast_nullable_to_non_nullable
              as ProductDetailData?,
      similarProducts: null == similarProducts
          ? _self.similarProducts
          : similarProducts // ignore: cast_nullable_to_non_nullable
              as List<SimilarProduct>,
      searchSuggestions: null == searchSuggestions
          ? _self.searchSuggestions
          : searchSuggestions // ignore: cast_nullable_to_non_nullable
              as List<SearchProduct>,
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
    TResult Function(
            bool isLoading,
            List<SearchProduct> searchProducts,
            Set<String> selectedBrands,
            String? selectedPriceRange,
            double? selectedRating,
            String? minPrice,
            String? maxPrice,
            Map<String, dynamic>? appliedFilters,
            String? lastQuery,
            List<Brand> allBrands,
            bool isBrandLoading,
            ProductDetailData? productDetail,
            List<SimilarProduct> similarProducts,
            List<SearchProduct> searchSuggestions)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductState() when $default != null:
        return $default(
            _that.isLoading,
            _that.searchProducts,
            _that.selectedBrands,
            _that.selectedPriceRange,
            _that.selectedRating,
            _that.minPrice,
            _that.maxPrice,
            _that.appliedFilters,
            _that.lastQuery,
            _that.allBrands,
            _that.isBrandLoading,
            _that.productDetail,
            _that.similarProducts,
            _that.searchSuggestions);
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
    TResult Function(
            bool isLoading,
            List<SearchProduct> searchProducts,
            Set<String> selectedBrands,
            String? selectedPriceRange,
            double? selectedRating,
            String? minPrice,
            String? maxPrice,
            Map<String, dynamic>? appliedFilters,
            String? lastQuery,
            List<Brand> allBrands,
            bool isBrandLoading,
            ProductDetailData? productDetail,
            List<SimilarProduct> similarProducts,
            List<SearchProduct> searchSuggestions)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductState():
        return $default(
            _that.isLoading,
            _that.searchProducts,
            _that.selectedBrands,
            _that.selectedPriceRange,
            _that.selectedRating,
            _that.minPrice,
            _that.maxPrice,
            _that.appliedFilters,
            _that.lastQuery,
            _that.allBrands,
            _that.isBrandLoading,
            _that.productDetail,
            _that.similarProducts,
            _that.searchSuggestions);
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
    TResult? Function(
            bool isLoading,
            List<SearchProduct> searchProducts,
            Set<String> selectedBrands,
            String? selectedPriceRange,
            double? selectedRating,
            String? minPrice,
            String? maxPrice,
            Map<String, dynamic>? appliedFilters,
            String? lastQuery,
            List<Brand> allBrands,
            bool isBrandLoading,
            ProductDetailData? productDetail,
            List<SimilarProduct> similarProducts,
            List<SearchProduct> searchSuggestions)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductState() when $default != null:
        return $default(
            _that.isLoading,
            _that.searchProducts,
            _that.selectedBrands,
            _that.selectedPriceRange,
            _that.selectedRating,
            _that.minPrice,
            _that.maxPrice,
            _that.appliedFilters,
            _that.lastQuery,
            _that.allBrands,
            _that.isBrandLoading,
            _that.productDetail,
            _that.similarProducts,
            _that.searchSuggestions);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProductState implements ProductState {
  const _ProductState(
      {required this.isLoading,
      required final List<SearchProduct> searchProducts,
      required final Set<String> selectedBrands,
      required this.selectedPriceRange,
      required this.selectedRating,
      required this.minPrice,
      required this.maxPrice,
      required final Map<String, dynamic>? appliedFilters,
      required this.lastQuery,
      required final List<Brand> allBrands,
      required this.isBrandLoading,
      required this.productDetail,
      required final List<SimilarProduct> similarProducts,
      required final List<SearchProduct> searchSuggestions})
      : _searchProducts = searchProducts,
        _selectedBrands = selectedBrands,
        _appliedFilters = appliedFilters,
        _allBrands = allBrands,
        _similarProducts = similarProducts,
        _searchSuggestions = searchSuggestions;

  @override
  final bool isLoading;
  final List<SearchProduct> _searchProducts;
  @override
  List<SearchProduct> get searchProducts {
    if (_searchProducts is EqualUnmodifiableListView) return _searchProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchProducts);
  }

  final Set<String> _selectedBrands;
  @override
  Set<String> get selectedBrands {
    if (_selectedBrands is EqualUnmodifiableSetView) return _selectedBrands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedBrands);
  }

  @override
  final String? selectedPriceRange;
  @override
  final double? selectedRating;
  @override
  final String? minPrice;
  @override
  final String? maxPrice;
  final Map<String, dynamic>? _appliedFilters;
  @override
  Map<String, dynamic>? get appliedFilters {
    final value = _appliedFilters;
    if (value == null) return null;
    if (_appliedFilters is EqualUnmodifiableMapView) return _appliedFilters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? lastQuery;
  final List<Brand> _allBrands;
  @override
  List<Brand> get allBrands {
    if (_allBrands is EqualUnmodifiableListView) return _allBrands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allBrands);
  }

  @override
  final bool isBrandLoading;
  @override
  final ProductDetailData? productDetail;
  final List<SimilarProduct> _similarProducts;
  @override
  List<SimilarProduct> get similarProducts {
    if (_similarProducts is EqualUnmodifiableListView) return _similarProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_similarProducts);
  }

  final List<SearchProduct> _searchSuggestions;
  @override
  List<SearchProduct> get searchSuggestions {
    if (_searchSuggestions is EqualUnmodifiableListView)
      return _searchSuggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchSuggestions);
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
            const DeepCollectionEquality()
                .equals(other._searchProducts, _searchProducts) &&
            const DeepCollectionEquality()
                .equals(other._selectedBrands, _selectedBrands) &&
            (identical(other.selectedPriceRange, selectedPriceRange) ||
                other.selectedPriceRange == selectedPriceRange) &&
            (identical(other.selectedRating, selectedRating) ||
                other.selectedRating == selectedRating) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice) &&
            const DeepCollectionEquality()
                .equals(other._appliedFilters, _appliedFilters) &&
            (identical(other.lastQuery, lastQuery) ||
                other.lastQuery == lastQuery) &&
            const DeepCollectionEquality()
                .equals(other._allBrands, _allBrands) &&
            (identical(other.isBrandLoading, isBrandLoading) ||
                other.isBrandLoading == isBrandLoading) &&
            (identical(other.productDetail, productDetail) ||
                other.productDetail == productDetail) &&
            const DeepCollectionEquality()
                .equals(other._similarProducts, _similarProducts) &&
            const DeepCollectionEquality()
                .equals(other._searchSuggestions, _searchSuggestions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_searchProducts),
      const DeepCollectionEquality().hash(_selectedBrands),
      selectedPriceRange,
      selectedRating,
      minPrice,
      maxPrice,
      const DeepCollectionEquality().hash(_appliedFilters),
      lastQuery,
      const DeepCollectionEquality().hash(_allBrands),
      isBrandLoading,
      productDetail,
      const DeepCollectionEquality().hash(_similarProducts),
      const DeepCollectionEquality().hash(_searchSuggestions));

  @override
  String toString() {
    return 'ProductState(isLoading: $isLoading, searchProducts: $searchProducts, selectedBrands: $selectedBrands, selectedPriceRange: $selectedPriceRange, selectedRating: $selectedRating, minPrice: $minPrice, maxPrice: $maxPrice, appliedFilters: $appliedFilters, lastQuery: $lastQuery, allBrands: $allBrands, isBrandLoading: $isBrandLoading, productDetail: $productDetail, similarProducts: $similarProducts, searchSuggestions: $searchSuggestions)';
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
  $Res call(
      {bool isLoading,
      List<SearchProduct> searchProducts,
      Set<String> selectedBrands,
      String? selectedPriceRange,
      double? selectedRating,
      String? minPrice,
      String? maxPrice,
      Map<String, dynamic>? appliedFilters,
      String? lastQuery,
      List<Brand> allBrands,
      bool isBrandLoading,
      ProductDetailData? productDetail,
      List<SimilarProduct> similarProducts,
      List<SearchProduct> searchSuggestions});
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
    Object? searchProducts = null,
    Object? selectedBrands = null,
    Object? selectedPriceRange = freezed,
    Object? selectedRating = freezed,
    Object? minPrice = freezed,
    Object? maxPrice = freezed,
    Object? appliedFilters = freezed,
    Object? lastQuery = freezed,
    Object? allBrands = null,
    Object? isBrandLoading = null,
    Object? productDetail = freezed,
    Object? similarProducts = null,
    Object? searchSuggestions = null,
  }) {
    return _then(_ProductState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchProducts: null == searchProducts
          ? _self._searchProducts
          : searchProducts // ignore: cast_nullable_to_non_nullable
              as List<SearchProduct>,
      selectedBrands: null == selectedBrands
          ? _self._selectedBrands
          : selectedBrands // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      selectedPriceRange: freezed == selectedPriceRange
          ? _self.selectedPriceRange
          : selectedPriceRange // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedRating: freezed == selectedRating
          ? _self.selectedRating
          : selectedRating // ignore: cast_nullable_to_non_nullable
              as double?,
      minPrice: freezed == minPrice
          ? _self.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      maxPrice: freezed == maxPrice
          ? _self.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      appliedFilters: freezed == appliedFilters
          ? _self._appliedFilters
          : appliedFilters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      lastQuery: freezed == lastQuery
          ? _self.lastQuery
          : lastQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      allBrands: null == allBrands
          ? _self._allBrands
          : allBrands // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
      isBrandLoading: null == isBrandLoading
          ? _self.isBrandLoading
          : isBrandLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      productDetail: freezed == productDetail
          ? _self.productDetail
          : productDetail // ignore: cast_nullable_to_non_nullable
              as ProductDetailData?,
      similarProducts: null == similarProducts
          ? _self._similarProducts
          : similarProducts // ignore: cast_nullable_to_non_nullable
              as List<SimilarProduct>,
      searchSuggestions: null == searchSuggestions
          ? _self._searchSuggestions
          : searchSuggestions // ignore: cast_nullable_to_non_nullable
              as List<SearchProduct>,
    ));
  }
}

// dart format on
