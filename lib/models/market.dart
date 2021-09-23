
class MarketModel {
 static final tokens = [
   Token(
     id: 1, 
     name: "BitStone", 
     symbol: "BTN", 
     price: 1, 
     image: "https://i.ibb.co/zhYFCC9/logo.png")
  ];
}

class Token {
  final int id;
  final String name;
  final String symbol;
  final num price;
  final String image;

  Token({required this.id, required this.name, required this.symbol, required this.price, required this.image});

  
}
