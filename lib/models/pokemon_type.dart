import 'package:flutter/material.dart';

enum PokemonType { fire, grass, poison, ice, flying, psychic }

extension PokemonTypeExtension on PokemonType {
  List<Color> get backgroundColors {
    switch (this) {
      case PokemonType.fire:
        return [Colors.orange];

      case PokemonType.grass:
        return [Colors.greenAccent];

      case PokemonType.poison:
        return [Colors.purpleAccent];

      case PokemonType.ice:
        return [Colors.lightBlueAccent];

      case PokemonType.flying:
        return [Colors.lightBlueAccent, Colors.grey];

      case PokemonType.psychic:
        return [Colors.pinkAccent];

      default:
        return [Colors.black];
    }
  }

  Color get textColor {
    switch (this) {
      case PokemonType.fire:
        return Colors.white;

      case PokemonType.grass:
        return Colors.black;

      case PokemonType.poison:
        return Colors.white;

      case PokemonType.ice:
        return Colors.black;

      case PokemonType.flying:
        return Colors.black;

      case PokemonType.psychic:
        return Colors.white;

      default:
        return Colors.redAccent;
    }
  }
}
