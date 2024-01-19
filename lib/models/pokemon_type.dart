import 'package:flutter/material.dart';

enum PokemonType {
  fire,
  grass,
  poison,
  ice,
  flying,
  psychic,
  water,
  bug,
  normal,
  electric,
  ground,
  fairy,
  steel,
  rock,
  fighting,
  ghost,
  dark,
  dragon,
  unknown
}

extension PokemonTypeProperties on PokemonType {
  List<Color> get backgroundColors {
    switch (this) {
      case PokemonType.fire:
        return [const Color(0xFFFD7D23)];

      case PokemonType.grass:
        return [const Color(0xFF9BCB50)];

      case PokemonType.poison:
        return [const Color(0xFFB880C9)];

      case PokemonType.ice:
        return [const Color(0xFF50C5E6)];

      case PokemonType.flying:
        return [const Color(0xFF3CC7EE), const Color(0xFFBEB9B9)];

      case PokemonType.psychic:
        return [const Color(0xFFF366B9)];

      case PokemonType.water:
        return [const Color(0xFF4592C3)];

      case PokemonType.bug:
        return [const Color(0xFF739E40)];

      case PokemonType.normal:
        return [const Color(0xFFA3ABAF)];

      case PokemonType.electric:
        return [const Color(0xFFEDD534)];

      case PokemonType.ground:
        return [const Color(0xFFF7DE3F), const Color(0xFFC09F0D)];

      case PokemonType.fairy:
        return [const Color(0xFFFDB9EA)];

      case PokemonType.steel:
        return [const Color(0xFF9DB7B9)];

      case PokemonType.rock:
        return [const Color(0xFFA48C21)];

      case PokemonType.fighting:
        return [const Color(0xFFD56724)];

      case PokemonType.ghost:
        return [const Color(0xFF7B62A3)];

      case PokemonType.dark:
        return [const Color(0xFF717071)];

      case PokemonType.dragon:
        return [const Color(0xFF54A4CF), const Color(0xFFF06E56)];

      case PokemonType.unknown:
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

      case PokemonType.water:
        return Colors.white;

      case PokemonType.bug:
        return Colors.white;

      case PokemonType.normal:
        return Colors.black;

      case PokemonType.electric:
        return Colors.black;

      case PokemonType.ground:
        return Colors.black;

      case PokemonType.fairy:
        return Colors.black;

      case PokemonType.steel:
        return Colors.black;

      case PokemonType.rock:
        return Colors.white;

      case PokemonType.fighting:
        return Colors.white;

      case PokemonType.ghost:
        return Colors.white;

      case PokemonType.dark:
        return Colors.white;

      case PokemonType.dragon:
        return Colors.white;

      case PokemonType.unknown:
        return Colors.redAccent;
    }
  }

  static const Map<String, PokemonType> map = {
    'fire': PokemonType.fire,
    'grass': PokemonType.grass,
    'poison': PokemonType.poison,
    'ice': PokemonType.ice,
    'flying': PokemonType.flying,
    'psychic': PokemonType.psychic,
    'water': PokemonType.water,
    'bug': PokemonType.bug,
    'normal': PokemonType.normal,
    'electric': PokemonType.electric,
    'ground': PokemonType.ground,
    'fairy': PokemonType.fairy,
    'steel': PokemonType.steel,
    'rock': PokemonType.rock,
    'fighting': PokemonType.fighting,
    'ghost': PokemonType.ghost,
    'dark': PokemonType.dark,
    'dragon': PokemonType.dragon
  };
}
