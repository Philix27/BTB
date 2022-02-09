part of 'home.dart';

List<Widget> getTileList(BuildContext context) => [
      _buildIconCard(
        title: "Gainers",
        icon: Icons.arrow_upward_rounded,
        page: const PepMCQCategories(),
      ),
      _buildIconCard(
        title: "Losers",
        icon: Icons.arrow_downward_rounded,
        page: const MCQCategories(),
      ),
      _buildCard(
        title: "BSpot",
        page: const BSpotPage(),
      ),
      _buildIconCard(
        title: "Calculator",
        icon: Icons.calculate_rounded,
        page: const CalculatorPage(),
      ),
      _buildCard(
        title: "Settings",
        page: const AddSlider(),
      ),
    ];

List<Widget> getCoursesList() => [
      _buildCard(
        title: "Limit",
        page: const MCQCategories(),
      ),
      _buildCard(
        title: "Canceled",
        page: const MCQCategories(),
      ),
      _buildCard(
        title: "Filled",
        page: const MCQCategories(),
      ),
      _buildCard(
        title: "Positions",
        page: const MCQCategories(),
      ),
    ];

Widget _buildCard({
  required String title,
  // required IconData icon,
  required Widget page,
}) {
  return InkWell(
    onTap: () => MyWidgets.goTo(page),
    child: Card(
      child: SizedBox(
        height: 100,
        child: Center(
          child:
              Text(title, style: Styles.headlineText2!.copyWith(fontSize: 12)),
        ),
      ),
    ),
  );
}

Widget _buildIconCard({
  required String title,
  required IconData icon,
  required Widget page,
}) {
  return InkWell(
    onTap: () => MyWidgets.goTo(page),
    child: Card(
      child: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30),
            const SizedBox(height: 10),
            Text(
              title,
              style: Styles.headlineText2!.copyWith(
                fontSize: 12,
                color: Styles.primaryColorLight,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
