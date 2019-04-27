import 'package:english_words/english_words.dart';

class GenerateNameAction {}

class AddNameAction {
  final List<WordPair> names;
  AddNameAction(this.names);
}

class FavoriteNameAction {
  WordPair name;
  FavoriteNameAction(this.name);
}

class UnfavoriteNameAction {
  WordPair name;
  UnfavoriteNameAction(this.name);
}

class SetNameAction {
  final List<WordPair> names;
  SetNameAction(this.names);
}

class ResetNameAction {}
