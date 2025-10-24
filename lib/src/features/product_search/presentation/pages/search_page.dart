import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:machine_test_superlabs/config/constants/app_colors.dart';
import 'package:machine_test_superlabs/config/constants/constants.dart';
import 'package:machine_test_superlabs/config/routes/routes.dart';
import 'package:machine_test_superlabs/src/features/product_search/model/product_search_model.dart';
import 'package:machine_test_superlabs/src/services/remote/base/base.dart';
import '../../../../utils/logger/app_logger.dart';
import '../bloc/product_bloc/product_bloc.dart';
import 'widget/filter_section.dart';
import 'widget/product_listing_section.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  final List<String> categories = [
    'Makeup',
    'Hair',
    'Body Care',
    "Men's Skincare",
    'Brands',
    'BestSellers',
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
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (value.trim().length >= 2) {
        context
            .read<ProductBloc>()
            .add(ProductEvent.getSearchSuggestion(query: value.trim()));
      } else {
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
    _controller.text = suggestion.title ?? '';
    final query = suggestion.title ?? '';

    context
        .read<ProductBloc>()
        .add(ProductEvent.searchProductsEvent(query: query));
    context
        .read<ProductBloc>()
        .add(ProductEvent.getProductDetail(id: suggestion.handle ?? ''));
    context.read<ProductBloc>().add(
        ProductEvent.getSimilarProductsEvent(productId: suggestion.id ?? ''));

    Future.microtask(() {
      context.push(Routes.productDetail);
    });

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
    final mq = MediaQuery.of(context);
    final keyboardHeight = mq.viewInsets.bottom;
    final maxSuggestionHeight = (mq.size.height - keyboardHeight) * 0.38;

    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          // appBar: AppBar(
          //   // title: const Text("Search Products"),
          //   actions: [
          //     IconButton(
          //       icon: const Icon(Icons.filter_list),
          //       onPressed: () {
          //         FocusScope.of(context).unfocus();
          //         context.push(Routes.filter);
          //       },
          //     ),
          //   ],
          // ),
          body: SafeArea(
            child: Column(
              children: [
                buildSearchAndSuggesion(context, maxSuggestionHeight),
                buildCategorySection(),
                FilterSection(),
                ProductListingSection(productScrollCtrl: productScrollCtrl),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildSearchAndSuggesion(
      BuildContext context, double maxSuggestionHeight) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        hintText: 'Search products...',
                        hintStyle: TextStyle(color: Colors.grey.shade500),
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.black87),
                        suffixIcon: _controller.text.isNotEmpty
                            ? IconButton(
                                icon:
                                    const Icon(Icons.clear, color: Colors.grey),
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
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: _onSearchChanged,
                      onSubmitted: _onSubmitted,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.filter_list, color: Colors.white),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      context.push(Routes.filter);
                    },
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              final suggestions = state.searchSuggestions;
              if (_controller.text.trim().length < 2 || suggestions.isEmpty) {
                return const SizedBox.shrink();
              }

              return Container(
                margin: const EdgeInsets.only(top: 8),
                constraints: BoxConstraints(
                  maxHeight: maxSuggestionHeight,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      color: AppColors.black.withValues(alpha: 0.06),
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: suggestions.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
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
    );
  }

  SizedBox buildCategorySection() {
    return SizedBox(
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
    );
  }
}
