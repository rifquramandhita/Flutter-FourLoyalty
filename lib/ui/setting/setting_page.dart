import 'package:flutter/material.dart';
import 'package:four_loyalty/data/model/user_model.dart';
import 'package:four_loyalty/data/preference/share_preference.dart';
import 'package:four_loyalty/data/resource/user_resource.dart';
import 'package:four_loyalty/helper/global_helper.dart';
import 'package:four_loyalty/ui/component/loading_component.dart';
import 'package:four_loyalty/ui/login/login_page.dart';

class Setting_page extends StatefulWidget {
  const Setting_page({super.key});

  @override
  State<Setting_page> createState() => _Setting_pageState();
}

class _Setting_pageState extends State<Setting_page> {
  late bool isLoading;
  late User_model user;

  void getAllData() async {
    setState(() {
      isLoading = true;
    });

    await Future.wait([getDataUser()]);

    setState(() {
      isLoading = false;
    });
  }

  Future getDataUser() async {
    final response = await User_resource.fetchMe();
    user = response.data;
  }

  @override
  void initState() {
    getAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: (isLoading)
            ? Loading_component()
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: CircleAvatar(
                            child: Icon(
                              Icons.person,
                              size: 75,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              user.name,
                              style:
                                  Global_helper.getTheme(context).headlineLarge,
                            ),
                            Text(
                              user.email,
                              style: Global_helper.getTheme(context).titleLarge,
                            )
                          ],
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          label: Text("Phone"), icon: Icon(Icons.phone)),
                      readOnly: true,
                      initialValue: user.phone,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          label: Text("Address"), icon: Icon(Icons.home)),
                      readOnly: true,
                      initialValue: user.address,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: () {
                          SharePreference.logout();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => Login_page()),
                              (Route<dynamic> route) => false);
                        },
                        child: Text("Logout"),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
