import 'package:flutter/material.dart';
import 'package:four_loyalty/helper/global_helper.dart';

class CommingSoon_page extends StatelessWidget {
  const CommingSoon_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.not_interested, size: 200,),
            Text("Comming Soon", style: GlobalHelper.getTheme(context).headlineLarge,),
          ],
        ),
      ),
    );
  }
}
