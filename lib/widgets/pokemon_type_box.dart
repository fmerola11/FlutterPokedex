import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_type.dart';
import 'package:pokedex/utils/String+.dart';

class PokemonTypeBox extends StatelessWidget {
  final PokemonType? pokemonType;

  const PokemonTypeBox({super.key, required this.pokemonType});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        width: 120,
        decoration: BoxDecoration(
            color: pokemonType?.backgroundColors.length == 1
                ? pokemonType?.backgroundColors.first
                : null,
            gradient: pokemonType!.backgroundColors.length > 1
                ? LinearGradient(
                    colors: pokemonType!.backgroundColors,
                    stops: const [0.5, 0.5],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                : null,
            borderRadius: BorderRadius.circular(10.0)),
        child: Center(
            child: Text(
          pokemonType!.name.capitalized(),
          style: TextStyle(
              fontWeight: FontWeight.w500, color: pokemonType?.textColor),
        )));
  }
}
