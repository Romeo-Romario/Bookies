import 'package:bookies/data/entities/bookmark_entity.dart';
import 'package:bookies/data/repository/bookmark_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BookmarkDetail extends StatelessWidget {
  final int bookId;
  final VoidCallback func;
  final bool option; // "true" means add new | "false" means edit existing
  final BookmarkEntity? bookmark;

  final titileController = TextEditingController();
  final textController = TextEditingController();
  BookmarkRepository bookmarkRepository = GetIt.I.get();

  BookmarkDetail(
      {super.key,
      required this.bookId,
      required this.func,
      required this.option,
      this.bookmark});

  @override
  Widget build(BuildContext context) {
    if (bookmark != null) {
      titileController.text = bookmark?.title ?? "";
      textController.text = bookmark?.text ?? "";
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          icon: Icon(option ? Icons.bookmark_add : Icons.edit_note),
          label: Text(option ? "Add Bookmark" : "EditBookmark"),
          onPressed: () => onSubmit(context)),
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
              if (!option)
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

  void onSubmit(BuildContext context) {
    if (titileController.text.isEmpty || textController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Input Error"),
          content: Text("Both title and text fields must be filled."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK"),
            ),
          ],
        ),
      );
      return;
    }

    if (bookmark == null) {
      bookmarkRepository.add(
          bookId, titileController.text, textController.text);
      func();
    } else {
      bookmarkRepository.update(
          bookmark!.id!, titileController.text, textController.text);
      func();
    }
  }
}
