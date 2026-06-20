import '../../../core/api/api_client.dart';
import '../models/question_model.dart';

class QuestionService {
  Future<List<QuestionModel>>
      getQuestionsByCategory(
          String categoryId) async {
    final response =
        await ApiClient.dio.get(
      '/categories/$categoryId/questions',
    );

    return (response.data as List)
        .map(
          (e) =>
              QuestionModel.fromJson(e),
        )
        .toList();
  }
}