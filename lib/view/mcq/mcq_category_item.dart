part of 'mcq_categories.dart';


class CategoryItem {
  String name;
  String category;
  VoidCallback onTap;
  CategoryItem({
    required this.name,
    required this.category,
    required this.onTap,
  });
}



Widget getQuestionsCount(String category) {
  return FutureBuilder(
    future: FirebaseFirestore.instance
        .collection("mcq")
        .where('category', isEqualTo: category)
        .get(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData) {
        return Text(
          "... questions",
          style: Styles.headlineText2!.copyWith(fontSize: 12),
        );
      } else {
        return Text(
          "${snapshot.data!.docs.length} questions",
          style: Styles.headlineText2!.copyWith(fontSize: 12),
        );
      }
    },
  );
}
