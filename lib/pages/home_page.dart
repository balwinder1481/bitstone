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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("Markets"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (MarketModel.tokens != null && MarketModel.tokens.isNotEmpty)
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final token = MarketModel.tokens[index];
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                        header: Container(
                          child: Text(
                            token.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Colors.deepPurple,
                          ),
                        ),
                        child: Image.network(token.image),
                        footer: Text(
                          token.price.toString(),
                        ),
                      ));
                },
                itemCount: MarketModel.tokens.length,
              )
            // ListView.builder(
            //     itemCount: MarketModel.tokens.length,
            //     itemBuilder: (context, index) => TokenWidget(
            //       token: MarketModel.tokens[index],
            //     ),
            //   )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
