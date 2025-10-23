import 'package:machine_test_superlabs/config/dependency_injection/dependency_injection.dart';
import 'package:machine_test_superlabs/src/features/product_search/model/product_model.dart';
import 'package:machine_test_superlabs/src/features/product_search/model/product_search_model.dart';
import 'package:machine_test_superlabs/src/utils/logger/app_logger.dart';

import '../../../services/remote/api/api_service.dart' show DioApiService;
import '../../../services/remote/end_points/end_points.dart';

class ProductRepo {
  final _apiService = locator<DioApiService>();

  /// 🔍 Search products with optional filters
  Future<ProductData?> searchProducts({
    required String query,
    int page = 1,
    int limit = 10,
    List<String>? brands,
    List<String>? categories,
    List<String>? collections,
    Map<String, String>? attributes,
    double? minPrice,
    double? maxPrice,
    double? minRating,
    String? tag,
    String? sortBy,
  }) async {
    try {
      // Build query parameters dynamically
      final Map<String, dynamic> queryParams = {
        'q': query,
        'page': page,
        'limit': limit,
      };

      if (brands != null && brands.isNotEmpty) {
        queryParams['brands'] = brands.join(',');
      }
      if (categories != null && categories.isNotEmpty) {
        queryParams['categories'] = categories.join(',');
      }
      if (collections != null && collections.isNotEmpty) {
        queryParams['collections'] = collections.join(',');
      }
      if (attributes != null && attributes.isNotEmpty) {
        queryParams['attributes'] = attributes.entries
            .map((e) => '${e.key}:${e.value}')
            .join(',');
      }
      if (minPrice != null) queryParams['minPrice'] = minPrice;
      if (maxPrice != null) queryParams['maxPrice'] = maxPrice;
      if (minRating != null) queryParams['minRating'] = minRating;
      if (tag != null) queryParams['tag'] = tag;
      if (sortBy != null) queryParams['sortBy'] = sortBy;

      final response = await _apiService.get(
        EndPoints.search,
        queryParameters: queryParams,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        AppLogger.d("Search response: ${response.data}");
        final data = SearchProductResponse.fromJson(response.data);
        return data.data;
      }

      AppLogger.e("Search API error: ${response.statusCode}");
      return null;
    } catch (e, s) {
      AppLogger.trace(e, s);
      return null;
    }
  }

  /// 🔹 Suggestions
  Future<List<String>?> getSuggestions(String query) async {
    try {
      final response = await _apiService.get(
        '/store/product-search/suggestions',
        queryParameters: {'q': query},
      );

      if (response.statusCode == 200) {
        final List suggestions = response.data['suggestions'] ?? [];
        return suggestions.cast<String>();
      }
      return null;
    } catch (e, s) {
      AppLogger.trace(e, s);
      return null;
    }
  }

  /// 📋 Get single product by handler
  Future<Product?> getProductByHandler(String handler) async {
    try {
      final response = await _apiService.get('/store/product/$handler');

      if (response.statusCode == 200) {
        final data = ProductResponse.fromJson(response.data);
        return data.data?.first;
      }
      return null;
    } catch (e, s) {
      AppLogger.trace(e, s);
      return null;
    }
  }

  /// 🔁 Get similar products
  Future<List<Product>?> getSimilarProducts(String id) async {
    try {
      final response = await _apiService.get('/store/product/$id/similar');

      if (response.statusCode == 200) {
        final data = ProductResponse.fromJson(response.data);
        return data.data;
      }
      return null;
    } catch (e, s) {
      AppLogger.trace(e, s);
      return null;
    }
  }
}
