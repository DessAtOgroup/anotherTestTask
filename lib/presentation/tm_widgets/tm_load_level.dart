import 'package:flutter/material.dart';
import 'package:pyrobite/domain/model/tm.dart';
import 'package:pyrobite/presentation/four_o_four.dart';
import 'dart:math';

/// Коробка с волной внутри, отображающая цифры и поднимающая волну от 0 до curAmount
class LoadBoxWidget extends AnimatedWidget {
  final Animation<double> curAmount;
  const LoadBoxWidget({
    required this.curAmount,
    super.key,
  }) : super(listenable: curAmount);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      SizedBox(
        height: 160,
        width: 160,
        child: Container(
          color: Colors.blue,
        ),
      ),
      ClipPath(
        child: Container(
          width: 160,
          height: 160,
          color: Colors.white,
        ),
        clipper: WaveClipper(inStartPoint: curAmount.value),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0),
        child: Text('${curAmount.value.toInt()}%',
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
      ),
    ]);
  }
}

class WaveClipper extends CustomClipper<Path> {
  final double inStartPoint;
  const WaveClipper({required this.inStartPoint});
  @override
  Path getClip(Size size) {
    double startPoint = 160 - 160 * (inStartPoint / 100);
    double vW = 20 * sin(inStartPoint / 10);
    Path path = Path();
    path.lineTo(0, startPoint);

    path.quadraticBezierTo(
        size.width / 4, startPoint - vW, size.width / 2, startPoint);
    path.quadraticBezierTo(
        3 / 4 * size.width, startPoint + vW, size.width, startPoint);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class LoadLevelWidget extends StatefulWidget {
  final TradeMachine tradeMachine;
  LoadLevelWidget({super.key, required this.tradeMachine});

  @override
  State<LoadLevelWidget> createState() => _LoadLevelWidgetState();
}

class _LoadLevelWidgetState extends State<LoadLevelWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animatedLoadLevel;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 4), vsync: this)
          ..forward();

    animatedLoadLevel =
        Tween<double>(begin: 0, end: widget.tradeMachine.loadLevel.toDouble())
            .animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          LoadBoxWidget(curAmount: animatedLoadLevel),
          Column(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 160),
                child: OutlinedButton(
                    child: const Text('Загрузка',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                    onPressed: () {}),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 160),
                child: OutlinedButton(
                    child: const Text('Инвентаризация',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const NoFate404(),
                          ));
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
