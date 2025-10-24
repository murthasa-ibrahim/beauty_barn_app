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
    required List<Brand> allBrands,
    required bool isBrandLoading,
    required ProductDetailData? productDetail,
    required List<SimilarProduct> similarProducts,
    required List<SearchProduct> searchSuggestions,
    required int pageProduct,
    required bool haseMoreProduct,
     required bool productDetailLoading,
    
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
        lastQuery: null,
        allBrands: [],
        isBrandLoading: false,
        productDetail: null,
        similarProducts: [],
        searchSuggestions: [],
        pageProduct: 1,
        haseMoreProduct: true,
        productDetailLoading:false,
       
      );
}
