import 'dart:math';

import 'package:ecombuy/main.dart';
import 'package:ecombuy/models/category.dart';
import 'package:ecombuy/repositories/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> _categories = [];
  List<int> _extends = [];

  final rnd = Random();

  @override
  void initState() {
    _loadCategory();
    super.initState();
  }

  void _loadCategory() async {
    //TODO: Fetch  then list of categories
    // final categories = await categoryRepository.fetchCategories();
    final categories =
        categoriesTest.map((category) => Category.fromJson(category)).toList();

    final extents =
        List<int>.generate(categories.length, (index) => rnd.nextInt(3) + 2);

    setState(() {
      _categories = categories;
      _extends = extents;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Categories'),
      ),
      body: MasonryGridView.count(
          padding: const EdgeInsets.only(top: 12.0, left: 4.0, right: 4.0),
          crossAxisCount: 3,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          itemCount: _categories.length,
          itemBuilder: (context, index) {
            final height = _extends[index] * 100;
            final category = _categories[index];
            return InkWell(
              onTap: () {
                // TODO : Navigate to the catalog Screen
                Navigator.pushNamed(context, '/catalog',
                    arguments: category.name);
              },
              child: Hero(
                tag: category.id,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                        image: NetworkImage(_categories[index].imageUrl),
                        fit: BoxFit.cover),
                    // color: Colors.primaries[index % Colors.primaries.length],
                  ),
                  height: height.toDouble(),
                ),
              ),
            );
          }),
    );
  }
}
