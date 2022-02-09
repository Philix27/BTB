import 'package:btb/core/theme/styles.dart';
import 'package:btb/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  late ScrollController controller;
  double percentage = 1.0;
  double nairaValue = 1.0;
  bool isSafeTrade = false;
  bool isBuy = true;

  late TextEditingController nairaValueController;
  late TextEditingController currentPriceController;
  late TextEditingController exitPriceController;
  late TextEditingController assetQuantityController;

  onChange() {
    double cp = double.parse(currentPriceController.text);
    double exP = double.parse(exitPriceController.text);
    double nn = double.parse(nairaValueController.text);
    double aquant = double.parse(assetQuantityController.text);
    bool _safeTrade = false;

    /// To calculate the least amount to buy
    /// To calculate the least amount to sell
    ///
    ///
    //* Buy
    /// Buy if the

    if (isBuy) {
      var diff = (cp - exP);
      var pct = (diff / cp) * 100;
      if (pct > 0.5) _safeTrade = true;
      setState(() {
        percentage = pct;
        isSafeTrade = _safeTrade;
      });
    } else {
      var diff = (exP - cp);
      var pct = (diff / cp) * 100;
      if (pct > 0.5) _safeTrade = true;
      setState(() {
        percentage = pct;
        isSafeTrade = _safeTrade;
      });
    }

    nairaValue = aquant * percentage * nn;
  }

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    nairaValueController = TextEditingController(text: "565");
    currentPriceController = TextEditingController(text: "1");
    exitPriceController = TextEditingController(text: "1");
    assetQuantityController = TextEditingController(text: "1");
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: Styles.headlineText2!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: controller,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2.0,
                        color: isSafeTrade ? Colors.green : Colors.red,
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "Percentage Diff: ",
                                  style: Styles.headlineText3!.copyWith(
                                    fontSize: 13,
                                    color: Styles.primaryColorLight,
                                  ),
                                ),
                              ),
                              Text(
                                "$percentage",
                                style: Styles.headlineText4!
                                    .copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "₦$nairaValue",
                            style: Styles.headlineText4!.copyWith(
                                fontSize: 12,
                                color: isSafeTrade ? Colors.green : Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isBuy = true;
                          });
                        },
                        child: Container(
                          color: isBuy ? Colors.green : Colors.grey[800],
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          child: Text(
                            'BUY',
                            style: Styles.headlineText4!.copyWith(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isBuy = false;
                          });
                        },
                        child: Container(
                          color: isBuy ? Colors.grey[800] : Colors.red,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          child: Text(
                            'SELL',
                            style: Styles.headlineText4!.copyWith(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Current Price",
                style: Styles.headlineText4!.copyWith(fontSize: 12),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: currentPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  hintText: 'Entry Price',
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Exit Price",
                style: Styles.headlineText4!.copyWith(fontSize: 12),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: exitPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  hintText: 'Exit Price',
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Asset Quantity",
                style: Styles.headlineText4!.copyWith(fontSize: 12),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: assetQuantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  hintText: 'Asset Quantity',
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Naira Price",
                style: Styles.headlineText4!.copyWith(fontSize: 12),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: nairaValueController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  hintText: 'Naira Price',
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: MyWidgets.raisedButton(
                    title: "Calculate", onPressed: onChange),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
