import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_detail.dart';
import '../utils/spaces.dart';
import 'package:pokedex/utils/String+.dart';

class PokemonDetailsBox extends StatelessWidget {
  final PokemonDetail pokemonDetail;

  const PokemonDetailsBox({super.key, required this.pokemonDetail});

  Widget boxColumn(title, value, CrossAxisAlignment crossAlignment,
      MainAxisAlignment mainAlignment) {
    return Column(
      crossAxisAlignment: crossAlignment,
      mainAxisAlignment: mainAlignment,
      children: [
        Text(title,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20.0)),
        verticalSpacing(8),
        Text(value,
            style: const TextStyle(color: Colors.black, fontSize: 18.0)),
      ],
    );
  }

  Widget boxRow(Map<String, String> map) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        boxColumn(map.keys.elementAt(0), map.values.elementAt(0),
            CrossAxisAlignment.start, MainAxisAlignment.start),
        if (map.length > 1)
          boxColumn(map.keys.elementAt(1), map.values.elementAt(1),
              CrossAxisAlignment.end, MainAxisAlignment.end)
      ],
    );
  }

  Map<String, String> createRow1Map() {
    final Map<String, String> map = {
      'Height': '${pokemonDetail.height! / 10} m',
      'Weight': '${pokemonDetail.weight! / 10} kg',
    };
    return map;
  }

  Map<String, String> createRow2Map() {
    final Map<String, String> map = {
      'Ability': pokemonDetail.abilities?.first.ability?.name?.capitalized() ??
          "No ability"
    };
    return map;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> mapArray = [
      createRow1Map(),
      createRow2Map()
    ];
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.lightBlue),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (var item in mapArray) ...{
              boxRow(item),
              if (item != mapArray.last) verticalSpacing(20.0)
            }
          ],
        ),
      ),
    );
  }
}
