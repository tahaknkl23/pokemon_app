import 'package:flutter/material.dart';
import 'package:pokodex/constant/ui_helper.dart';
import 'package:pokodex/model/pokemon_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokodex/widgets/poke_information.dart';
import 'package:pokodex/widgets/poke_type_name.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    String pokeballImagePath = 'assets/images/pokeball.png';

    return ScreenUtil().orientation == Orientation.portrait
        ? _buildPortraitBody(context, pokeballImagePath)
        : _buildLandscapeBody(context, pokeballImagePath);
  }

  Scaffold _buildLandscapeBody(BuildContext context, String pokeballImagePath) {
    return Scaffold(
        backgroundColor: UIHelpeer.getColorByType(pokemon.type![0]),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: UIHelpeer.getIconPadiing(),
                child: IconButton(
                    iconSize: 18.w,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PokeNameType(pokemon: pokemon),
                          Expanded(
                            child: Hero(
                              tag: pokemon.img ?? '',
                              child: CachedNetworkImage(
                                imageUrl: pokemon.img ?? '',
                                height: 0.25.sw,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 5,
                        child: Padding(
                          padding: UIHelpeer.getDefaultPadiing(),
                          child: PokeInformation(pokemon: pokemon),
                        ))
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Scaffold _buildPortraitBody(BuildContext context, String pokeballImagePath) {
    return Scaffold(
      backgroundColor: UIHelpeer.getColorByType(pokemon.type![0]),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: UIHelpeer.getIconPadiing(),
            child: IconButton(
                iconSize: 18.w,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
          PokeNameType(pokemon: pokemon),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
              child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                height: 0.15.sh,
                child: Image.asset(
                  pokeballImagePath,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(bottom: 0, left: 0, right: 0, top: 0.12.sh, child: PokeInformation(pokemon: pokemon)),
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: pokemon.img ?? '',
                  child: CachedNetworkImage(
                    imageUrl: pokemon.img ?? '',
                    height: 0.25.sh,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              )
            ],
          )),
        ],
      )),
    );
  }
}
