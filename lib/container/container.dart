import 'package:copname/action/action.dart';
import 'package:copname/model/model.dart';
import 'package:copname/presentation/presentation.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class RandomWordsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _RandomWordsContainerViewModel>(
      onInit: (store) {
        store.dispatch(GenerateNameAction());
      },
      converter: (Store<AppState> store) {
        return _RandomWordsContainerViewModel.generate(
            store, store.state.names, store.state.saved);
      },
      builder: (context, vm) {
        return RandomWords(vm.names, vm.saved, vm.onFavorite, vm.onUnfavorite,
            vm.onGenerateNames);
      },
    );
  }
}

class _RandomWordsContainerViewModel {
  final List<WordPair> names;
  final Set<WordPair> saved;
  Function(WordPair wp) onFavorite;
  Function(WordPair) onUnfavorite;
  Function onGenerateNames;

  _RandomWordsContainerViewModel(
      {this.names,
      this.saved,
      this.onFavorite,
      this.onUnfavorite,
      this.onGenerateNames});

  _RandomWordsContainerViewModel.generate(
      Store<AppState> store, this.names, this.saved) {
    onFavorite = (WordPair wp) {
      final action = FavoriteNameAction(wp);
      store.dispatch(action);
    };
    onUnfavorite = (WordPair wp) {
      final action = UnfavoriteNameAction(wp);
      store.dispatch(action);
    };
    onGenerateNames = () {
      store.dispatch(GenerateNameAction());
    };
  }
}
