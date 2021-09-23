import 'package:bitstone/models/market.dart';
import 'package:bitstone/widgets/drawer.dart';
import 'package:bitstone/widgets/token_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

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
    var marketJson = await rootBundle.loadString("assets/files/market.json");
    var decodedData = jsonDecode(marketJson);
    var tokensData = decodedData["tokens"];
    MarketModel.tokens = List.from(tokensData)
    .map<Token>((token) => Token.fromMap(token))
    .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("Markets"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: MarketModel.tokens.length,
            itemBuilder: (context, index) {
              return TokenWidget(
                token: MarketModel.tokens[index],
              );
            }),
      ),
      drawer: const MyDrawer(),
    );
  }
}
