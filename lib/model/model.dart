import 'package:english_words/english_words.dart';

class AppState {
  List<WordPair> names;
  Set<WordPair> saved;
  AppState(this.names, this.saved);
}
