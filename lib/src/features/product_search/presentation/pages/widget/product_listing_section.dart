import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../config/constants/constants.dart' show kWhiteSpace;
import '../../../../../../config/routes/routes.dart';
import '../../bloc/product_bloc/product_bloc.dart';
import 'product_card.dart';
import 'product_place_holder.dart';
import 'search_product_shimmer.dart';

class ProductListingSection extends StatelessWidget {
  const ProductListingSection({
    super.key,
    required this.productScrollCtrl,
  });

  final ScrollController? productScrollCtrl;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.isLoading) {
            return GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.6,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return const ProductCardSkeleton();
              },
            );
          } else if (state.searchProducts.isNotEmpty) {
            return GridView.builder(
              controller: productScrollCtrl,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.6,
              ),
              itemCount: state.searchProducts.length + 1,
              itemBuilder: (context, index) {
                if (index < state.searchProducts.length) {
                  return ProductCard(
                    product: state.searchProducts[index],
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      context.read<ProductBloc>().add(
                          ProductEvent.getProductDetail(
                              id: state.searchProducts[index].handle));
                      context.read<ProductBloc>().add(
                          ProductEvent.getSimilarProductsEvent(
                              productId: state.searchProducts[index].id ?? ''));

                      Future.microtask(
                          () => context.push(Routes.productDetail));
                    },
                  );
                } else {
                  return state.haseMoreProduct && index > 5
                      ? Align(
                          alignment: Alignment.center,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Center(
                              child: CupertinoActivityIndicator(),
                            ),
                          ),
                        )
                      : kWhiteSpace;
                }
              },
            );
          } else {
            return ProductPlaceHolderWidget();
          }
        },
      ),
    );
  }
}
