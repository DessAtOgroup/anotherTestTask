class Events {
  late DateTime dateTime; //
  String eventType = '';
  String additionInfo = '';

  Events(this.dateTime, this.eventType, this.additionInfo);
}

class Finance {
  double moneyAmount = 0;
  String financeType = '';
  Finance(this.moneyAmount, this.financeType);
}

class TradeMachine {
  String status = '';
  String type = '';
  String destination = '';
  String id = '';
  String name = '';
  String busType = '';
  String sigLevel = '';
  String modem = '';

  int loadLevel = 0;
  List<Events> events = [];
  List<Finance> finance = [];

  TradeMachine.empty();

  TradeMachine(
      {required this.status,
      required this.type,
      required this.destination,
      required this.id,
      required this.name,
      required this.busType,
      required this.sigLevel,
      required this.modem,
      required this.loadLevel,
      required this.events,
      required this.finance});

  //todo мапа для отображения статуса и типа на русском языке. через геттер

}
