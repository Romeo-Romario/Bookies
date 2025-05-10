import 'package:flutter/material.dart';

class BookmarksListPage extends StatefulWidget {
  BookmarksListPage({super.key});

  @override
  State<BookmarksListPage> createState() => _BookmarksListPageState();
}

class _BookmarksListPageState extends State<BookmarksListPage> {
  String selectedValue = 'newToOld';
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
              onPressed: () {},
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Icon(Icons.search_rounded, size: 30.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
            child: PopupMenuButton(
              icon: Icon(Icons.sort_rounded, size: 24.0),
              onSelected: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: "From new to old",
                  child: Card(
                      child: ListTile(
                    leading: Icon(Icons.date_range),
                    title: Text("From new to old"),
                  )),
                ),
                PopupMenuItem(
                  value: "From old to new",
                  child: Card(
                      child: ListTile(
                    leading: Icon(Icons.date_range_outlined),
                    title: Text("From old to new"),
                  )),
                ),
                PopupMenuItem(
                  value: "From A to Z",
                  child: Card(
                      child: ListTile(
                    leading: Icon(Icons.sort_by_alpha_outlined),
                    title: Text("From A to Z"),
                  )),
                ),
                PopupMenuItem(
                  value: "From Z to A",
                  child: Card(
                      child: ListTile(
                    leading: Icon(Icons.sort_by_alpha_rounded),
                    title: Text("From Z to A"),
                  )),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () {},
        child: Icon(Icons.bookmark_add_outlined, size: 24.0),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];
            return Card(
              child: ListTile(
                  title: Text(item["title"]!),
                  subtitle: Text(
                    item["text"]!,
                    maxLines: 3,
                    overflow: TextOverflow.fade,
                  )),
            );
          },
        ),
      ),
    );
  }
}
