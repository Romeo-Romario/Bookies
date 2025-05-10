import 'package:bookies/features/bookmark/detail/bookmark_detail.dart';
import 'package:bookies/features/bookmark/list/widgets/sort_style_popup_menu.dart';
import 'package:flutter/material.dart';

class BookmarksListPage extends StatefulWidget {
  BookmarksListPage({super.key});

  @override
  State<BookmarksListPage> createState() => _BookmarksListPageState();
}

class _BookmarksListPageState extends State<BookmarksListPage> {
  String selectedValue = 'newToOld';
  bool searchMode = false;
  final searchController = TextEditingController();
  final data = [
    {
      "title": "1",
      "text": "Gugugaga",
    },
    {
      "title": "2",
      "text": "Short example text for a bookmark.",
    },
    {
      "title": "3",
      "text": """This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.""",
    },
    {
      "title": "1",
      "text": "Gugugaga",
    },
    {
      "title": "2",
      "text": "Short example text for a bookmark.",
    },
    {
      "title": "3",
      "text": """This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.""",
    },
    {
      "title": "1",
      "text": "Gugugaga",
    },
    {
      "title": "2",
      "text": "Short example text for a bookmark.",
    },
    {
      "title": "3",
      "text": """This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.""",
    },
    {
      "title": "1",
      "text": "Gugugaga",
    },
    {
      "title": "2",
      "text": "Short example text for a bookmark.",
    },
    {
      "title": "3",
      "text": """This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.""",
    },
    {
      "title": "1",
      "text": "Gugugaga",
    },
    {
      "title": "2",
      "text": "Short example text for a bookmark.",
    },
    {
      "title": "3",
      "text": """This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.""",
    },
    {
      "title": "1",
      "text": "Gugugaga",
    },
    {
      "title": "2",
      "text": "Short example text for a bookmark.",
    },
    {
      "title": "3",
      "text": """This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.""",
    },
    {
      "title": "1",
      "text": "Gugugaga",
    },
    {
      "title": "2",
      "text": "Short example text for a bookmark.",
    },
    {
      "title": "3",
      "text": """This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.This is a much longer bookmark entry designed to
        test how the layout handles around 120 characters of text in a single field.""",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: Text("Bookmarks"),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () {
                setState(() {
                  searchMode = true;
                });
              },
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Icon(Icons.search_rounded, size: 30.0),
            ),
          ),
          SortStylePopupMenu(func: changeSortStyle)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookmarkDetail(
                  func: addBookMark,
                  option: true,
                ),
              ));
        },
        child: Icon(Icons.bookmark_add_outlined, size: 24.0),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
          setState(() => searchMode = false);
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (searchMode)
                TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    labelText: "Enter title of searched Bookmark",
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                    contentPadding: EdgeInsets.only(top: 12, left: 12),
                  ),
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return Card(
                      child: ListTile(
                        title: Text(item["title"]!),
                        subtitle: Text(
                          item["text"]!,
                          maxLines: 4,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeSortStyle(String? value) {
    if (value == null) {
      return;
    }
    setState(() {
      selectedValue = value;
    });
    // print(selectedValue);
  }

  void addBookMark() {
    setState(() {});
    Navigator.pop(context);
  }
}
