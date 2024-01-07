import 'package:flutter/material.dart';
import 'package:four_loyalty/const.dart';
import 'package:four_loyalty/data/preference/share_preference.dart';
import 'package:four_loyalty/data/resource/auth_resource.dart';
import 'package:four_loyalty/helper/dialog_helper.dart';
import 'package:four_loyalty/helper/global_helper.dart';
import 'package:four_loyalty/ui/component/loading_component.dart';
import 'package:four_loyalty/ui/home/home_page.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  late bool isLoading;

  final _emailC = TextEditingController();
  final _passwordC = TextEditingController();

  void login() async {
    setState(() {
      isLoading = true;
    });
    final response = await Auth_resource.login(_emailC.text, _passwordC.text);
    if (response.success) {
      SharePreference.setString(Const.PREF_USER_TOKEN, response.token!);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home_page(),
          ));
    } else {
      Dialog_helper.showCustomDialog(
        context,
        "Failed",
        response.message,
        Icons.error,
        [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("CLose"))
        ],
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  void isLogined() async {
    setState(() {
      isLoading = true;
    });
    final token = await SharePreference.getString(Const.PREF_USER_TOKEN);
    if (token != null){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home_page(),
          ));
    } else{
      setState(() {
        isLoading = false;
      });
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogined();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: (isLoading)
            ? Loading_component()
            : Center(
                child: Card(
                  margin: EdgeInsets.all(20),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Text("Login",
                            style:
                                Global_helper.getTheme(context).headlineLarge),
                        TextFormField(
                          controller: _emailC,
                          decoration: InputDecoration(
                            icon: Icon(Icons.mail),
                            label: Text("Email"),
                          ),
                        ),
                        TextFormField(
                          controller: _passwordC,
                          obscureText: true,
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            label: Text("Password"),
                          ),
                        ),
                        Container(
                          height: 30,
                        ),
                        FilledButton.icon(
                            onPressed: () {
                              login();
                            },
                            icon: Icon(Icons.login),
                            label: Text("Login"))
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
