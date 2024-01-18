import 'package:flutter/material.dart';
import '../utils/spaces.dart';

class PokemonDetailsBox extends StatelessWidget {
  final Map<String, String> row1Map = {'Height': '0,7 m', 'Category': 'Seed'};
  final Map<String, String> row2Map = {
    'Weight': '6,9 kg',
    'Ability': 'Overgrow'
  };

  PokemonDetailsBox({super.key});

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
        boxColumn(map.keys.elementAt(1), map.values.elementAt(1),
            CrossAxisAlignment.end, MainAxisAlignment.end)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> array = [row1Map, row2Map];
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
            for (var item in array) ...{
              boxRow(item),
              if (item != array.last) verticalSpacing(20.0)
            }
          ],
        ),
      ),
    );
  }
}
