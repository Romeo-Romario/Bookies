import 'package:flutter/material.dart';

class BookmarkDetail extends StatelessWidget {
  final VoidCallback? func;
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 20,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text("Created"), Text(" 2023-10-25")],
              ),
              TextFormField(
                controller: titileController,
                decoration: InputDecoration(
                  labelText: "Bookmark titile",
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.only(top: 12, left: 12),
                ),
                maxLines: 1,
                // expands: true,
                textAlignVertical: TextAlignVertical.top,
              ),
              SizedBox(
                height: 500,
                width: double.infinity,
                child: TextFormField(
                  controller: textController,
                  decoration: InputDecoration(
                    labelText: "Bookmark main text",
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                    contentPadding: EdgeInsets.only(top: 12, left: 12),
                  ),
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                ),
              ),
              SizedBox(
                height: 40.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
