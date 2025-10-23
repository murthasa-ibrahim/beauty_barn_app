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
}
