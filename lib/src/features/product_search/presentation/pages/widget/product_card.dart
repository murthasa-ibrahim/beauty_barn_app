import 'package:flutter/material.dart';
import 'package:machine_test_superlabs/config/constants/constants.dart';
import 'package:machine_test_superlabs/src/features/product_search/model/product_search_model.dart';

class ProductCard extends StatelessWidget {
  final SearchProduct product;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = (product.thumbnail?.isNotEmpty == true)
        ? product.thumbnail
        : (product.productImages?.isNotEmpty == true
            ? product.productImages![0].image
            : null);

    final price = product.variants?.isNotEmpty == true
        ? product.variants![0].currentPrice
        : product.priceStart;
    final specialPrice = product.variants?.isNotEmpty == true
        ? product.variants![0].specialPrice
        : null;
    final averageRating = product.averageRating?.toStringAsFixed(1);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: imageUrl != null
                    ? Image.network(
                        Uri.encodeFull(imageUrl),
                        width: double.infinity,
                        height: 130,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return SizedBox(
                              height: 130,
                              child: Center(
                                  child: CircularProgressIndicator(
                                      strokeWidth: 2)));
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            const SizedBox(
                          height: 130,
                          child: Center(
                              child: Icon(Icons.image_not_supported, size: 48)),
                        ),
                      )
                    : const SizedBox(
                        height: 130,
                        child: Center(child: Icon(Icons.image, size: 48))),
              ),
              const SizedBox(height: 8),
              Text(
                product.title ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              kHeight5,
              if (product.brand != null)
                Text(
                  product.brand?.title ?? '',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              kHeight5,
              Row(
                children: [
                  if (specialPrice != null && specialPrice < (price ?? 0))
                    Text(
                      "₹${specialPrice.toStringAsFixed(0)}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  if (specialPrice != null && specialPrice < (price ?? 0))
                    const SizedBox(width: 6),
                  Text(
                    "₹${(price ?? 0).toStringAsFixed(0)}",
                    style: TextStyle(
                      fontWeight:
                          specialPrice != null && specialPrice < (price ?? 0)
                              ? FontWeight.normal
                              : FontWeight.bold,
                      color: specialPrice != null && specialPrice < (price ?? 0)
                          ? Colors.grey
                          : Colors.black,
                      decoration:
                          specialPrice != null && specialPrice < (price ?? 0)
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              if (averageRating != null)
                Row(
                  children: [
                    const Icon(Icons.star, size: 14, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(averageRating, style: const TextStyle(fontSize: 12)),
                    const SizedBox(width: 8),
                    Text("${product.ordersCount ?? 0} orders",
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
