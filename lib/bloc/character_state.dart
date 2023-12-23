part of 'character_bloc.dart';

sealed class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

final class CharactersLoading extends CharacterState {}

final class CharactersLoaded extends CharacterState {
  final List<Character> characters;

  const CharactersLoaded({this.characters = const <Character>[]});

  @override
  List<Object> get props => [characters];
}

final class CharacterError extends CharacterState {
  final String errorMessage;

  const CharacterError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
