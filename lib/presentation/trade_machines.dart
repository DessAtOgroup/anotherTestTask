import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyrobite/domain/model/tm.dart';
import 'package:pyrobite/domain/repository/tm_repository.dart';
import 'package:pyrobite/presentation/tm_widgets/tm_box.dart';
import 'package:pyrobite/presentation/tm_widgets/tm_events.dart';
import 'package:pyrobite/presentation/tm_widgets/tm_finances.dart';
import 'package:pyrobite/presentation/tm_widgets/tm_load_level.dart';
import 'package:pyrobite/presentation/four_o_four.dart';
import 'settings.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    TradeMachine curTradeMachine = TmRepository().getTm('13856646');

    return SafeArea(
      child: Scaffold(
        appBar:
            AppBar(leading: const Icon(Icons.arrow_back_outlined), actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SettingsWidget();
                  },
                );
              },
              icon: Icon(Icons.settings))
        ]),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Торговые автоматы',
                style: GoogleFonts.roboto(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            TMBoxWidget(tradeMachine: curTradeMachine),
            LoadLevelWidget(tradeMachine: curTradeMachine),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'События',
                style: GoogleFonts.roboto(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            EventsWidget(tradeMachine: curTradeMachine),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => NoFate404(),
                    ));
              },
              child: Text('Смотреть еще'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Финансы',
                style: GoogleFonts.roboto(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            FinancesWidget(tradeMachine: curTradeMachine),
          ]),
        ),
      ),
    );
  }
}
