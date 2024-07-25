import 'package:flutter/material.dart';
import '../../domain/entities/pokemon.dart';
//import '../pages/pokemon_detail_page.dart';
import '../screens/pokemon_detail_screen.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  PokemonCard({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(pokemon.imageUrl),
        title: Text(pokemon.name),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PokemonDetailPage(pokemon: pokemon),
            ),
          );
        },
      ),
    );
  }
}
