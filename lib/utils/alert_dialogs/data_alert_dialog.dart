import 'package:flutter/material.dart';

void showHashtagSuggestions({required BuildContext context, required List<String> textList}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Select a Hashtag'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: textList.map((suggestion) {
            return ListTile(
              title: Text('#$suggestion'),
              onTap: () {
                // _enteredText = _enteredText + '#$suggestion ';
                Navigator.pop(context);
              },
            );
          }).toList(),
        ),
      );
    },
  );
}
