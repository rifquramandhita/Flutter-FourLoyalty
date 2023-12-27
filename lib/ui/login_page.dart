import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:four_loyalty/data/const.dart';
import 'package:four_loyalty/data/preference/share_preference.dart';
import 'package:four_loyalty/data/resource/auth_resource.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool isLoading;

  final _emailC = TextEditingController();
  final _passwordC = TextEditingController();

  void login() async {
    setState(() {
      isLoading = true;
    });
    final response = await AuthResource.login(_emailC.text, _passwordC.text);
    if (response.success) {
      SharePreference.setString(Const.PREF_USER_TOKEN, response.token!);
      final token = await SharePreference.getString(Const.PREF_USER_TOKEN);
      log(token ?? '');
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Failed"),
          content: Text(response.message),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("CLose"))
          ],
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return Scaffold(
      body: SafeArea(
        child: (isLoading)
            ? Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: CircularProgressIndicator(),
                ),
              )
            : Center(
                child: Card(
                  margin: EdgeInsets.all(20),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Text("Login", style: textTheme.headlineLarge),
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
