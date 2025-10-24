import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductCardSkeleton extends StatelessWidget {
  const ProductCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 130,
                width: double.infinity,
                color: Colors.white,
              ),
              const SizedBox(height: 8),
              Container(height: 16, width: double.infinity, color: Colors.white),
              const SizedBox(height: 4),
              Container(height: 12, width: 80, color: Colors.white),
              const SizedBox(height: 6),
              Container(height: 16, width: 50, color: Colors.white),
              const SizedBox(height: 6),
              Row(
                children: [
                  Container(height: 14, width: 30, color: Colors.white),
                  const SizedBox(width: 8),
                  Container(height: 14, width: 60, color: Colors.white),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
