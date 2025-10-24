// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:machine_test_superlabs/src/features/product_search/model/product_detail_model.dart';

// import '../bloc/product_bloc/product_bloc.dart';

// class ProductDetailPage extends StatelessWidget {
//   const ProductDetailPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ProductBloc, ProductState>(
//       builder: (context, state) {
//         final product = state.productDetail;
//         return Scaffold(
//           backgroundColor: Colors.white,
//           appBar: AppBar(
//             title: Text(
//               product?.title ?? '',
//               style: const TextStyle(fontWeight: FontWeight.w600),
//             ),
//             centerTitle: true,
//           ),
//           body: _ProductDetailContent(product: product),
//         );
//       },
//     );
//   }
// }

// class _ProductDetailContent extends StatelessWidget {
//   final ProductDetailData? product;

//   const _ProductDetailContent({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final images = product?.productImages ?? [];
//     final variant = (product?.variants?.isNotEmpty ?? false)
//         ? product?.variants!.first
//         : null;
//     final price =
//         variant?.specialPrice ?? variant?.price ?? product?.priceStart;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.only(bottom: 80),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Product Images Carousel
//           if (images.isNotEmpty)
//             SizedBox(
//               height: 350,
//               child: PageView.builder(
//                 itemCount: images.length,
//                 itemBuilder: (context, index) {
//                   final img = images[index].image ?? '';
//                   return Image.network(
//                     "https://api.stryce.com/$img",
//                     fit: BoxFit.cover,
//                     errorBuilder: (_, __, ___) => const Icon(Icons.image),
//                   );
//                 },
//               ),
//             )
//           else
//             Image.network(
//               "https://api.stryce.com/${product?.thumbnail ?? ''}",
//               height: 350,
//               width: double.infinity,
//               fit: BoxFit.cover,
//               errorBuilder: (_, __, ___) => const Icon(Icons.image),
//             ),

//           const SizedBox(height: 16),

//           // Title and Brand
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Text(
//               product?.title ?? '',
//               style: theme.textTheme.headlineSmall
//                   ?.copyWith(fontWeight: FontWeight.bold),
//             ),
//           ),
//           if (product?.brand != null)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//               child: Text(
//                 "by ${product?.brand!.title}",
//                 style: theme.textTheme.bodyMedium?.copyWith(
//                   color: Colors.grey[700],
//                 ),
//               ),
//             ),

//           const SizedBox(height: 8),

//           // Price Section
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               children: [
//                 Text(
//                   "₹${price?.toStringAsFixed(0) ?? ''}",
//                   style: theme.textTheme.titleLarge?.copyWith(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 if (variant?.specialPrice != null)
//                   Padding(
//                     padding: const EdgeInsets.only(left: 8),
//                     child: Text(
//                       "₹${variant?.price?.toStringAsFixed(0) ?? ''}",
//                       style: const TextStyle(
//                         decoration: TextDecoration.lineThrough,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 12),

//           // Description (HTML)
//           if ((product?.description ?? '').isNotEmpty)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Html(
//                 data: product?.description!,
//                 style: {
//                   'p': Style(fontSize: FontSize.medium),
//                   'strong': Style(fontWeight: FontWeight.bold),
//                 },
//               ),
//             ),

//           const SizedBox(height: 16),

//           // Tabs Section
//           if ((product?.tabs ?? []).isNotEmpty)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   for (final tab in product!.tabs!)
//                     ExpansionTile(
//                       tilePadding: EdgeInsets.zero,
//                       title: Text(
//                         tab.title ?? '',
//                         style: theme.textTheme.titleMedium?.copyWith(
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       children: [
//                         Html(
//                           data: tab.content ?? '',
//                           style: {
//                             'p': Style(fontSize: FontSize.medium),
//                             'strong': Style(
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.black87),
//                           },
//                         ),
//                       ],
//                     ),
//                 ],
//               ),
//             ),

//           const SizedBox(height: 24),

//           // Breadcrumb
//           if ((product?.breadCrumbs ?? []).isNotEmpty)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Wrap(
//                 spacing: 6,
//                 runSpacing: -6,
//                 children: product!.breadCrumbs!
//                     .map((b) => Chip(
//                           label: Text(b.label ?? ''),
//                           backgroundColor: Colors.grey[100],
//                         ))
//                     .toList(),
//               ),
//             ),

//           const SizedBox(height: 100),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:machine_test_superlabs/config/constants/constants.dart';
import 'package:machine_test_superlabs/src/features/product_search/model/product_detail_model.dart';
import '../bloc/product_bloc/product_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProductBloc>();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   bloc.add(ProductEvent.getSimilarProducts(productId));
    // });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Product Details'),
        centerTitle: true,
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          final product = state.productDetail;
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
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
    final bloc = context.read<ProductBloc>();
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
              // 🔹 Image Carousel
              if (images.isNotEmpty)
                SizedBox(
                  height: 350,
                  child: PageView.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      final img = images[index].image ?? '';
                      return Image.network(
                        "https://api.stryce.com/$img",
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.broken_image, size: 100),
                      );
                    },
                  ),
                )
              else
                Image.network(
                  "https://api.stryce.com/${product.thumbnail ?? ''}",
                  height: 350,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.broken_image, size: 100),
                ),

              const SizedBox(height: 16),

              // 🔹 Title + Brand
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  product.title ?? '',
                  style: theme.textTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              if (product.brand != null)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Text(
                    "by ${product.brand!.title}",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[700],
                    ),
                  ),
                ),

              const SizedBox(height: 12),

              // 🔹 Price, Rating, Discount
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      "₹${price?.toStringAsFixed(0) ?? ''}",
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (variant?.specialPrice != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          "₹${variant?.price?.toStringAsFixed(0) ?? ''}",
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    if (discount != null)
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "-$discount%",
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    const Spacer(),
                    if (rating > 0)
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const SizedBox(width: 4),
                          Text(rating.toStringAsFixed(1)),
                        ],
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              if ((product.description ?? '').isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Html(data: product.description!),
                ),

              const SizedBox(height: 16),

              // 🔹 Tabs
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

              const SizedBox(height: 16),

              state.similarProducts.isEmpty
                  ? kWhiteSpace
                  : Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Similar Products",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          // const SizedBox(height: 12),
                          // if (state.isSimilarLoading)
                          //   const Center(child: CircularProgressIndicator())
                          // else if (state.similarProducts.isEmpty)
                          //   const Text("No similar products found.")
                          //  else
                          SizedBox(
                            height: 250,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.similarProducts.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(width: 12),
                              itemBuilder: (context, index) {
                                final p = state.similarProducts[index];
                                final price =
                                    product.variants?.isNotEmpty == true
                                        ? product.variants![0].currentPrice
                                        : product.priceStart;
                                return SizedBox(
                                  width: 160,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 1,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            "https://api.stryce.com/${p.thumbnail ?? ''}",
                                            fit: BoxFit.cover,
                                            errorBuilder: (_, __, ___) =>
                                                const Icon(Icons.image),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        p.title ?? '',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "₹${price ?? ''}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

              const SizedBox(height: 100),
            ],
          ),
        ),

        // 🔹 Add to Cart Button
        Positioned(
          bottom: 10,
          left: 16,
          right: 16,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Added to cart')),
              );
            },
            child: const Text(
              "Add to Cart",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  int? _calculateDiscount(double? original, double? special) {
    if (original == null || special == null || original == 0) return null;
    final discount = ((original - special) / original) * 100;
    return discount.round();
  }
}
