 
import 'package:flutter/material.dart';

class CardList {
  List<Color> colors;
  String balance;
  String cardName;
  String cvv;
  String realnum;

  CardList({this.colors, this.balance, this.cardName,this.cvv,this.realnum});
}

List<CardList> cards = [
  CardList(
    colors: [
      Color.fromRGBO(0, 0, 255, 1),
      Color.fromRGBO(55, 124, 255, 1),
      Color.fromRGBO(223, 31, 228, 1),
    ],
    balance: "Rs 20,500.12",
    cardName: "Visa",
    cvv: "263",
    realnum: "1234 5678 9874 1245"
  ),

  CardList(
    colors: [
      Color.fromRGBO(255, 193, 117, 1),
      Color.fromRGBO(254, 68, 14, 1),
      Color.fromRGBO(255, 193, 117, 1),
    ],
    balance: "Rs 30,500.79",
    cardName: "Visa",
    cvv: "325",
    realnum: "2587 1234 5469 7854"
  ),

  CardList(
    colors: [
      Colors.grey[300],
      Colors.grey[800],
      Colors.grey[300],
    ],
    balance: "Rs 28,800.60",
    cardName: "Visa",
    cvv: "248",
    realnum: "2014 2549 3214 5213"
  ),
];
