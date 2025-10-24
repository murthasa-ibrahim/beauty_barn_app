import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:machine_test_superlabs/config/constants/app_colors.dart';
import 'package:machine_test_superlabs/config/constants/constants.dart';
import 'package:machine_test_superlabs/src/features/product_search/model/product_detail_model.dart';
import '../bloc/product_bloc/product_bloc.dart';
import 'widget/add_to_cart_button.dart';
import 'widget/image_section.dart';
import 'widget/product_detail_shimmer.dart';
import 'widget/similar_product_widget.dart';
import 'widget/title_and_description.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          final product = state.productDetail;
          if (state.productDetailLoading) {
            return ProductDetailShimmer();
          }
          if (product == null) {
            return const Center(child: Text('Product not found'));
          }

          return _ProductDetailContent(product: product);
        },
      ),
    );
  }
}

class _ProductDetailContent extends StatelessWidget {
  final ProductDetailData product;
  const _ProductDetailContent({required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = context.watch<ProductBloc>().state;
    final images = product.productImages ?? [];
    final variant = (product.variants?.isNotEmpty ?? false)
        ? product.variants!.first
        : null;
    final price = variant?.specialPrice ?? variant?.price ?? product.priceStart;
    final rating = product.averageRating ?? 0;
    final discount = _calculateDiscount(variant?.price, variant?.specialPrice);

    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSection(images: images, product: product),
              TitleAndDescription(
                  product: product,
                  theme: theme,
                  price: price,
                  variant: variant,
                  discount: discount,
                  rating: rating),
              kHeight15,
              if ((product.tabs ?? []).isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final tab in product.tabs!)
                        ExpansionTile(
                          tilePadding: EdgeInsets.zero,
                          title: Text(
                            tab.title ?? '',
                            style: theme.textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          children: [
                            Html(data: tab.content ?? ''),
                          ],
                        ),
                    ],
                  ),
                ),
              kHeight15,
              state.similarProducts.isEmpty
                  ? kWhiteSpace
                  : SimilarProductsWidget(state: state, product: product),
              const SizedBox(height: 100),
            ],
          ),
        ),
        AddToCartButton(),
      ],
    );
  }

  int? _calculateDiscount(double? original, double? special) {
    if (original == null || special == null || original == 0) return null;
    final discount = ((original - special) / original) * 100;
    return discount.round();
  }
}
