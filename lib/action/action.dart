import 'package:english_words/english_words.dart';
import 'dart:convert';

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
