import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test_superlabs/src/features/product_search/model/product_search_model.dart';
import 'package:machine_test_superlabs/src/features/product_search/presentation/pages/filter_page.dart';
import '../bloc/product_bloc/product_bloc.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final List<String> categories = [
    'Makeup',
    'Skincare',
    'Hair',
    'Fragrance',
    'Tools',
  ];

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    String selectedCategory = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Products"),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductFilterPage(),
              ));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Search products...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onSubmitted: (value) {
                context
                    .read<ProductBloc>()
                    .add(ProductEvent.searchProductsEvent(query: value));
              },
            ),
          ),

          // Categories Row
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = category == selectedCategory;

                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      selectedCategory = selected ? category : '';
                      context.read<ProductBloc>().add(
                            ProductEvent.searchProductsEvent(
                              query: category.toLowerCase(),
                            ),
                          );
                    },
                  ),
                );
              },
            ),
          ),

          // Filters Row
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: const [
                FilterChipWidget(label: 'Brand'),
                FilterChipWidget(label: 'Product Type'),
                FilterChipWidget(label: 'Skin Concern'),
                FilterChipWidget(label: 'Skin Type'),
                FilterChipWidget(label: 'Price'),
              ],
            ),
          ),

          // Products Grid
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.searchProducts.isNotEmpty) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.65, // adjust card height
                    ),
                    itemCount: state.searchProducts.length,
                    itemBuilder: (context, index) {
                      final product = state.searchProducts[index];
                      return ProductCard(
                        product: product,
                        onTap: () {
                          // Navigate to Product Page
                        },
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("Search for products..."));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Filter Chip Widget
class FilterChipWidget extends StatelessWidget {
  final String label;

  const FilterChipWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ActionChip(
        label: Text(label),
        onPressed: () {
          // Open filter modal for this filter
        },
      ),
    );
  }
}

// ProductCard for Grid
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
    final imageUrl = product.thumbnail?.isNotEmpty == true
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
              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: imageUrl != null
                    ? Image.network(
                        imageUrl,
                        width: double.infinity,
                        height: 120,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.image_not_supported, size: 80),
                      )
                    : const Icon(Icons.image, size: 80),
              ),
              const SizedBox(height: 8),
              // Title
              Text(
                product.title ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              // Brand
              if (product.brand != null)
                Text(
                  product.brand?.title ?? '',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              const SizedBox(height: 4),
              // Price
              Row(
                children: [
                  if (specialPrice != null && specialPrice < (price ?? 0))
                    Text(
                      "\$$specialPrice",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  if (specialPrice != null && specialPrice < (price ?? 0))
                    const SizedBox(width: 6),
                  Text(
                    "\$$price",
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
              const SizedBox(height: 4),
              // Rating & Orders
              if (averageRating != null)
                Row(
                  children: [
                    const Icon(Icons.star, size: 14, color: Colors.amber),
                    const SizedBox(width: 2),
                    Text(averageRating, style: const TextStyle(fontSize: 12)),
                    const SizedBox(width: 8),
                    Text(
                      "${product.ordersCount} orders",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
