import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_type.dart';
import 'package:pokedex/models/response.dart';
import 'package:pokedex/utils/spaces.dart';
import 'package:pokedex/widgets/pokemon_details_box.dart';
import 'package:pokedex/widgets/pokemon_type_box.dart';
import 'package:pokedex/utils/String+.dart';

class PokemonDetails extends StatelessWidget {
  final List<PokemonType> types = [PokemonType.grass, PokemonType.poison];

  PokemonDetails({super.key});

  void goBack(context) {
    Navigator.pushReplacementNamed(context, '/');
  }

  Widget typeSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Type',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          verticalSpacing(12.0),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              for (var type in types) PokemonTypeBox(pokemonType: type)
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final result = ModalRoute.of(context)?.settings.arguments as Result;
    return Scaffold(
        appBar: AppBar(
          title: Text(result.name?.capitalized() ?? "Pokemon Details"),
          backgroundColor: Colors.redAccent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                goBack(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: ListView(children: [
          Center(
            child: Column(
              children: [
                verticalSpacing(16.0),
                // TODO: add asset from network
                Image.asset('assets/pokeball.png', height: 200.0),
                PokemonDetailsBox(),
              ],
            ),
          ),
          typeSection()
        ]));
  }
}
