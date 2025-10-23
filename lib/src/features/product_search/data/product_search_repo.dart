import 'package:machine_test_superlabs/config/dependency_injection/dependency_injection.dart';
import 'package:machine_test_superlabs/src/features/product_search/model/product_model.dart';
import 'package:machine_test_superlabs/src/utils/logger/app_logger.dart';

import '../../../services/remote/api/api_service.dart' show DioApiService;
import '../../../services/remote/end_points/end_points.dart';

class ProductRepo {
  final _apiService = locator<DioApiService>();

  Future<List<Product>?> searchProducts({
    required String query,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final url = '${EndPoints.search}?q=$query&page=$page&limit=$limit';
      final response = await _apiService.get(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = ProductResponse.fromJson(response.data);
        return data.data;
      }

      AppLogger.e("Search API error: ${response.statusCode}");
      return null;
    } catch (e, s) {
      AppLogger.trace(e, s);
      return null;
    }
  }



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
