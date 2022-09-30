import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class SavedWords extends StatefulWidget {
  const SavedWords({required this.savedList, required this.callback, Key? key})
      : super(key: key);
  final Set<WordPair> savedList;
  final Function(WordPair) callback;

  @override
  State<SavedWords> createState() => _SavedWordsState();
}

class _SavedWordsState extends State<SavedWords> {
  late Set<WordPair> _saved;
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    _saved = widget.savedList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Suggestions'),
      ),
      body: ListView.builder(
          itemCount: _saved.length,
          itemBuilder: (context, index) {
            WordPair pair = _saved.elementAt(index);
            return ListTile(
              title: Text(
                pair.asPascalCase,
                style: _biggerFont,
              ),
              trailing: const Icon(
                Icons.favorite,
                color: Colors.red,
                semanticLabel: 'Remove from saved',
              ),
              onTap: () {
                widget.callback(pair);
                setState(() {
                  _saved.remove(pair);
                });
              },
            );
          }),
    );
  }
}
