import 'package:flutter/material.dart';
import 'package:flutterpokedex/api/pokemon.dart';
import 'dart:async';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex Detail'),
        centerTitle: true,
      ),
      body: PokemonDetail(),
    );
  }
}

class PokemonDetail extends StatefulWidget {
  @override
  _PokemonDetail createState() => _PokemonDetail();
}

class _PokemonDetail extends State<PokemonDetail> {
  Map arg;
  Map details;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<Map> getData() async {
    Future.delayed(Duration.zero, () async {
      arg = ModalRoute.of(context).settings.arguments;
      Pokemon pokemonInstance = Pokemon();
      await pokemonInstance.getPokemonDetail(arg['url']);
      Map pokemonData = pokemonInstance.dataDetail;
      details = pokemonData;
      this.setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    arg = ModalRoute.of(context).settings.arguments;

    if (arg.containsKey('url')) {
      if (isLoading == false) {
        return Container(
          padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Attributes',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: [
                        for (var ability in details['abilities'])
                          Text('${ability['ability']['name']}')
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      } else {
        return Text('loading...');
      }
    }
  }
}
