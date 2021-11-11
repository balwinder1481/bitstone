import 'dart:convert';

class MarketModel {
  static List<Token> tokens = [];
}

class Token {
  final String name;
  final String symbol;
  final String image;
  final num current_price;
  final num price_change_percentage_24h;
  Token({
    required this.name,
    required this.symbol,
    required this.image,
    required this.current_price,
    required this.price_change_percentage_24h,
  });

  Token copyWith({
    String? name,
    String? symbol,
    String? image,
    num? current_price,
    num? price_change_percentage_24h,
  }) {
    return Token(
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      image: image ?? this.image,
      current_price: current_price ?? this.current_price,
      price_change_percentage_24h:
          price_change_percentage_24h ?? this.price_change_percentage_24h,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'symbol': symbol,
      'image': image,
      'current_price': current_price,
      'price_change_percentage_24h': price_change_percentage_24h,
    };
  }

  factory Token.fromMap(Map<String, dynamic> map) {
    return Token(
      name: map['name'],
      symbol: map['symbol'],
      image: map['image'],
      current_price: map['current_price'],
      price_change_percentage_24h: map['price_change_percentage_24h'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Token.fromJson(String source) => Token.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Token(name: $name, symbol: $symbol, image: $image, current_price: $current_price, price_change_percentage_24h: $price_change_percentage_24h)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Token &&
        other.name == name &&
        other.symbol == symbol &&
        other.image == image &&
        other.current_price == current_price &&
        other.price_change_percentage_24h == price_change_percentage_24h;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        symbol.hashCode ^
        image.hashCode ^
        current_price.hashCode ^
        price_change_percentage_24h.hashCode;
  }
}
