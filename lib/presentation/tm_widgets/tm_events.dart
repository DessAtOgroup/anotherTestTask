import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:pyrobite/presentation/four_o_four.dart';
import 'package:pyrobite/domain/model/tm.dart';
import 'package:flutter/material.dart';

class EventsWidget extends StatelessWidget {
  TradeMachine tradeMachine;
  EventsWidget({super.key, required this.tradeMachine});

  @override
  Widget build(BuildContext context) {
    List<Widget> _lW = [];
    _lW.addAll(List.generate(3, (index) {
      Events curEvent = tradeMachine.events[index];
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                stops: [0.01, 0.01], colors: [Colors.red, Colors.white]),
            borderRadius: BorderRadius.all(Radius.circular(4)),
            //border: Border(left: BorderSide(width: 2, color: Colors.red))
          ),
          child: ListTile(
            leading: Text(
              DateFormat.Hm().format(curEvent.dateTime),
              style: const TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            title: Text(
              curEvent.eventType,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              curEvent.additionInfo,
              style: const TextStyle(color: Colors.grey),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey,
            ),
          ),
        ),
      );
    }));
    return Column(children: _lW);
  }
}


//  shape: Border(left: BorderSide(width: 2, color: Colors.red)),