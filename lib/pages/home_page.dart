import 'package:flutter/material.dart';
import 'package:pokodex/widgets/app_title.dart';

import '../widgets/pokemon_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Column(
            children: const [
              AppTitle(),
              Expanded(child: PokemonList()),
            ],
          );
        },
      ),
    );
  }
}
