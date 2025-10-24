
import 'package:flutter/material.dart';

import '../../../../../../config/constants/constants.dart';
import '../../../model/product_detail_model.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
    required this.images,
    required this.product,
  });

  final List<ProductImage> images;
  final ProductDetailData product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        kHeight15,
      ],
    );
  }
}
