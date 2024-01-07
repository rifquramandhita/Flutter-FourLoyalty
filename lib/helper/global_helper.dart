import 'package:flutter/material.dart';

class Global_helper{
  static TextTheme getTheme(BuildContext context){
    return Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
  }
}