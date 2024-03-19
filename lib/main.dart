import 'package:flutter/material.dart';
import 'package:pokodex/pages/home_page.dart';
import 'package:pokodex/services/pokedex_api.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    PokeApi.getPokemon();
    return ScreenUtilInit(
      designSize: const Size(412, 732),
      builder: (context, widget) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokodex',
        theme: ThemeData.dark().copyWith(textTheme: GoogleFonts.latoTextTheme()),
        home: const HomePage(),
      ),
    );
  }
}
