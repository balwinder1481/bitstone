import 'package:bitstone/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TokenImage extends StatelessWidget {
  const TokenImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p4.color(context.canvasColor).make().p16().w24(context);
  }
}
