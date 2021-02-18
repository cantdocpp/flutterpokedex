import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Pokemon {
  String url = 'https://pokeapi.co/api/v2';
  Map data;
  Map dataDetail;

  Future<String> getPokemon() async {
    try {
      String endpoint = url + '/pokemon';
      var response = await http.get(endpoint);
      Map responseJson = jsonDecode(response.body);
      data = responseJson;
    } catch (err) {
      print(err);
    }
  }

  Future<String> getPokemonDetail(String endpoint) async {
    try {
      print(endpoint);
      var response = await http.get(endpoint);
      Map responseJson = jsonDecode(response.body);
      dataDetail = responseJson;
    } catch (err) {
      print(err);
    }
  }
}
