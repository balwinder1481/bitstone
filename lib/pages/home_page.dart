import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:bitstone/models/market.dart';
import 'package:bitstone/widgets/drawer.dart';
import 'package:bitstone/widgets/themes.dart';
import 'package:bitstone/widgets/token_widget.dart';

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
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MarketHeader(),
              if (MarketModel.tokens != null && MarketModel.tokens.isNotEmpty)
                const TokenList().expand()
              else
                const Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class MarketHeader extends StatelessWidget {
  const MarketHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Markets".text.xl2.bold.color(MyTheme.darkBluishColor).make(),
      ],
    );
  }
}

class TokenList extends StatelessWidget {
  const TokenList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: MarketModel.tokens.length,
      itemBuilder: (context, index) {
        final market = MarketModel.tokens[index];
        return TokenMarket(market: market);
      },
    );
  }
}

class TokenMarket extends StatelessWidget {
  final Token market;

  const TokenMarket({Key? key, required this.market})
      : assert(market != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Image.network(
          market.image,
        ).box.rounded.p8.color(MyTheme.creamColor).make().p16().w24(context)
      ],
    )).white.rounded.square(100).make().py16();
  }
}
