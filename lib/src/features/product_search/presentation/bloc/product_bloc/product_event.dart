part of 'product_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent {
  factory ProductEvent.searchProductsEvent({
    required String query,
  }) = SearchProductsEvent;

  factory ProductEvent.getProductDetailEvent({
    required String handler,
  }) = GetProductDetailEvent;

  factory ProductEvent.getSimilarProductsEvent({
    required String productId,
  }) = GetSimilarProductsEvent;

  factory ProductEvent.toggleBrand(String brand) = ToggleBrandEvent;
  factory ProductEvent.selectPriceRange(String? range) = SelectPriceRangeEvent;
  factory ProductEvent.setCustomPriceRange({String? min, String? max}) =
      SetCustomPriceRangeEvent;
  factory ProductEvent.selectRating(double rating) = SelectRatingEvent;
  factory ProductEvent.resetFilters() = ResetFiltersEvent;
  factory ProductEvent.applyFilters() = ApplyFiltersEvent;
  factory ProductEvent.refreshUi() = RefreshUiEvent;
  const factory ProductEvent.fetchBrands({String? search}) = FetchBrandsEvent;
  const factory ProductEvent.getProductDetail({String? id}) = GetProductDetail;
}
