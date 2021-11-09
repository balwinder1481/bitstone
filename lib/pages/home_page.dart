import 'dart:convert';

import 'package:bitstone/widgets/home-widgets/market_header.dart';
import 'package:bitstone/widgets/home-widgets/token_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:bitstone/models/market.dart';
import 'package:bitstone/widgets/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final marketJson = await rootBundle.loadString("assets/files/market.json");
    //print(marketJson);
    final decodedData = jsonDecode(marketJson);
    var tokensData = decodedData["tokens"];
    MarketModel.tokens = List.from(tokensData)
        .map<Token>((token) => Token.fromMap(token))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
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
