import 'package:flutter/material.dart';

class BookmarkDetail extends StatelessWidget {
  final func;
  final bool option; // "true" means add new | "false" means edit existing
  final int? id;

  final titileController = TextEditingController();
  final textController = TextEditingController();
  BookmarkDetail(
      {super.key, required this.func, required this.option, this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          icon: Icon(option ? Icons.bookmark_add : Icons.edit_note),
          label: Text(option ? "Add Bookmark" : "EditBookmark"),
          onPressed: func),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Bookmark options"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Created:"),
                Text(
                  " 2023-10-25",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 30,
          children: [TextFormField(), TextFormField()],
        ),
      ),
    );
  }
}
