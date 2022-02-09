import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:btb/core/theme/styles.dart';
import 'package:btb/view/mcq/add_mcq.dart';
import 'package:btb/models/questions_model.dart';
import 'package:btb/view/widgets/loading.dart';
import 'package:btb/view/widgets/widgets.dart';
import '../../models/questions_model.dart';
import 'quiz_card.dart';

class Quiz extends StatefulWidget {
  final String category;
  final String title;

  const Quiz({
    Key? key,
    required this.category,
    required this.title,
  }) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title, style: Styles.headlineText2)),
      floatingActionButton: MyWidgets.fab(
        icon: Icons.add,
        onTap: () => MyWidgets.goTo(AddMcqPage(category: widget.category)),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("mcq")
            .where('category', isEqualTo: widget.category)
            .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Loading.spinKitFadingCircle());
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final Question question =
                    Question.fromMap(snapshot.data!.docs[index]);

                return QCard(
                  question: question,
                  currentIndex: index,
                  questionLength: snapshot.data!.docs.length,
                );
              },
            );
          }
        },
      ),
    );
  }
}
