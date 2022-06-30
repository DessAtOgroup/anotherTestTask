import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:pyrobite/presentation/tm_widgets/tm_load_level.dart';
import 'package:pyrobite/domain/model/tm.dart';
import 'package:pyrobite/domain/repository/tm_repository.dart';

class MyTestPage extends StatefulWidget {
  const MyTestPage({super.key});

  @override
  State<MyTestPage> createState() => _MyTestPageState();
}

class _MyTestPageState extends State<MyTestPage> with TickerProviderStateMixin {
  late Animation<double> myanimation;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this)
          ..forward();
    myanimation = Tween<double>(begin: 0, end: 85).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _) {
          return SafeArea(
            child: Scaffold(
                body: Center(
                    child: LoadBoxWidget(
              curAmount: myanimation,
              //inClip: WaveClipper(inStartPoint: myanimation.value),
            ))),
          );
        });
  }
}
