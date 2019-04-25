import 'package:copname/action/action.dart';
import 'package:english_words/english_words.dart';
import 'package:redux/redux.dart';

generateNameMiddleare<AppState>(
    Store<AppState> store, GenerateNameAction action, NextDispatcher next) {
  List<WordPair> names = List();
  for (int i = 0; i < 20; i++) {
    final wp = WordPair.random();
    names.add(wp);
  }
  final addAction = AddNameAction(names);
  store.dispatch(addAction);
  next(action);
}
