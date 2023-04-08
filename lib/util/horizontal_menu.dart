// HorizontalMenu.dart
import 'package:flutter/material.dart';
import 'package:workout_app/util/credit_card.dart';

class HorizontalMenu extends StatelessWidget {
  const HorizontalMenu({super.key, required this.items});
  final List<CreditCard> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: ListView.builder(
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => items[index],
      ),
    );
  }
}