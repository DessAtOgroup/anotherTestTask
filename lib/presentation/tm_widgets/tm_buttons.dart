import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

///Кнопка по дизайну по умолчанию прозрачная, текст синий , если закрашена, то текст белый
///text - надпись на кнопке
///bald - жирный или нет текст
///px - высота текста в кеглях
///filled -  закрашивать или нет поле в цвет.

@Deprecated('Использовать если ты дурачок и не знаешь OutlinedButton')
class ButtonsWidget extends StatelessWidget {
  String text;
  int px;
  bool filled = false;
  bool bald = false;
  Function? onPressed;

  ButtonsWidget(
      {super.key,
      required this.text,
      this.px = 14,
      this.filled = false,
      this.bald = false,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Expanded(
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 160, minHeight: px * 3),
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              color: (filled) ? Colors.blue : null,
              child: Center(
                  child: Text(
                text,
                style: TextStyle(
                    color: (filled) ? Colors.white : Colors.blue,
                    fontWeight: (bald) ? FontWeight.bold : FontWeight.normal),
              )),
              borderOnForeground: true),
        ),
      ),
      onTap: () {
        if (onPressed != null) {
          onPressed!.call();
        }
      },
    );
  }
}
