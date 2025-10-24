import 'package:flutter/material.dart';
import 'package:machine_test_superlabs/config/constants/constants.dart';
import 'package:machine_test_superlabs/config/theme/text_styles.dart';

class ProductPlaceHolderWidget extends StatelessWidget {
  const ProductPlaceHolderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_rounded,
              size: 72,
              color: Colors.grey.shade400,
            ),
            kHeight20,
            Text(
              "Search for products",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade800,
                letterSpacing: 0.3,
              ),
            ),
            kHeight,
            Text(
              "Discover your next favorite skincare or beauty essential.",
              textAlign: TextAlign.center,
              style: AppTextStyles.caption.copyWith(
                fontSize: 14,
                color: Colors.grey.shade600,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
