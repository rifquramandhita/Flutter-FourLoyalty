import 'package:flutter/material.dart';
import 'package:four_loyalty/data/model/coupon_model.dart';
import 'package:four_loyalty/data/resource/coupon_resource.dart';
import 'package:four_loyalty/helper/global_helper.dart';
import 'package:four_loyalty/ui/component/loading_component.dart';
import 'package:four_loyalty/ui/searchcoupons/component/searchcoupon_card.dart';

class SearchCoupons_page extends StatefulWidget {
  const SearchCoupons_page({super.key});

  @override
  State<SearchCoupons_page> createState() => _SearchCoupons_pageState();
}

class _SearchCoupons_pageState extends State<SearchCoupons_page> {
  late bool isLoading;
  late List<Coupon_model> listCoupon;

  void getData() async {
    setState(() {
      isLoading = true;
    });

    await Future.wait([getAllCoupon()]);

    setState(() {
      isLoading = false;
    });
  }

  Future getAllCoupon() async {
    final response = await Coupon_resource.fetchAll();
    listCoupon = response.data;
  }

  @override
  void initState() {
    isLoading = false;
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: (isLoading)
            ? Loading_component()
            : SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "List Coupon",
                      style: GlobalHelper.getTheme(context).titleLarge,
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listCoupon.length,
                      itemBuilder: (context, index) {
                        final coupon = listCoupon[index];
                        return SearchCoupon_card(
                          title: coupon.title,
                          imgPath: coupon.imgPath,
                          isClaimed: coupon.isClaimed,
                        );
                      },
                    )
                  ],
                ),
              ),
      ),
    );
  }
}