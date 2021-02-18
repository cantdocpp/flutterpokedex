import 'package:flutter/material.dart';
import 'package:flutterpokedex/api/pokemon.dart';
import 'dart:async';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex App'),
        centerTitle: true,
      ),
      body: new PokemonList(),
    );
  }
}

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  List pokemonLists;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<Map> getData() async {
    Pokemon pokemonInstance = Pokemon();
    await pokemonInstance.getPokemon();
    Map pokemonData = pokemonInstance.data;
    List pokemonDataResult = pokemonData['results'];
    pokemonLists = pokemonDataResult;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
        child: Row(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: pokemonLists.length,
                itemBuilder: (context, index) {
                  return FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/detail',
                          arguments: {'url': pokemonLists[index]['url']});
                    },
                    child: Text('${pokemonLists[index]['name']}'),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
