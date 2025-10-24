import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:machine_test_superlabs/src/features/product_search/data/product_search_repo.dart';
import 'package:machine_test_superlabs/src/features/product_search/model/brand_model.dart';
import 'package:machine_test_superlabs/src/features/product_search/model/product_detail_model.dart';
import 'package:machine_test_superlabs/src/features/product_search/model/product_search_model.dart';
import 'package:machine_test_superlabs/src/features/product_search/model/similar_product.dart';
import 'package:machine_test_superlabs/src/utils/logger/app_logger.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepo repo = ProductRepo();

  ProductBloc() : super(ProductState.initial()) {
    on<SearchProductsEvent>(_onSearch);
    on<ToggleBrandEvent>(_onToggleBrand);
    on<SelectPriceRangeEvent>(_onSelectPriceRange);
    on<SetCustomPriceRangeEvent>(_onSetCustomPriceRange);
    on<SelectRatingEvent>(_onSelectRating);
    on<ResetFiltersEvent>(_onResetFilters);
    on<ApplyFiltersEvent>(_onApplyFilters);
    on<RefreshUiEvent>(_onRefreshUi);
    on<FetchBrandsEvent>(_onFetchBrands);
    on<GetProductDetail>(_onFetchProductDetail);
    on<GetSimilarProductsEvent>(_getSimilarProduct);
    on<GetSearchSuggestion>(_getSuggestion);
    on<ClearSearchSuggestions>(_clearSuggestions);
    on<ProductListPagination>(_productPagination);
  }

  Future<void> _onSearch(
      SearchProductsEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      emit(state.copyWith(pageProduct: 1, haseMoreProduct: true));
      final res = await repo.searchProducts(
        query: event.query,
        page: 1,
        limit: 10,
      );

      emit(state.copyWith(
        isLoading: false,
        searchProducts: res?.products ?? [],
        lastQuery: event.query,
      ));
    } catch (e, s) {
      AppLogger.trace(e, s);
      emit(state.copyWith(isLoading: false));
    }
  }

  void _onToggleBrand(ToggleBrandEvent event, Emitter<ProductState> emit) {
    final newBrands = Set<String>.from(state.selectedBrands);
    if (newBrands.contains(event.brand)) {
      newBrands.remove(event.brand);
    } else {
      newBrands.add(event.brand);
    }
    emit(state.copyWith(selectedBrands: newBrands));
  }

  void _onSelectPriceRange(
      SelectPriceRangeEvent event, Emitter<ProductState> emit) {
    emit(state.copyWith(
      selectedPriceRange: event.range,
      minPrice: null,
      maxPrice: null,
    ));
  }

  void _onSetCustomPriceRange(
      SetCustomPriceRangeEvent event, Emitter<ProductState> emit) {
    emit(state.copyWith(
      selectedPriceRange: null,
      minPrice: event.min,
      maxPrice: event.max,
    ));
  }

  void _onSelectRating(SelectRatingEvent event, Emitter<ProductState> emit) {
    emit(state.copyWith(selectedRating: event.rating));
  }

  void _onResetFilters(ResetFiltersEvent event, Emitter<ProductState> emit) {
    emit(state.copyWith(
      selectedBrands: {},
      selectedPriceRange: null,
      selectedRating: null,
      minPrice: null,
      maxPrice: null,
      appliedFilters: {},
    ));
  }

  Future<void> _onApplyFilters(
      ApplyFiltersEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(isLoading: true));

    final Map<String, dynamic> apiFilters = {};

    if (state.selectedBrands.isNotEmpty) {
      apiFilters['brands'] = state.selectedBrands.toList();
    }

    if (state.selectedPriceRange != null) {
      switch (state.selectedPriceRange) {
        case 'Under ₹250':
          apiFilters['maxPrice'] = 250;
          break;
        case '₹250 to ₹500':
          apiFilters['minPrice'] = 250;
          apiFilters['maxPrice'] = 500;
          break;
        case '₹500 to ₹1000':
          apiFilters['minPrice'] = 500;
          apiFilters['maxPrice'] = 1000;
          break;
        case '₹1000 and above':
          apiFilters['minPrice'] = 1000;
          break;
      }
    } else {
      if (state.minPrice != null) apiFilters['minPrice'] = state.minPrice;
      if (state.maxPrice != null) apiFilters['maxPrice'] = state.maxPrice;
    }

    // Rating
    if (state.selectedRating != null) {
      apiFilters['minRating'] = state.selectedRating;
    }

    try {
      final res = await repo.searchProducts(
        query: state.lastQuery ?? '',
        page: 1,
        limit: 10,
        brands: apiFilters['brands']?.cast<String>(),
        minPrice: apiFilters['minPrice'].toString(),
        maxPrice: apiFilters['maxPrice'].toString(),
        minRating: apiFilters['minRating']?.toDouble(),
      );

      emit(state.copyWith(
        isLoading: false,
        searchProducts: res?.products ?? [],
        appliedFilters: apiFilters,
      ));
    } catch (e, s) {
      AppLogger.trace(e, s);
      emit(state.copyWith(isLoading: false));
    }
  }

  void _onRefreshUi(RefreshUiEvent event, Emitter<ProductState> emit) {
    emit(state.copyWith());
  }

  Future<void> _onFetchBrands(
    FetchBrandsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(isBrandLoading: true));
    try {
      final brands = await repo.fetchBrands(search: event.search);
      emit(state.copyWith(
        isBrandLoading: false,
        allBrands: brands ?? [],
      ));
    } catch (e, s) {
      AppLogger.trace(e, s);
      emit(state.copyWith(isBrandLoading: false));
    }
  }

  Future<void> _onFetchProductDetail(
    GetProductDetail event,
    Emitter<ProductState> emit,
  ) async {
    try {
      emit(state.copyWith(productDetailLoading: true, productDetail: null));
      final product = await repo.getProductByHandler(event.id ?? '');
      emit(state.copyWith(
        productDetailLoading: false,
        productDetail: product,
      ));
    } catch (e, s) {
      emit(state.copyWith(productDetailLoading: false));
      AppLogger.trace(e, s);
    }
  }

  Future<void> _getSimilarProduct(
    GetSimilarProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    try {
      final similarProduct = await repo.getSimilarProducts(event.productId);
      emit(state.copyWith(
        similarProducts: similarProduct ?? [],
      ));
    } catch (e, s) {
      AppLogger.trace(e, s);
    }
  }

  Future<void> _getSuggestion(
    GetSearchSuggestion event,
    Emitter<ProductState> emit,
  ) async {
    try {
      if ((event.query?.length ?? 0) < 3) return;
      final suggestion = await repo.getSuggestions(event.query ?? '');
      emit(state.copyWith(
        searchSuggestions: suggestion?.data?.products ?? [],
      ));
    } catch (e, s) {
      AppLogger.trace(e, s);
    }
  }

  void _clearSuggestions(
    ClearSearchSuggestions event,
    Emitter<ProductState> emit,
  ) {
    emit(state.copyWith(searchSuggestions: []));
  }

  _productPagination(
      ProductListPagination event, Emitter<ProductState> emit) async {
    try {
      emit(state.copyWith(
        pageProduct: state.pageProduct + 1,
      ));
      final response = await repo.searchProducts(
        page: state.pageProduct,
        query: state.lastQuery ?? '',
      );
      if (response != null) {
        AppLogger.d("inside not null---------------");
        List<SearchProduct> newList = List.from(state.searchProducts);

        newList.addAll(response.products ?? []);
        if (response.products?.isEmpty ?? false) {
          AppLogger.d("making false---------------");
          return emit(state.copyWith(haseMoreProduct: false));
        }

        return emit(state.copyWith(searchProducts: newList));
      } else {
        return emit(state.copyWith(haseMoreProduct: false));
      }
    } catch (e) {
      AppLogger.e(e);

      return emit(state.copyWith(haseMoreProduct: false));
    }
  }
}
