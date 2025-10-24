import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:machine_test_superlabs/config/constants/constants.dart';
import 'package:machine_test_superlabs/config/routes/routes.dart';
import 'package:machine_test_superlabs/src/features/product_search/model/product_search_model.dart';
import 'package:machine_test_superlabs/src/features/product_search/presentation/pages/filter_page.dart';
import 'package:machine_test_superlabs/src/features/product_search/presentation/pages/widget/shimmer.dart';
import 'package:machine_test_superlabs/src/services/remote/base/base.dart';
import '../../../../utils/logger/app_logger.dart';
import '../bloc/product_bloc/product_bloc.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  final List<String> categories = [
    'Makeup',
    'Skincare',
    'Hair',
    'Fragrance',
    'Tools',
  ];

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ScrollController? productScrollCtrl;
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  Timer? _debounce;
  String _selectedCategory = '';

  @override
  void initState() {
    super.initState();
    productScrollCtrl = ScrollController();
    _controller = TextEditingController();
    productScrollCtrl?.addListener(() {
      if (productScrollCtrl?.position.maxScrollExtent ==
              productScrollCtrl?.offset &&
          BlocProvider.of<ProductBloc>(context).state.haseMoreProduct == true) {
        AppLogger.e("Load more data");
        BlocProvider.of<ProductBloc>(context)
            .add(ProductEvent.productListPagination());
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    _focusNode.dispose();
    productScrollCtrl?.dispose();

    super.dispose();
  }

  void _onSearchChanged(String value) {
    // Debounce to avoid too many API calls
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (value.trim().length >= 2) {
        context
            .read<ProductBloc>()
            .add(ProductEvent.getSearchSuggestion(query: value.trim()));
      } else {
        // clear suggestions if under 2 chars
        context.read<ProductBloc>().add(ProductEvent.refreshUi());
      }
    });
  }

  void _onSubmitted(String value) {
    final q = value.trim();
    if (q.isEmpty) return;
    context.read<ProductBloc>().add(ProductEvent.searchProductsEvent(query: q));
    context.read<ProductBloc>().add(ProductEvent.clearSearchSuggestions());
    _focusNode.unfocus();
  }

  void _onSuggestionTap(SearchProduct suggestion) {
    // set the text first
    _controller.text = suggestion.title ?? '';
    final query = suggestion.title ?? '';

    // Dispatch events
    context
        .read<ProductBloc>()
        .add(ProductEvent.searchProductsEvent(query: query));
    context
        .read<ProductBloc>()
        .add(ProductEvent.getProductDetail(id: suggestion.handle ?? ''));
    context.read<ProductBloc>().add(
        ProductEvent.getSimilarProductsEvent(productId: suggestion.id ?? ''));

    // schedule navigation after current frame to avoid hit-test/layout timing issues
    Future.microtask(() {
      context.push(Routes.productDetail);
    });

    // unfocus keyboard
    _focusNode.unfocus();
  }

  Widget _buildSuggestionTile(BuildContext context, SearchProduct suggestion) {
    final imageUrl = suggestion.thumbnail;
    final imageWidget = (imageUrl != null && imageUrl.isNotEmpty)
        ? Image.network(
            Uri.encodeFull(Api.baseUrl + imageUrl),
            width: 48,
            height: 48,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return SizedBox(
                  width: 48,
                  height: 48,
                  child:
                      Center(child: CircularProgressIndicator(strokeWidth: 2)));
            },
            errorBuilder: (_, __, ___) =>
                const Icon(Icons.image_outlined, size: 40),
          )
        : const Icon(Icons.image_outlined, size: 40);

    return ListTile(
      leading:
          ClipRRect(borderRadius: BorderRadius.circular(6), child: imageWidget),
      title: Text(suggestion.title ?? ''),
      subtitle: suggestion.handle != null
          ? Text(suggestion.handle!,
              style: const TextStyle(fontSize: 12, color: Colors.grey))
          : null,
      onTap: () => _onSuggestionTap(suggestion),
      dense: true,
      visualDensity: VisualDensity.compact,
    );
  }

  @override
  Widget build(BuildContext context) {
    // compute maximum suggestions box height accounting for keyboard
    final mq = MediaQuery.of(context);
    final keyboardHeight = mq.viewInsets.bottom;
    // leave space for categories, filters and product grid — suggestions limited to 38% or keyboard adjusted
    final maxSuggestionHeight = (mq.size.height - keyboardHeight) * 0.38;

    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Search Products"),
            actions: [
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  context.push(Routes.filter);
                },
              ),
            ],
          ),
          body: Column(
            children: [
              // Search + suggestions area
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        labelText: 'Search products...',
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: _controller.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  _controller.clear();
                                  context
                                      .read<ProductBloc>()
                                      .add(ProductEvent.refreshUi());
                                  context.read<ProductBloc>().add(
                                      ProductEvent.clearSearchSuggestions());
                                },
                              )
                            : null,
                      ),
                      onChanged: _onSearchChanged,
                      onSubmitted: _onSubmitted,
                    ),

                    // Suggestions list (shows only when suggestions available & 2+ chars)
                    BlocBuilder<ProductBloc, ProductState>(
                      builder: (context, state) {
                        final suggestions = state.searchSuggestions;
                        if (_controller.text.trim().length < 2 ||
                            suggestions.isEmpty) {
                          return const SizedBox.shrink();
                        }

                        // constrained box prevents overflow when keyboard open
                        return Container(
                          margin: const EdgeInsets.only(top: 8),
                          constraints: BoxConstraints(
                            maxHeight: maxSuggestionHeight,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6,
                                color: Colors.black.withOpacity(0.06),
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount: suggestions.length,
                            separatorBuilder: (_, __) =>
                                const Divider(height: 1),
                            itemBuilder: (context, index) {
                              final suggestion = suggestions[index];
                              return _buildSuggestionTile(context, suggestion);
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Categories Row
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: widget.categories.length,
                  itemBuilder: (context, index) {
                    final category = widget.categories[index];
                    final isSelected = category == _selectedCategory;

                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChoiceChip(
                        label: Text(category),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() {
                            _selectedCategory = selected ? category : '';
                          });
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

              // Products Grid (flexible so suggestions/keyboard don't overflow)
              Expanded(
                child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      // show grid skeleton instead of circular loader
                      return GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.6,
                        ),
                        itemCount: 6, // number of skeleton items to show
                        itemBuilder: (context, index) {
                          return const ProductCardSkeleton();
                        },
                      );
                    } else if (state.searchProducts.isNotEmpty) {
                      return GridView.builder(
                        controller: productScrollCtrl,
                        padding: const EdgeInsets.all(12),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.6,
                        ),
                        itemCount: state.searchProducts.length + 1,
                        itemBuilder: (context, index) {
                          //final product = state.searchProducts[index];
                          if (index < state.searchProducts.length) {
                            return ProductCard(
                              product: state.searchProducts[index],
                              onTap: () {
                                // dispatch detail + similar and navigate (schedule navigation)
                                context.read<ProductBloc>().add(
                                    ProductEvent.getProductDetail(
                                        id: state
                                            .searchProducts[index].handle));
                                context.read<ProductBloc>().add(
                                    ProductEvent.getSimilarProductsEvent(
                                        productId:
                                            state.searchProducts[index].id ??
                                                ''));

                                Future.microtask(
                                    () => context.push(Routes.productDetail));
                              },
                            );
                          } else {
                            return state.haseMoreProduct && index > 5
                                ? const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    child: Center(
                                      child: CupertinoActivityIndicator(),
                                    ),
                                  )
                                : kWhiteSpace;
                          }
                        },
                      );
                    } else {
                      return const Center(
                          child: Text("Search for products..."));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
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
          Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ProductFilterPage()));
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
              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: imageUrl != null
                    ? Image.network(
                        Uri.encodeFull(Api.baseUrl + imageUrl),
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
              // Rating & Orders
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
