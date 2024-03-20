import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokodex/constant/constants.dart';
import 'package:pokodex/constant/ui_helper.dart';
import 'package:pokodex/model/pokemon_model.dart';
import 'package:pokodex/pages/detail.page.dart';
import 'package:pokodex/widgets/poke_img_and_ball.dart';

class PokeListItem extends StatelessWidget {
  const PokeListItem({super.key, required this.pokemon});
  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage(pokemon: pokemon)));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.w),
        ),
        elevation: 3,
        shadowColor: Colors.white,
        color: UIHelpeer.getColorByType(pokemon.type![0]),
        child: Padding(
          padding: UIHelpeer.getDefaultPadiing(),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              pokemon.name ?? 'N/A',
              style: Constants.getPokemonNameTextStyle(),
            ),
            Chip(label: Text(pokemon.type![0])),
            Expanded(child: PokeImageAndBall(pokemon: pokemon)),
          ]),
        ),
      ),
    );
  }
}
