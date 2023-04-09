// HorizontalMenu.dart
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:workout_app/util/credit_card.dart';

class HorizontalMenu extends StatelessWidget {
  const HorizontalMenu({super.key, required this.items,required this.controller});
  final List<CreditCard> items;
  
  final controller ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [SizedBox(
        height: 200.0,
        child: PageView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => items[index % items.length]
          
          
        ),
    
      ),
      const SizedBox(height: 10,),
      SmoothPageIndicator(controller: controller, count: items.length)]
    );
  }
}