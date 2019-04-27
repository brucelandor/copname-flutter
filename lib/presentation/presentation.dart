import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  final List<WordPair> names;
  final Set<WordPair> saved;
  final Function(WordPair wp) onFavorite;
  final Function(WordPair wp) onUnfavorite;
  final Function() onGenerateNames;
  final Function() onResetNames;

  RandomWords(this.names, this.saved, this.onFavorite, this.onUnfavorite,
      this.onGenerateNames, this.onResetNames);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        widget.onGenerateNames();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("copnames"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SavedNames(widget.saved.toList());
                  },
                ),
              );
            },
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          widget.onResetNames();
          return;
        },
        child: ListView.separated(
          controller: _controller,
          itemCount: widget.names.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text(widget.names[i].asPascalCase),
              trailing: widget.saved.contains(widget.names[i])
                  ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : Icon(Icons.favorite_border),
              onTap: widget.saved.contains(widget.names[i])
                  ? () {
                      widget.onUnfavorite(widget.names[i]);
                    }
                  : () {
                      widget.onFavorite(widget.names[i]);
                    },
            );
          },
          separatorBuilder: (context, i) {
            return Divider();
          },
        ),
      ),
    );
  }
}

class SavedNames extends StatelessWidget {
  final List<WordPair> names;
  SavedNames(this.names);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("saved"),
      ),
      body: ListView.separated(
        itemCount: names.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(names[i].asPascalCase),
          );
        },
        separatorBuilder: (context, i) {
          return Divider();
        },
      ),
    );
  }
}
