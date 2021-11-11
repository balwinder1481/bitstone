import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:bitstone/models/market.dart';
import 'package:bitstone/widgets/home-widgets/market_header.dart';
import 'package:bitstone/widgets/home-widgets/token_list.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url =
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 10));
    //final marketJson = await rootBundle.loadString("assets/files/market.json");

    final response = await http.get(Uri.parse(url));
    final marketJson = response.body;
    final decodedData = jsonDecode(marketJson);
    // var tokensData = Token.fromJson(decodedData);
    // print(tokensData);
    MarketModel.tokens = List.from(decodedData)
        .map<Token>((token) => Token.fromMap(token))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MarketHeader(),
              if (MarketModel.tokens != null && MarketModel.tokens.isNotEmpty)
                const TokenList().expand()
              else
                const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
