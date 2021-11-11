import 'package:bitstone/models/market.dart';
import 'package:bitstone/pages/home_detail_page.dart';
import 'package:bitstone/widgets/home-widgets/token_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TokenList extends StatelessWidget {
  const TokenList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: MarketModel.tokens.length,
      itemBuilder: (context, index) {
        final market = MarketModel.tokens[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(
                market: market,
              ),
            ),
          ),
          child: TokenMarket(market: market),
        );
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
          TokenImage(
            image: market.image,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                market.name.text.color(context.accentColor).make(),
                market.symbol.text.bold.make(),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "\$${market.current_price.toDouble().toString()}".text.lg.bold.make(),
              ],
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              market.price_change_percentage_24h.toDouble().toString().text.lg.make(),
            ],
          ))
        ],
      ),
    ).color(context.cardColor).rounded.square(90).make().py4();
  }
}
