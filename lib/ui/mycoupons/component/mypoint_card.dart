import 'package:flutter/material.dart';
import 'package:four_loyalty/helper/global_helper.dart';

class MyPoint_card extends StatelessWidget {
  final myPoint;

  const MyPoint_card({super.key, required this.myPoint});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue[200], borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(top: 125, left: 50, right: 50),
      height: 125,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  width: 75,
                  height: 75,
                  child: Icon(Icons.account_balance_wallet,
                      size: 50, color: Colors.blue),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'My Point',
                        style: GlobalHelper.getTheme(context).titleLarge,
                      ),
                      Text(
                        myPoint,
                        style: GlobalHelper.getTheme(context).displayMedium,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
