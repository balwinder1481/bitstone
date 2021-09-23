import 'dart:convert';


class MarketModel {
 static List<Token> tokens = [];
}

class Token {
  final int id;
  final String name;
  final String symbol;
  final num price;
  final String image;

  Token({
    required this.id,
    required this.name,
    required this.symbol,
    required this.price,
    required this.image,
  });

  

  Token copyWith({
    int? id,
    String? name,
    String? symbol,
    num? price,
    String? image,
  }) {
    return Token(
      id: id ?? this.id,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'symbol': symbol,
      'price': price,
      'image': image,
    };
  }

  factory Token.fromMap(Map<String, dynamic> map) {
    return Token(
      id: map['id'],
      name: map['name'],
      symbol: map['symbol'],
      price: map['price'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Token.fromJson(String source) => Token.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Token(id: $id, name: $name, symbol: $symbol, price: $price, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Token &&
      other.id == id &&
      other.name == name &&
      other.symbol == symbol &&
      other.price == price &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      symbol.hashCode ^
      price.hashCode ^
      image.hashCode;
  }
}
