import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../services/category_service.dart';
import '../../questions/screens/questions_screen.dart';

class CategoriesScreen
    extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen>
      createState() =>
          _CategoriesScreenState();
}

class _CategoriesScreenState
    extends State<CategoriesScreen> {

  final _service =
      CategoryService();

  List<CategoryModel> categories = [];

  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  Future<void> loadCategories()
  async {
    categories =
        await _service.getCategories();

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
            const Text("Categories"),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (_, index) {

          final category =
              categories[index];

          return ListTile(
            title: Text(category.name),
            subtitle: Text(
              category.description ?? '',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      QuestionsScreen(
                    categoryId: category.id,
                    categoryName: category.name,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}