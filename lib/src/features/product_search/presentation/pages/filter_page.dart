import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test_superlabs/config/constants/constants.dart';
 import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../bloc/product_bloc/product_bloc.dart';

class ProductFilterPage extends StatefulWidget {
  const ProductFilterPage({super.key});

  @override
  State<ProductFilterPage> createState() => _ProductFilterPageState();
}

class _ProductFilterPageState extends State<ProductFilterPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(ProductEvent.fetchBrands());
  }

  @override
  Widget build(BuildContext context) {
    final brandSearchController = TextEditingController();
    final minPriceController = TextEditingController();
    final maxPriceController = TextEditingController();

    final List<Map<String, dynamic>> priceRanges = [
      {'label': 'Under ₹250', 'min': 0, 'max': 250},
      {'label': '₹250 to ₹500', 'min': 250, 'max': 500},
      {'label': '₹500 to ₹1000', 'min': 500, 'max': 1000},
      {'label': '₹1000 and above', 'min': 1000, 'max': null},
    ];

    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        final bloc = context.read<ProductBloc>();

        return GestureDetector(
          onTap:(){
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(
                "Filters",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              actions: [
                TextButton(
                  onPressed: () {
                    bloc.add(ProductEvent.resetFilters());
                  },
                  child: const Text(
                    "Reset",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(12),
                      children: [
                        // ---- Brand Section ----
                        ExpansionTile(
                          title: Text(
                            "Brand${state.selectedBrands.isNotEmpty ? " (${state.selectedBrands.length})" : ""}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          childrenPadding:
                              const EdgeInsets.symmetric(horizontal: 12),
                          children: [
                            TextField(
                              controller: brandSearchController,
                              decoration: InputDecoration(
                                hintText: "Search brand...",
                                prefixIcon: const Icon(Icons.search, size: 20),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 10,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onChanged: (_) {
                                context
                                    .read<ProductBloc>()
                                    .add(ProductEvent.fetchBrands());
                              },
                            ),
                            const SizedBox(height: 8),
                            ConstrainedBox(
                                constraints: const BoxConstraints(maxHeight: 250),
                                child: BlocBuilder<ProductBloc, ProductState>(
                                  builder: (context, state) {
                                    final bloc = context.read<ProductBloc>();
          
                                    return state.isBrandLoading
                                        ? const Center(
                                            child: CircularProgressIndicator())
                                        : ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: state.allBrands.length,
                                            itemBuilder: (context, index) {
                                              final brand =
                                                  state.allBrands[index];
                                              final isSelected = state
                                                  .selectedBrands
                                                  .contains(brand.title);
                                              return CheckboxListTile(
                                                dense: true,
                                                contentPadding: EdgeInsets.zero,
                                                value: isSelected,
                                                onChanged: (_) {
                                                  bloc.add(
                                                      ProductEvent.toggleBrand(
                                                          brand.title ?? ''));
                                                },
                                                title: Text(brand.title ?? ''),
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                              );
                                            },
                                          );
                                  },
                                )),
                          ],
                        ),
          
                        const Divider(height: 1),
          
                        // ---- Price Section ----
                        ExpansionTile(
                          title: Text(
                            "Price${state.selectedPriceRange != null ? " (1)" : ""}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          childrenPadding:
                              const EdgeInsets.symmetric(horizontal: 12),
                          children: [
                            ...priceRanges.map((range) {
                              return RadioListTile<String>(
                                dense: true,
                                value: range['label']!,
                                groupValue: state.selectedPriceRange,
                                title: Text(range['label']!),
                                activeColor: Colors.black,
                                onChanged: (value) {
                                  bloc.add(ProductEvent.selectPriceRange(value!));
                                  minPriceController.clear();
                                  maxPriceController.clear();
                                },
                              );
                            }).toList(),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: minPriceController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      hintText: "Min",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 10,
                                      ),
                                    ),
                                    onTap: () => bloc
                                        .add(ProductEvent.selectPriceRange(null)),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: TextField(
                                    controller: maxPriceController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      hintText: "Max",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 10,
                                      ),
                                    ),
                                    onTap: () => bloc
                                        .add(ProductEvent.selectPriceRange(null)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  bloc.add(ProductEvent.setCustomPriceRange(
                                    min: minPriceController.text,
                                    max: maxPriceController.text,
                                  ));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 10,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  "Apply",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        kHeight,
          
                        const Divider(height: 1),
          
                        // ---- Rating Section ----
                        ExpansionTile(
                          title: Text(
                            "Rating${state.selectedRating != null ? " (${state.selectedRating?.toStringAsFixed(1)})" : ""}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          childrenPadding:
                              const EdgeInsets.symmetric(horizontal: 12),
                          children: [
                            Column(
                              children: List.generate(5, (index) {
                                final rating = 5 - index;
                                return ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: RatingBarIndicator(
                                    rating: rating.toDouble(),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 18,
                                    unratedColor: Colors.grey.shade300,
                                  ),
                                  title: Text("$rating Stars & Up"),
                                  trailing: Radio<double>(
                                    value: rating.toDouble(),
                                    groupValue: state.selectedRating,
                                    activeColor: Colors.black,
                                    onChanged: (value) {
                                      bloc.add(
                                          ProductEvent.selectRating(value!));
                                    },
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          
                  // ---- Bottom Buttons ----
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.05),
                          offset: const Offset(0, -2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              bloc.add(ProductEvent.resetFilters());
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.black),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text("Clear All"),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              bloc.add(ProductEvent.applyFilters());
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              "Apply Filters",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
