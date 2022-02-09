import 'dart:async';
import 'package:binance_spot/binance_spot.dart';
import 'package:btb/core/theme/styles.dart';
import 'package:flutter/material.dart' hide Interval;

const String apiKey =
    "PjfFymFkRs0GAMCDSkrJ4KG0aulsIOa4G1V6N9DjKYIpG22as14s08hYc7FxN38a";
const String apiSecret =
    "zxRRZvMmE5yt9XmCxR60hiTXICJAIqUjMiQcRj98dYjN3i7pVGTcyhlc4sVV6jHJ";

class BSpotPage extends StatefulWidget {
  const BSpotPage({Key? key}) : super(key: key);

  @override
  _BSpotPageState createState() => _BSpotPageState();
}

class _BSpotPageState extends State<BSpotPage> {
  BinanceSpot binanceSpot = BinanceSpot(key: apiKey, secret: apiSecret);
  double lastClosePrice = 0;
  String tradablePairs = "";
  String lastEventData = "";

  late StreamSubscription<dynamic> userdataStreamSub;
  @override
  void initState() {
    startKlineStream();
    startUserdataStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Binance API")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Current BTC price : $lastClosePrice"),
            Text("Last userdataStream event : $lastEventData"),
            TextButton(
                onPressed: getTradablePairs, child: const Text("GET PAIRS")),
            FutureBuilder<List<String>>(
              future: getTradablePairs(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
                if (!snapshot.hasData) {
                  return Text("... questions",
                      style: Styles.headlineText2!.copyWith(fontSize: 12));
                } else {
                  // return Text(
                  //   "${snapshot.data![1]} questions",
                  //   style: Styles.headlineText2!.copyWith(fontSize: 12),
                  // );
                  // List clo = [];
                  // snapshot.data!.forEach((element) {
                  //   clo.add(Card(
                  //     child: ListTile(
                  //         title: Text(element, style: Styles.headlineText2)),
                  //   ));
                  // });
                  // return ListView(
                  //   children: [...clo],
                  // );
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text(
                            snapshot.data![index],
                            style: Styles.headlineText2,
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  StreamSubscription<dynamic> startKlineStream() => binanceSpot
      .klineStream(symbol: "BTCUSDT", interval: Interval.INTERVAL_5m)
      .listen(handleNewKline);

  void handleNewKline(WsKlineEvent event) => setState(() {
        lastClosePrice = event.kline.close;
      });

  void startUserdataStream() async {
    var response = await binanceSpot.createListenKey();
    if (response.isRight) {
      var stream = binanceSpot.userDataStream(listenKey: response.right);
      userdataStreamSub = stream.listen(handleUserdataEvent);
    } else {
      lastEventData = response.left;
    }
  }

  void handleUserdataEvent(dynamic event) {
    lastEventData = "Unknown event type : ${event.toString()}";
    if (event is WsAccountUpdate)
      lastEventData =
          "Account update event : ${event.balances.length} balances updated";
    if (event is WsBalanceUpdate)
      lastEventData = "Balance update event : ${event.asset} balance updated";
    if (event is WsExecutionReport)
      lastEventData =
          "Execution report event : status is ${event.orderStatus.toStr()}";
    if (event is WsListOrderStatus)
      lastEventData =
          "ListOrder update event : status is ${event.listOrderStatus}";
  }

  Future<List<String>> getTradablePairs() async {
    List<String> listSymbol = [];
    var response = await binanceSpot.exchangeInfo();
    if (response.isRight) {
      listSymbol = response.right.symbols.map((e) => e.symbol).toList();
    }

    return listSymbol;
  }
}
