import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:pyrobite/domain/model/tm.dart';

class TMBoxWidget extends StatelessWidget {
  TradeMachine tradeMachine;
  TMBoxWidget({super.key, required this.tradeMachine});

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      color: Colors.white,
      child: Column(
        children: [
          Align(
              child: Text(tradeMachine.type,
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
              alignment: Alignment.topRight),
          Align(
              child: Text(tradeMachine.name,
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              alignment: Alignment.topLeft),
          Align(
              child: Row(children: [
                Icon(
                  Icons.circle,
                  color: Colors.red,
                ),
                Text(tradeMachine.status, style: TextStyle(fontSize: 14))
              ]),
              alignment: Alignment.topLeft),
          Align(
              child: Text(tradeMachine.destination,
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
              alignment: Alignment.topLeft),
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              children: [
                Text('Тип шины', style: TextStyle(fontFamily: 'Roboto')),
                Text(tradeMachine.busType,
                    style: TextStyle(fontFamily: 'Roboto'))
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
          Row(
            children: [Text('Уровень сигнала'), Text(tradeMachine.sigLevel)],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          Row(
            children: [Text('Идентификатор'), Text(tradeMachine.id)],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          Row(
            children: [Text('Модем'), Text(tradeMachine.modem)],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ],
      ),
    );
  }
}
