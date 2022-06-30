import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:pyrobite/domain/model/tm.dart';

class FinCard extends StatelessWidget {
  String title;
  String matitle;

  FinCard({super.key, required this.title, required this.matitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(children: [
        Icon(Icons.money),
        Column(
          children: [Text(title), Text(matitle)],
        )
      ]),
    );
  }
}

class FinancesWidget extends StatelessWidget {
  TradeMachine tradeMachine;
  FinancesWidget({super.key, required this.tradeMachine});

  @override
  Widget build(BuildContext context) {
    List<Finance> _f = tradeMachine.finance;
    List<Widget> lW = [];
    lW = List.generate(
      _f.length,
      (index) => FinCard(
          title: _f[index].moneyAmount.toString(),
          matitle: _f[index].financeType.toString()),
    );
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: lW,
      ),
    );
  }
}
