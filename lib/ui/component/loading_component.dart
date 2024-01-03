import 'package:flutter/material.dart';

class Loading_component extends StatelessWidget {
  const Loading_component({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
          width: 150,
          height: 150,
          child: CircularProgressIndicator()),
    );
  }
}
