import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class NoFate404 extends StatelessWidget {
  const NoFate404({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: TextButton(
          child: Text('it\'s not a page you\'re looking for'),
          onPressed: () => Navigator.pop(context)),
    ));
  }
}
