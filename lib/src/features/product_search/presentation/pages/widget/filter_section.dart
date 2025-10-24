import 'package:flutter/material.dart';

import 'filter_chip_widget.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: const [
                FilterChipWidget(
                    label: 'Brand', icon: Icons.store_mall_directory),
                FilterChipWidget(
                    label: 'Rating', icon: Icons.category_outlined),
                FilterChipWidget(label: 'Price', icon: Icons.currency_rupee),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
