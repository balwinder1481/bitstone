import 'package:bitstone/models/market.dart';
import 'package:bitstone/widgets/drawer.dart';
import 'package:bitstone/widgets/token_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final dummyList = List.generate(4, (index) => MarketModel.tokens[0]);

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
            itemCount: dummyList.length,
            itemBuilder: (context, index) {
              return TokenWidget(
                token: dummyList[index],
              );
            }),
      ),
      drawer: const MyDrawer(),
    );
  }
}
