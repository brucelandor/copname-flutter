import 'package:copname/action/action.dart';
import 'package:copname/model/model.dart';
import 'package:english_words/english_words.dart';
import 'package:redux/redux.dart';

AppState favoriteNameReducer(AppState state, FavoriteNameAction action) {
  return AppState(
      state.names,
      Set<WordPair>()
        ..addAll(state.saved)
        ..add(action.name));
}

AppState unfavoriteNameReducer(AppState state, UnfavoriteNameAction action) {
  return AppState(
    state.names,
    Set<WordPair>()
      ..addAll(state.saved)
      ..remove(action.name),
  );
}

AppState addNameReducer(AppState state, AddNameAction action) {
  return AppState(
      List<WordPair>()
        ..addAll(state.names)
        ..addAll(action.names)
        ..toList(),
      state.saved);
}

AppState setNameReducer(AppState state, SetNameAction action) {
  return AppState(action.names, Set());
}

final Reducer<AppState> appReducer = combineReducers([
  TypedReducer<AppState, FavoriteNameAction>(favoriteNameReducer),
  TypedReducer<AppState, UnfavoriteNameAction>(unfavoriteNameReducer),
  TypedReducer<AppState, AddNameAction>(addNameReducer),
  TypedReducer<AppState, SetNameAction>(setNameReducer),
]);
