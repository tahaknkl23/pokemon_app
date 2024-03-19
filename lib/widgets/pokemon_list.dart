import 'package:flutter/material.dart';
import 'package:pokodex/model/pokemon_model.dart';
import 'package:pokodex/widgets/pokelist_item.dart';

import '../services/pokedex_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> pokemonListFuture;

  @override
  void initState() {
    super.initState();
    pokemonListFuture = PokeApi.getPokemon();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("PokemonList build");
    return FutureBuilder<List<PokemonModel>>(
        future: pokemonListFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PokemonModel> pokemonList = snapshot.data!;

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: ScreenUtil().orientation == Orientation.portrait ? 2 : 3,
              ),
              itemBuilder: (context, index) {
                var oankiPokemon = pokemonList[index];
                return PokeListItem(pokemon: oankiPokemon);
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Hata Çikti"),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
