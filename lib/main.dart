import 'package:flutter/material.dart';
import 'package:pokedex/pokemon_details.dart';
import 'package:pokedex/pokemon_list.dart';

void main() {
  runApp(const Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pokedex',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87)),
        home: PokemonList(),
        routes: {'/details': (context) => PokemonDetails()});
  }
}
