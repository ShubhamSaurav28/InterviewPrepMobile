import 'package:flutter/material.dart';

import '../models/question_model.dart';
import '../services/question_service.dart';

class QuestionsScreen
    extends StatefulWidget {
  final String categoryId;
  final String categoryName;

  const QuestionsScreen({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  State<QuestionsScreen> createState() =>
      _QuestionsScreenState();
}

class _QuestionsScreenState
    extends State<QuestionsScreen> {

  final _service =
      QuestionService();

  List<QuestionModel> questions = [];

  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions()
  async {
    questions =
        await _service.getQuestionsByCategory(
      widget.categoryId,
    );

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    if (loading) {
      return const Scaffold(
        body: Center(
          child:
              CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.categoryName),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (_, index) {

          final question =
              questions[index];

          return Card(
            margin:
                const EdgeInsets.all(8),
            child: ListTile(
              title:
                  Text(question.title),
              subtitle: Text(
                question.description,
              ),
              trailing: Text(
                question.difficulty,
              ),
            ),
          );
        },
      ),
    );
  }
}