
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:machine_test_superlabs/config/constants/app_colors.dart' show AppColors;

import '../../../../../../config/constants/constants.dart';
import '../../../model/product_detail_model.dart';

class TitleAndDescription extends StatelessWidget {
  const TitleAndDescription({
    super.key,
    required this.product,
    required this.theme,
    required this.price,
    required this.variant,
    required this.discount,
    required this.rating,
  });

  final ProductDetailData product;
  final ThemeData theme;
  final double? price;
  final ProductVariant? variant;
  final int? discount;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            padding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 4),
            child: Text(
              "by ${product.brand!.title}",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey[700],
              ),
            ),
          ),
        const SizedBox(height: 12),
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
                      color: AppColors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              const Spacer(),
              if (rating > 0)
                Row(
                  children: [
                    const Icon(Icons.star,
                        color: AppColors.amber, size: 18),
                    const SizedBox(width: 4),
                    Text(rating.toStringAsFixed(1)),
                  ],
                ),
            ],
          ),
        ),
        kHeight15,
        if ((product.description ?? '').isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Html(data: product.description!),
          ),
      ],
    );
  }
}
