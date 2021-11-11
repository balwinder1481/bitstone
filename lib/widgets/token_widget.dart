import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bitstone/models/market.dart';

class TokenWidget extends StatelessWidget {
  const TokenWidget({
    Key? key,
    required this.token,
  })  : assert(token != null),
        super(key: key);

  final Token token;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          //print("${token.name} clicked");
        },
        leading: Image.network(token.image),
        title: Text(token.name),
        subtitle: Text(token.symbol),
        trailing: Text(
          "\$${token.current_price.toDouble().toString()}",
          textScaleFactor: 1.5,
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
