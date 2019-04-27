import 'package:copname/action/action.dart';
import 'package:copname/container/container.dart';
import 'package:copname/middleware/middleware.dart';
import 'package:copname/model/model.dart';
import 'package:copname/reducer/reducer.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

void main() {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState(
      List<WordPair>(),
      Set<WordPair>(),
    ),
    middleware: [
      LoggingMiddleware.printer(),
      TypedMiddleware<AppState, GenerateNameAction>(generateNameMiddleare),
      TypedMiddleware<AppState, ResetNameAction>(resetNameMiddleware),
    ],
  );

  runApp(StoreProvider<AppState>(
    store: store,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "copname",
      home: RandomWordsContainer(),
    );
  }
}
