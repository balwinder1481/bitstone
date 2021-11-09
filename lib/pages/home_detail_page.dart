import 'package:bitstone/models/market.dart';
import 'package:bitstone/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Token market;

  const HomeDetailPage({Key? key, required this.market})
      : assert(market != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: Key(market.id.toString()),
              child: Image.network(market.image),
            ),
            Expanded(
                child: Container(
              color: Colors.red,
            ))
          ],
        ),
      ),
    );
  }
}
