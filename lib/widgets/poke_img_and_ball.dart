import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokodex/constant/ui_helper.dart';
import 'package:pokodex/model/pokemon_model.dart';

class PokeImageAndBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImageAndBall({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    String pokeballImagePath = 'assets/images/pokeball.png';
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            pokeballImagePath,
            width: UIHelpeer.calculatePokeImgAndBallSize(),
            height: UIHelpeer.calculatePokeImgAndBallSize(),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.img ?? '',
            child: CachedNetworkImage(
              imageUrl: pokemon.img ?? '',
              errorWidget: (context, url, error) => const Icon(Icons.error),
              width: UIHelpeer.calculatePokeImgAndBallSize(),
              height: UIHelpeer.calculatePokeImgAndBallSize(),
              placeholder: (context, url) => CircularProgressIndicator(
                color: UIHelpeer.getColorByType(pokemon.type![0]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
