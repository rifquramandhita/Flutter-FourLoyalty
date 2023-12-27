import 'package:flutter/material.dart';

class GlobalHelper{
  static getTheme(BuildContext context){
    return Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
  }
}