import 'package:flutter/material.dart';
import 'package:four_loyalty/const.dart';
import 'package:four_loyalty/helper/global_helper.dart';

class MyCoupon_card extends StatelessWidget {
  final title;
  final expAt;
  final imgPath;

  const MyCoupon_card(
      {super.key,
      required this.title,
      required this.expAt,
      required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Colors.blueAccent, width: 4),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(Const.BASE_URL + imgPath))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.discount,
              color: Colors.blueAccent,
              size: 40,
            ),
          ),
          Expanded(child: SizedBox()),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: GlobalHelper.getTheme(context).titleLarge,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      expAt,
                      style: GlobalHelper.getTheme(context).bodyLarge,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
