import 'package:flutter/material.dart';

class DialogHelper {
  static showCustomDialog(BuildContext context, String title, String content,
      IconData icon, List<Widget> listAction) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(icon),
        title: Text(title),
        content: Text(content),
        actions: listAction,
      ),
    );
  }
}
