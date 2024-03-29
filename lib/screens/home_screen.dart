import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/bloc/character_bloc.dart';
import 'package:marvel_app/config/color_pallete.dart';
import 'package:marvel_app/widgets/character_card.dart';
import 'package:marvel_app/widgets/skeleton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CharacterBloc, CharacterState>(
      listener: (context, state) {
        if (state is CharacterTapped) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: build(context)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "MARVEL CHARACTERS",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 3,
              color: ColorPallete.textColor,
            ),
          ),
        ),
        body: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
            if (state is CharactersLoading) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemBuilder: (context, index) {
                    return const Skeleton();
                  },
                  itemCount: 10,
                ),
              );
            }

            if (state is CharactersLoaded) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemBuilder: (context, index) {
                    return CharacterCard(
                      name: state.characters[index].name,
                      imageUrl: state.characters[index].imageUrl,
                    );
                  },
                  itemCount: state.characters.length,
                ),
              );
            }
            if (state is CharacterError) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: ColorPallete.textColor,
                  ),
                ),
              );
            }

            // To get rid of error "Not all codepaths return a value."
            return Container();
          },
        ),
      ),
    );
  }
}
