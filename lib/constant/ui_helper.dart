import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelpeer {
  UIHelpeer._();
  static double getAppTitleWidgetHeight() {
    return ScreenUtil().orientation == Orientation.portrait ? 0.15.sh : 0.15.sh;
  }

  static const Map<String, Color> typeColorMap = {
    'Grass': Colors.green,
    'Poison': Colors.deepPurpleAccent,
    'Fire': Colors.redAccent,
    'Flying': Colors.blue,
    'Water': Colors.blue,
    'Bug': Colors.lightGreenAccent,
    'Normal': Colors.black26,
    'Electric': Colors.yellow,
    'Ground': Colors.brown,
    'Fairy': Colors.pinkAccent,
    'Fighting': Colors.orange,
    'Psychic': Colors.indigo,
    'Rock': Colors.grey,
    'Steel': Colors.blueGrey,
    'Ice': Colors.lightBlueAccent,
    'Ghost': Colors.purpleAccent,
    'Dragon': Colors.deepPurple,
    'Dark': Colors.black45,
  };
  static Color getColorByType(String type) {
    if (typeColorMap.containsKey(type)) {
      return typeColorMap[type] ?? Colors.pink.shade300;
    } else {
      return Colors.pink.shade300;
    }
  }

  static EdgeInsets getDefaultPadiing() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.all(12.h);
    } else {
      return EdgeInsets.all(8.w);
    }
  }

  static EdgeInsets getIconPadiing() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.all(10.h);
    } else {
      return EdgeInsets.all(4.w);
    }
  }

  static double calculatePokeImgAndBallSize() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return 02.sw;
    } else {
      return 0.3.sh;
    }
  }
}
