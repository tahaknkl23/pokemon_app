import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokodex/model/pokemon_model.dart';

class PokeImageAndBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImageAndBall({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    String pokeballImagePath = 'assets/images/pokeball.png';
    return Stack(
      children: [
        Image.asset(pokeballImagePath),
        CachedNetworkImage(imageUrl: pokemon.img ?? ''),
      ],
    );
  }
}
