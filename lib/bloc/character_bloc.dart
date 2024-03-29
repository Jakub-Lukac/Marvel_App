import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:marvel_app/bloc/cubit/navigation_cubit.dart';

import 'package:marvel_app/config/marvel_config.dart';
import 'package:marvel_app/models/character.dart';
import 'package:marvel_app/services/marvel_service.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharactersLoading()) {
    on<LoadCharacters>(_onLoadCharacters);
    on<onTapCharacter>(_onTapCharacter);
  }

  void _onTapCharacter(onTapCharacter event, Emitter<CharacterState> emit) {
    emit(
      CharacterTapped(
        character: event.character,
      ),
    );
  }

  void _onLoadCharacters(
      LoadCharacters event, Emitter<CharacterState> emit) async {
    try {
      await Future.delayed(const Duration(seconds: 30));
      final dio = Dio();
      const publicKey = MarvelConfig.publicKey;
      const privateKey = MarvelConfig.privateKey;
      final timestamp = DateTime.now().microsecondsSinceEpoch.toString();
      final hash = generateMarvelHash(timestamp, privateKey, publicKey);

      final marvelService = MarvelService(dio);
      final Map<String, dynamic> response =
          await marvelService.getCharacters(timestamp, publicKey, hash);

      final List<Character> listOfCharacters =
          (response['data']['results'] as List)
              .map((characterJson) => Character.fromJson(characterJson))
              .toList();

      emit(
        CharactersLoaded(
          characters: listOfCharacters,
        ),
      );
    } catch (e) {
      emit(
        const CharacterError("Failed to load characters..."),
      );
    }
  }

  String generateMarvelHash(
      String timestamp, String privateKey, String publicKey) {
    final preHash = "$timestamp$privateKey$publicKey";
    final digest = md5.convert(utf8.encode(preHash));
    return digest.toString();
  }
}
