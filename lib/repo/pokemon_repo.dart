import 'dart:convert';
import 'package:flutter/cupertino.dart';

import '../models/response.dart';
import 'package:http/http.dart' as http;

class PokemonRepo {
  final responseURL = "https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0";

  Future<Response> fetchResponse() async {
    try {
      var url = Uri.parse(responseURL);

      final response = await http.get(url);

      print(response.body);

      if (response.statusCode == 200) {
        final Response decodedResponse =
            Response.fromJson(jsonDecode(response.body));
        return decodedResponse;
      } else {
        throw Exception('API not successful :(');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
