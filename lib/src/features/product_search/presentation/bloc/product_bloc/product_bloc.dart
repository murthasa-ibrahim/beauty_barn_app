import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:machine_test_superlabs/src/features/product_search/data/product_search_repo.dart';
import 'package:machine_test_superlabs/src/features/product_search/model/product_model.dart';
import 'package:machine_test_superlabs/src/utils/logger/app_logger.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState.initial()) {
    on<SearchProductsEvent>(_onSearch);
    // on<GetProductDetailEvent>(_onGetProductDetail);
    // on<GetSimilarProductsEvent>(_onGetSimilar);
  }
  final repo = ProductRepo();
  Future<void> _onSearch(
    SearchProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: true,
    ));

    try {
      final products = await repo.searchProducts(query: event.query);
      emit(state.copyWith(isLoading: false, products: products ?? []));
    } catch (e, s) {
      AppLogger.trace(e, s);
      emit(state.copyWith(
        isLoading: false,
      ));
    }
  }

  // Future<void> _onGetProductDetail(
  //   GetProductDetailEvent event,
  //   Emitter<ProductState> emit,
  // ) async {
  //   emit(state.copyWith(isLoading: true, selectedProduct: null));
  //   try {
  //     final product = await repo.getProductByHandler(event.handler);
  //     emit(state.copyWith(isLoading: false, selectedProduct: product));
  //   } catch (e, s) {
  //     AppLogger.trace(e, s);
  //     emit(state.copyWith(isLoading: false, error: e.toString()));
  //   }
  // }

  // Future<void> _onGetSimilar(
  //   GetSimilarProductsEvent event,
  //   Emitter<ProductState> emit,
  // ) async {
  //   try {
  //     final similar = await repo.getSimilarProducts(event.productId);
  //     emit(state.copyWith(similarProducts: similar ?? []));
  //   } catch (e, s) {
  //     AppLogger.trace(e, s);
  //   }
  // }
}
