part of 'product_bloc.dart';

@freezed
abstract class ProductState with _$ProductState {
  const factory ProductState({
    required bool isLoading,
    required List<SearchProduct> searchProducts,
    required Set<String> selectedBrands,
    required String? selectedPriceRange,
    required double? selectedRating,
    required String? minPrice,
    required String? maxPrice,
    required Map<String, dynamic>? appliedFilters,
    required String? lastQuery,
  }) = _ProductState;

  factory ProductState.initial() => const ProductState(
        isLoading: false,
        searchProducts: [],
        selectedBrands: {},
        selectedPriceRange: null,
        selectedRating: null,
        minPrice: null,
        maxPrice: null,
        appliedFilters: {},
        lastQuery:null,
      );
}
