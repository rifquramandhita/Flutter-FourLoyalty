import 'package:flutter/material.dart';
import 'package:four_loyalty/helper/global_helper.dart';

class AmountCoupon_card extends StatelessWidget {
  final amount;

  const AmountCoupon_card({super.key, required this.amount});

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
                  child: Icon(Icons.discount,
                      size: 50, color: Colors.blue),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Amount Coupon',
                        style: Global_helper.getTheme(context).titleLarge,
                      ),
                      Text(
                        amount,
                        style: Global_helper.getTheme(context).displayMedium,
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
