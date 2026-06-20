import '../../../core/api/api_client.dart';
import '../../../core/storage/token_storage.dart';
import '../models/category_model.dart';

class CategoryService {
  Future<List<CategoryModel>>
      getCategories() async {
        final token = await TokenStorage.getToken();

print("CATEGORY TOKEN = $token");
    final response =
        await ApiClient.dio.get(
      '/categories',
    );

    return (response.data as List)
        .map(
          (e) =>
              CategoryModel.fromJson(e),
        )
        .toList();
  }
}