import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  final String id;
  final int answer;
  final String category;
  final String question;
  final String explain;
  final List<String> options;

  Question({
    required this.id,
    required this.answer,
    required this.category,
    required this.explain,
    required this.question,
    required this.options,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'answer_index': answer,
      'question': question,
      'options': options,
      'explain': explain,
      'category': category,
    };
  }

  factory Question.fromMap(QueryDocumentSnapshot<Object?> map) {
    // factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'].toString(),
      category: map['category'].toString(),
      answer: int.tryParse(map['answer_index'].toString())!,
      question: map['question'].toString(),
      explain: map['explain'].toString(),
      options: List<String>.from(map['options'] as Iterable<dynamic>),
    );
  }
}
