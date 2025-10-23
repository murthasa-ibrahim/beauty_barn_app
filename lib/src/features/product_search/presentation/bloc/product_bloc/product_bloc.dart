import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:machine_test_superlabs/src/features/product_search/data/product_search_repo.dart';
import 'package:machine_test_superlabs/src/features/product_search/model/product_search_model.dart';
import 'package:machine_test_superlabs/src/utils/logger/app_logger.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState.initial()) {
    on<SearchProductsEvent>(_onSearch);

    // 🔹 Filter event handlers
    on<ToggleBrandEvent>(_onToggleBrand);
    on<SelectPriceRangeEvent>(_onSelectPriceRange);
    on<SetCustomPriceRangeEvent>(_onSetCustomPriceRange);
    on<SelectRatingEvent>(_onSelectRating);
    on<ResetFiltersEvent>(_onResetFilters);
    on<ApplyFiltersEvent>(_onApplyFilters);
    on<RefreshUiEvent>(_onRefreshUi);
  }

  final repo = ProductRepo();

  // 🔸 Search products
  Future<void> _onSearch(
    SearchProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final res = await repo.searchProducts(query: event.query);

      if (res?.products?.isNotEmpty ?? false) {
        AppLogger.i("✅ Found ${res?.products?.length} products");
      } else {
        AppLogger.w("No products found for query: ${event.query}");
      }

      emit(state.copyWith(
        isLoading: false,
        searchProducts: res?.products ?? [],
        appliedFilters: state.appliedFilters,
      ));
    } catch (e, s) {
      AppLogger.trace(e, s);
      emit(state.copyWith(isLoading: false));
    }
  }

  // 🔸 Brand selection (multi-select)
  void _onToggleBrand(ToggleBrandEvent event, Emitter<ProductState> emit) {
    final newBrands = Set<String>.from(state.selectedBrands);
    if (newBrands.contains(event.brand)) {
      newBrands.remove(event.brand);
    } else {
      newBrands.add(event.brand);
    }
    emit(state.copyWith(selectedBrands: newBrands));
  }

  // 🔸 Price range selection
  void _onSelectPriceRange(
      SelectPriceRangeEvent event, Emitter<ProductState> emit) {
    emit(state.copyWith(
      selectedPriceRange: event.range,
      minPrice: null,
      maxPrice: null,
    ));
  }

  // 🔸 Custom price range (from text fields)
  void _onSetCustomPriceRange(
      SetCustomPriceRangeEvent event, Emitter<ProductState> emit) {
    emit(state.copyWith(
      selectedPriceRange: null,
      minPrice: event.min,
      maxPrice: event.max,
    ));
  }

  // 🔸 Rating selection
  void _onSelectRating(SelectRatingEvent event, Emitter<ProductState> emit) {
    emit(state.copyWith(selectedRating: event.rating));
  }

  // 🔸 Reset filters
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

  // 🔸 Apply filters (trigger backend call if needed)

 Future<void> _onApplyFilters(
    ApplyFiltersEvent event, Emitter<ProductState> emit) async {
  emit(state.copyWith(isLoading: true));

  // Build API-ready filter query params
  final Map<String, dynamic> apiFilters = {};

  if (state.selectedBrands.isNotEmpty) {
    apiFilters['brands'] = state.selectedBrands.toList();
  }

  if (state.selectedPriceRange != null) {
    // Convert predefined ranges into minPrice/maxPrice
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
    // Custom price input
    if (state.minPrice != null) apiFilters['minPrice'] = state.minPrice;
    if (state.maxPrice != null) apiFilters['maxPrice'] = state.maxPrice;
  }

  if (state.selectedRating != null) {
    apiFilters['minRating'] = state.selectedRating;
  }

  // You can add attributes, tags, sortBy here if needed

  try {
    final res = await repo.searchProducts(
      query: state.lastQuery??'',
      page: 1,
      limit: 10,
      brands: apiFilters['brands']?.cast<String>(),
      minPrice: apiFilters['minPrice']?.toDouble(),
      maxPrice: apiFilters['maxPrice']?.toDouble(),
      minRating: apiFilters['minRating']?.toDouble(),
      // Add categories, collections, attributes, tag, sortBy if implemented
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
}
