import 'package:flutter/material.dart';
import 'package:pokedex/repo/pokemon_repo.dart';
import 'package:pokedex/models/response.dart';

class PokemonList extends StatefulWidget {
  PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  final String viewTitle = "Pokedex";
  late List<Result> pokemonList;
  late List<Result> displayedPokemonList;
  final PokemonRepo pokemonRepo = PokemonRepo();

  void showPokemonDetail(Result result) {
    Navigator.pushReplacementNamed(context, '/details', arguments: result);
  }

  @override
  void initState() {
    super.initState();
    pokemonList = [];
    displayedPokemonList = [];
    fetchPokemonList();
  }

  void fetchPokemonList() async {
    final response = await pokemonRepo.fetchResponse();
    if (response != null && response.results != null) {
      setState(() {
        pokemonList = response.results!;
        displayedPokemonList = pokemonList;
      });
    }
  }

  void searchPokemon(String query) {
    setState(() {
      displayedPokemonList = pokemonList
          .where((pokemon) =>
              pokemon.name!.toUpperCase().contains(query.toUpperCase()))
          .toList();
    });
  }

  Widget searchBar() {
    return TextField(
      onChanged: searchPokemon,
      decoration: InputDecoration(
        labelText: 'Search Pokemon',
        prefixIcon: const Icon(Icons.search),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          viewTitle,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: searchBar(),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    showPokemonDetail(displayedPokemonList[index]);
                  },
                  child: ListTile(
                    title: Text(
                      displayedPokemonList[index].name!.toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('assets/pokeball.png'),
                    ),
                  ),
                );
              },
              itemCount: displayedPokemonList.length,
            ),
          ),
        ],
      ),
    );
  }
}
