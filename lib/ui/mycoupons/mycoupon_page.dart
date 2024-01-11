import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:four_loyalty/data/model/user_model.dart';
import 'package:four_loyalty/data/model/usercoupon_model.dart';
import 'package:four_loyalty/data/resource/user_resource.dart';
import 'package:four_loyalty/data/resource/usercoupon_resource.dart';
import 'package:four_loyalty/helper/global_helper.dart';
import 'package:four_loyalty/ui/component/loading_component.dart';
import 'package:four_loyalty/ui/detailcoupon/detailcoupon_page.dart';
import 'package:four_loyalty/ui/mycoupons/component/mycoupon_card.dart';
import 'package:four_loyalty/ui/mycoupons/component/amountcoupon_card.dart';

class MyCoupons_page extends StatefulWidget {
  const MyCoupons_page({super.key});

  @override
  State<MyCoupons_page> createState() => _MyCoupons_pageState();
}

class _MyCoupons_pageState extends State<MyCoupons_page> {
  late bool isLoading;
  late User_model user;
  late List<UserCoupon_model> listUserCoupon;

  void getAllData() async {
    setState(() {
      isLoading = true;
    });

    await Future.wait([getDataUser(), getDataUserCoupon()]);

    setState(() {
      isLoading = false;
    });
  }

  Future getDataUser() async {
    final response = await User_resource.fetchMe();
    user = response.data;
  }

  Future getDataUserCoupon() async {
    final response = await UserCoupon_resource.getByUser();
    listUserCoupon = response.data!;
  }

  @override
  void initState() {
    isLoading = false;
    getAllData();
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
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              color: Colors.blue,
                              width: double.infinity,
                              height: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hello",
                                    style: Global_helper.getTheme(context)
                                        .headlineSmall,
                                  ),
                                  Text(
                                    user.name,
                                    style: Global_helper.getTheme(context)
                                        .headlineLarge,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              width: double.maxFinite,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "My Coupon",
                                    style: Global_helper.getTheme(context)
                                        .headlineLarge,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: listUserCoupon.length,
                                    itemBuilder: (context, index) {
                                      final userCoupon = listUserCoupon[index];
                                      return MyCoupon_card(
                                        title: userCoupon.title,
                                        expAt: userCoupon.expAt,
                                        imgPath: userCoupon.imagePath,
                                        cardOnClick: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailCoupon_page(
                                                        id: userCoupon.couponId),
                                              ));
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        AmountCoupon_card(amount: listUserCoupon.length.toString())
                      ],
                    ),
                  )),
      ),
    );
  }
}
