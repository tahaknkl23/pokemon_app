import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokodex/constant/constants.dart';
import 'package:pokodex/constant/ui_helper.dart';

class AppTitle extends StatefulWidget {
  const AppTitle({super.key});

  @override
  State<AppTitle> createState() => _AppTitleState();
}

class _AppTitleState extends State<AppTitle> {
  String pokeballImagePath = 'assets/images/pokeball.png';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelpeer.getAppTitleWidgetHeight(),
      child: Stack(
        children: [
          Padding(
            padding: UIHelpeer.getDefaultPadiing(),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Constants.title,
                style: Constants.getTitleTextStyle(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              pokeballImagePath,
              width: ScreenUtil().orientation == Orientation.portrait ? 0.2.sw : 0.2.sw,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
