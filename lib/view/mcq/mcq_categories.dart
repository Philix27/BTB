import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:btb/core/theme/styles.dart';
import 'package:btb/view/mcq/quiz.dart';

part 'mcq_category_list.dart';
part 'mcq_category_item.dart';

class MCQCategories extends StatelessWidget {
  const MCQCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        backgroundColor: Styles.backgroundColor,
        title: Text(
          "Categories",
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
