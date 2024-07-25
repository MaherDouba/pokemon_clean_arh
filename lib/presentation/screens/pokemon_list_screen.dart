import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/pokemon.dart';
import '../bloc/pokemon_bloc.dart';
import '../widgets/pokemon_card.dart';

class PokemonListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PokemonLoaded) {
            return ListView.builder(
              itemCount: state.pokemons.length,
              itemBuilder: (context, index) {
                final pokemon = state.pokemons[index];
                return PokemonCard(pokemon: pokemon);
              },
            );
          } else if (state is PokemonError) {
            return Center(child: Text('Failed to fetch pokemons'));
          }
          return Container();
        },
      ),
    );
  }
}
