// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({super.key, required this.balance, required this.date, required this.number, required this.user});
  final double balance;
  final String date;
  final String number;
  final String user;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: 300,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.deepPurple[300],
            borderRadius: BorderRadius.circular(16)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'Balance',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            balance.toString(),
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(number,style: TextStyle(color: Colors.white,fontSize: 22),),
              Text(date,style: TextStyle(color:Colors.white,fontSize: 22 ),)
            ],
          )
        ]),
      ),
    );
  }
}
