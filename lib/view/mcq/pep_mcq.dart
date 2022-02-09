import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:btb/core/theme/styles.dart';
import 'package:btb/view/mcq/quiz.dart';
import 'mcq_categories.dart';

final _categories = [
  CategoryItem(
    name: "PEP March 2018",
    category: "PEP",
    onTap: () => Get.to(
      () => const Quiz(
        category: "PEP March 2018",
        title: "PEP March 2018",
      ),
    ),
  ),
  CategoryItem(
    name: "PEP October 2021",
    category: "PEP October 2021",
    onTap: () => Get.to(
      () => const Quiz(
        category: "PEP October 2021",
        title: "PEP October 2021",
      ),
    ),
  ),
];

class PepMCQCategories extends StatelessWidget {
  const PepMCQCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        backgroundColor: Styles.backgroundColor,
        title: Text(
          "PEP MCQs",
          style: Styles.headlineText1,
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: _categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
              child: ListTile(
                onTap: _categories[index].onTap,
                title: Text(
                  _categories[index].name,
                  style: Styles.headlineText2!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                subtitle: getQuestionsCount(_categories[index].category),
              ),
            ),
          );
        },
      ),
    );
  }
}
