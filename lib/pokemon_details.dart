import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_type.dart';
import 'package:pokedex/models/response.dart';
import 'package:pokedex/repo/pokemon_repo.dart';
import 'package:pokedex/utils/spaces.dart';
import 'package:pokedex/widgets/pokemon_details_box.dart';
import 'package:pokedex/widgets/pokemon_type_box.dart';
import 'package:pokedex/utils/String+.dart';
import 'models/pokemon_detail.dart';

class PokemonDetails extends StatelessWidget {
  final PokemonRepo pokemonRepo = PokemonRepo();

  PokemonDetails({super.key});

  void goBack(context) {
    Navigator.pushReplacementNamed(context, '/');
  }

  Widget typeSection(List<Type> types) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            types.length == 1 ? 'Type' : 'Types',
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          verticalSpacing(12.0),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              for (var type in types)
                PokemonTypeBox(pokemonType: getPokemonTypeCase(type))
            ],
          )
        ],
      ),
    );
  }

  PokemonType? getPokemonTypeCase(Type type) {
    return PokemonTypeProperties.map[type.type?.name] ?? PokemonType.unknown;
  }

  @override
  Widget build(BuildContext context) {
    final result = ModalRoute.of(context)?.settings.arguments as Result;
    return FutureBuilder<PokemonDetail>(
      future: pokemonRepo.fetchPokemonDetails(result?.url ?? ''),
      builder: (BuildContext context, AsyncSnapshot<PokemonDetail> snapshot) {
        if (snapshot.hasData) {
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
                      if (snapshot.data!.sprites!.other!.officialArtwork!
                              .frontDefault !=
                          null)
                        Image.network(
                          snapshot.data!.sprites!.other!.officialArtwork!
                                  .frontDefault ??
                              'No url',
                          height: 300.0,
                        ),
                      if (snapshot.data!.sprites!.other!.officialArtwork!
                              .frontDefault ==
                          null)
                        const CircularProgressIndicator(),
                      //Image.asset('assets/pokeball.png', height: 200.0),
                      PokemonDetailsBox(pokemonDetail: snapshot.data!),
                    ],
                  ),
                ),
                typeSection(snapshot.data!.types!)
              ]));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
