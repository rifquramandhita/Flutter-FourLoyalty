import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:four_loyalty/data/model/coupon_model.dart';
import 'package:four_loyalty/data/resource/coupon_resource.dart';
import 'package:four_loyalty/data/resource/usercoupon_resource.dart';
import 'package:four_loyalty/data/response/base_response.dart';
import 'package:four_loyalty/helper/dialog_helper.dart';
import 'package:four_loyalty/helper/global_helper.dart';
import 'package:four_loyalty/ui/component/loading_component.dart';
import 'package:four_loyalty/ui/detailcoupon/detailcoupon_page.dart';
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

  void claimCoupon(String couponId) async {
    setState(() {
      isLoading = true;
    });
    late Base_response response;
    await Future.wait([postClaim(couponId).then((value) => response = value)]);
    if (response.success == true) {
      getData();
    } else {
      Dialog_helper.showCustomDialog(
          context, "Failed", response.message, Icons.error, [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              getData();
            },
            child: Text("Close"))
      ]);
    }
  }

  Future getAllCoupon() async {
    final response = await Coupon_resource.fetchAll();
    listCoupon = response.data;
  }

  Future<Base_response> postClaim(String couponId) async {
    final response = await UserCoupon_resource.claim(couponId);
    return response;
  }

  @override
  void initState() {
    isLoading = false;
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: initState,
      child: Scaffold(
        body: SafeArea(
          child: (isLoading)
              ? Loading_component()
              : SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        "List Coupon",
                        style: Global_helper.getTheme(context).titleLarge,
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
                              fee: coupon.fee,
                              claimBOnPress: () {
                                claimCoupon(coupon.id);
                              },
                              cardOnClick: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailCoupon_page(id: coupon.id),
                                    ));
                              });
                        },
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
