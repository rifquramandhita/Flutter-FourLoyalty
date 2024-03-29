import 'package:flutter/material.dart';
import 'package:four_loyalty/const.dart';
import 'package:four_loyalty/data/model/coupon_model.dart';
import 'package:four_loyalty/data/resource/coupon_resource.dart';
import 'package:four_loyalty/data/resource/usercoupon_resource.dart';
import 'package:four_loyalty/data/response/base_response.dart';
import 'package:four_loyalty/helper/dialog_helper.dart';
import 'package:four_loyalty/helper/global_helper.dart';
import 'package:four_loyalty/ui/component/loading_component.dart';

class DetailCoupon_page extends StatefulWidget {
  final id;

  const DetailCoupon_page({super.key, required this.id});

  @override
  State<DetailCoupon_page> createState() => _DetailCoupon_pageState();
}

class _DetailCoupon_pageState extends State<DetailCoupon_page> {
  late bool isLoading;
  late Coupon_model coupon;

  void getData() async {
    setState(() {
      isLoading = true;
    });

    await Future.wait([getDetailCoupon().then((value) => coupon = value)]);

    setState(() {
      isLoading = false;
    });
  }

  void claimCoupon() async {
    setState(() {
      isLoading = true;
    });
    late Base_response response;
    await Future.wait([postClaim().then((value) => response = value)]);

    if (response.success) {
      getData();
    } else {
      Dialog_helper.showCustomDialog(
          context, 'Failed', response.message, Icons.error, [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              getData();
            },
            child: Text("Close"))
      ]);
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<Coupon_model> getDetailCoupon() async {
    final response = await Coupon_resource.getById(widget.id);
    return response.data[0];
  }

  Future<Base_response> postClaim() async {
    final response = await UserCoupon_resource.claim(widget.id);
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
    return Scaffold(
      body: (isLoading)
          ? Loading_component()
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(Const.BASE_URL + coupon.imgPath ?? ''),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              coupon.title,
                              style:
                                  Global_helper.getTheme(context).headlineLarge,
                            ),
                            Text(
                              coupon.description,
                              style: Global_helper.getTheme(context).bodyLarge,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.maxFinite,
                              child: (coupon.isClaimed == '1')
                                  ? ElevatedButton(
                                      onPressed: null, child: Text("Claimed"))
                                  : ElevatedButton(
                                      onPressed: () {
                                        claimCoupon();
                                      },
                                      child:
                                          Text("Claim | ${coupon.fee} Point"),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                          foregroundColor: Colors.white)),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
