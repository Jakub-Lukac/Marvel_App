part of 'character_bloc.dart';

sealed class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object> get props => [];
}

class LoadCharacters extends CharacterEvent {
  final List<Character> characters;

  const LoadCharacters({this.characters = const <Character>[]});

  @override
  List<Object> get props => [characters];
}
