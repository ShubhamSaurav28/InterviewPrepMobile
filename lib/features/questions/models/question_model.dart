class QuestionModel {
  final String id;
  final String categoryId;
  final String title;
  final String description;
  final String difficulty;
  final String questionType;

  QuestionModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.questionType,
  });

  factory QuestionModel.fromJson(
      Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      categoryId: json['categoryId'],
      title: json['title'],
      description: json['description'] ?? '',
      difficulty: json['difficulty'] ?? '',
      questionType: json['questionType'] ?? '',
    );
  }
}