import 'package:flutter/material.dart';

import '../../../../../../config/constants/app_colors.dart' show AppColors;

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 16,
      right: 16,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.black,
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
          style: TextStyle(color: AppColors.white, fontSize: 16),
        ),
      ),
    );
  }
}
