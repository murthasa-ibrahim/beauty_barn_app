import 'package:flutter/material.dart';

import '../../../../../../config/constants/constants.dart';
import '../../../model/product_detail_model.dart' show ProductDetailData;
import '../../bloc/product_bloc/product_bloc.dart';

class SimilarProductsWidget extends StatelessWidget {
  const SimilarProductsWidget({
    super.key,
    required this.state,
    required this.product,
  });

  final ProductState state;
  final ProductDetailData product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Similar Products",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 250,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.similarProducts.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final p = state.similarProducts[index];
                final price = product.variants?.isNotEmpty == true
                    ? product.variants![0].currentPrice
                    : product.priceStart;
                return SizedBox(
                  width: 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
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
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      kHeight5,
                      Text(
                        "₹${price ?? ''}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
