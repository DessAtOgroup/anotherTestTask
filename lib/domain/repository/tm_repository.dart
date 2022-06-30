import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pyrobite/domain/model/tm.dart';

///не интерфейс т.к. никакой модели данных нет, здесь просто получаем данные.
class TmRepository {
  TradeMachine getTm(@required String inID) {
    if (inID == '13856646') {
      return TradeMachine(
          status: 'Не работает',
          type: 'Снековый',
          destination: 'ТЦ Мега, Химки',
          id: '13856646',
          name: '544546485',
          busType: 'MDB',
          sigLevel: 'Стабильный',
          modem: '54654213545',
          loadLevel: 100,
          events: [
            Events(
                DateTime.parse('2012-02-27 14:10:00'), 'Сейф переполнен', ' '),
            Events(DateTime.parse('2012-02-27 11:25:00'),
                'Сломался купюроприемник', '213545864'),
            Events(DateTime.parse('2012-02-27 11:11:00'), 'Закончилась наличка',
                'что-нибудь еще')
          ],
          finance: [
            Finance(5700, 'Деньги в ТА'),
            Finance(1234, 'Сдача'),
            Finance(332, 'Что-то невошедшее в экран'),
            Finance(332, 'еще больше невошедшего'),
            Finance(332, 'еще больше невошедшего'),
            Finance(332, 'еще больше невошедшего'),
          ]);
    } else {
      return TradeMachine.empty();
    }
  }
}
