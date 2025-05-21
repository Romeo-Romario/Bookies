import 'package:bookies/data/entities/bookmark_entity.dart';
import 'package:bookies/data/repository/bookmark_repository.dart';
import 'package:bookies/features/bookmark/detail/bookmark_detail.dart';
import 'package:bookies/features/bookmark/list/widgets/sort_style_popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BookmarksListPage extends StatefulWidget {
  final int bookId;
  BookmarksListPage({super.key, required this.bookId});

  @override
  State<BookmarksListPage> createState() => _BookmarksListPageState();
}

class _BookmarksListPageState extends State<BookmarksListPage> {
  final BookmarkRepository bookmarkRepository = GetIt.I.get();

  late Future<List<BookmarkEntity>> bookmarksFuture;

  /* Sort type classifier
        1 - From new to old
        2 - From old to new
        3 - From A to Z
        4 - From Z to A
` */
  int selectedSortValue = 1;
  bool searchMode = false;
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bookmarksFuture = bookmarkRepository.search(
        widget.bookId, searchController.text, selectedSortValue);
  }

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
                  bookId: widget.bookId,
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
          setState(() {
            searchMode = false;
            bookmarksFuture = bookmarkRepository.search(
                widget.bookId, searchController.text, selectedSortValue);
          });
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
                    suffixIcon: searchController.text.isNotEmpty
                        ? IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              setState(() {
                                searchController.clear();
                              });
                            },
                          )
                        : null,
                  ),
                  onChanged: (_) => setState(() {
                    bookmarksFuture = bookmarkRepository.search(widget.bookId,
                        searchController.text, selectedSortValue);
                  }),
                ),
              FutureBuilder(
                future: bookmarksFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final bookmarks = snapshot.data!;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: bookmarks.length,
                        itemBuilder: (context, index) {
                          final item = bookmarks[index];
                          return Card(
                            child: ListTile(
                              title: Text(item.title!),
                              subtitle: Text(
                                item.text,
                                maxLines: 4,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }

                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text("Loading..."),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void changeSortStyle(int? value) {
    if (value == null) {
      return;
    }
    setState(() {
      selectedSortValue = value;
      bookmarksFuture = bookmarkRepository.search(
          widget.bookId, searchController.text, selectedSortValue);
    });
    // print(selectedValue);
  }

  void addBookMark() {
    Navigator.pop(context);
    setState(() {
      bookmarksFuture = bookmarkRepository.search(
          widget.bookId, searchController.text, selectedSortValue);
    });
  }
}
