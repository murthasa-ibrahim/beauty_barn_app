import 'package:machine_test_superlabs/config/dependency_injection/dependency_injection.dart';
import 'package:machine_test_superlabs/src/features/product_search/model/brand_model.dart';
import 'package:machine_test_superlabs/src/features/product_search/model/product_detail_model.dart';
import 'package:machine_test_superlabs/src/features/product_search/model/product_search_model.dart';
import 'package:machine_test_superlabs/src/features/product_search/model/similar_product.dart';
import 'package:machine_test_superlabs/src/utils/logger/app_logger.dart';

import '../../../services/remote/api/api_service.dart' show DioApiService;
import '../../../services/remote/end_points/end_points.dart';

class ProductRepo {
  final _apiService = locator<DioApiService>();

  Future<ProductData?> searchProducts({
    required String query,
    int page = 1,
    int limit = 10,
    List<String>? brands,
    List<String>? categories,
    List<String>? collections,
    Map<String, String>? attributes,
    String? minPrice,
    String? maxPrice,
    double? minRating,
    String? tag,
    String? sortBy,
  }) async {
    try {
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
        queryParams['attributes'] =
            attributes.entries.map((e) => '${e.key}:${e.value}').join(',');
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


  Future<SearchProductResponse?> getSuggestions(String query) async {
    try {
      final response = await _apiService.get(
        EndPoints.searchSuggestion,
        queryParameters: {'q': query},
      );

      if (response.statusCode == 200) {
        final data = SearchProductResponse.fromJson(response.data);
        return data;
      }
      return null;
    } catch (e, s) {
      AppLogger.trace(e, s);
      return null;
    }
  }

  /// 📋 Get single product by handler
  Future<ProductDetailData?> getProductByHandler(String handler) async {
    try {
      final response = await _apiService.get('/store/product/$handler');

      if (response.statusCode == 200) {
        final data = ProductDetailResponse.fromJson(response.data);
        return data.data;
      }
      return null;
    } catch (e, s) {
      AppLogger.trace(e, s);
      return null;
    }
  }

  Future<List<SimilarProduct>?> getSimilarProducts(String id) async {
    try {
      final response =
          await _apiService.get('/store/product/$id/similar?limit=10');

      if (response.statusCode == 200) {
        final data = SimilarProductResponse.fromJson(response.data);
        return data.data;
      }
      return null;
    } catch (e, s) {
      AppLogger.trace(e, s);
      return null;
    }
  }

  Future<List<Brand>?> fetchBrands({
    String? search,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await _apiService.get(EndPoints.brand, queryParameters: {
        'page': page.toString(),
        'limit': limit.toString(),
        if (search != null && search.isNotEmpty) 'search': search,
      });

      if (response.statusCode == 200) {
        final data = BrandResponse.fromJson(response.data);
        return data.data;
      }
      AppLogger.e("Fetch brands API error: ${response.statusCode}");
      return null;
    } catch (e, s) {
      AppLogger.trace(e, s);
      return null;
    }
  }
}
