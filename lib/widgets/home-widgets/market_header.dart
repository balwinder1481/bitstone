import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MarketHeader extends StatelessWidget {
  const MarketHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ignore: deprecated_member_use
        "Markets".text.xl2.bold.color(context.theme.accentColor).make(),
      ],
    );
  }
}
