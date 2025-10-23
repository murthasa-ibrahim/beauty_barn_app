part of 'product_bloc.dart';

@freezed
abstract class ProductState with _$ProductState {
  const factory ProductState({
    required bool isLoading,
    required List<Product> products
  }) = _ProductState;

  factory ProductState.initial() => const ProductState(isLoading: false,products: []);
}
