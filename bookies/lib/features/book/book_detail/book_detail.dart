import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookies/data/entities/authors_list_with_authors_entity.dart';
import 'package:bookies/data/entities/book_info_entity.dart';
import 'package:bookies/data/repository/authors_list_with_authors_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:get_it/get_it.dart';

class BookDetail extends StatefulWidget {
  const BookDetail({super.key, required this.bookInfo});
  final BookInfoEntity bookInfo;

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  late Future<List<AuthorsListWithAuthorsEntity>> futureAuthorslist;
  final AuthorsListWithAuthorsRepositoryImpl authorsListRepository =
      GetIt.I.get();
  @override
  void initState() {
    super.initState();
    futureAuthorslist =
        authorsListRepository.getAuthors(widget.bookInfo.bookId!);
  }

  @override
  Widget build(BuildContext context) {
    final image = switch (widget.bookInfo.imageSourceType) {
      ImageSourceType.asset => Image.asset(widget.bookInfo.imagePath),
      ImageSourceType.local => Image.file(File(widget.bookInfo.imagePath),
          width: 200, height: 200, fit: BoxFit.cover),
    };

    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.all(6.0),
          child: AutoSizeText(
            widget.bookInfo.bookName,
            maxLines: 2,
            minFontSize: 6,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
            child: FloatingActionButton(
              onPressed: () {},
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Icon(Icons.settings),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          spacing: 30,
          children: [
            // Section 1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  height: 200,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: image,
                ),
                SizedBox(
                  height: 200,
                  width: 220,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: widget.bookInfo.status ? 20 : 30,
                    children: [
                      Text(
                        !widget.bookInfo.status
                            ? "${widget.bookInfo.readPages}/${widget.bookInfo.numberOfPages}"
                            : "Finished", // Depents on book status
                        style: TextStyle(
                          color: Colors.green[900],
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      if (!widget.bookInfo.status)
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit_note_outlined,
                            size: 30,
                          ),
                          label: Text(
                            "Update progress",
                            style: TextStyle(fontSize: 16),
                          ),
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            minimumSize: Size(20, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      if (widget.bookInfo.status)
                        SizedBox(
                          height: 80,
                          child: Center(
                              child: Column(
                            children: [
                              StarRating(
                                starCount: 3,
                                size: 40,
                                rating: widget.bookInfo.grade!,
                                allowHalfRating: true,
                              ),
                              StarRating(
                                starCount: 2,
                                size: 40,
                                rating: widget.bookInfo.grade! - 3,
                                allowHalfRating: true,
                              )
                            ],
                          )),
                        )
                    ],
                  ),
                )
              ],
            ),
            // Section 2
            if (!widget.bookInfo.status)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {},
                    label: Text(
                      "Add bookmark",
                      style: TextStyle(fontSize: 16),
                    ),
                    icon: Icon(
                      Icons.bookmark_add_outlined,
                      size: 20,
                    ),
                    style: OutlinedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      minimumSize: Size(20, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {},
                    label: Text(
                      "Bookmarks",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    icon: Icon(
                      Icons.collections_bookmark_outlined,
                      size: 20,
                    ),
                    style: OutlinedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      minimumSize: Size(20, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  )
                ],
              ),
            if (widget.bookInfo.status)
              OutlinedButton.icon(
                onPressed: () {},
                label: Text(
                  "Bookmarks",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                icon: Icon(
                  Icons.collections_bookmark_outlined,
                  size: 25,
                ),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 100),
                  minimumSize: Size(70, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            // Section 3
            Card(
              child: FutureBuilder(
                future: futureAuthorslist,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      snapshot.connectionState == ConnectionState.active) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Error"));
                  }
                  final data = snapshot.data;

                  return ListTile(
                    leading: Icon(Icons.account_circle_outlined),
                    title: Text(data!.length == 1 ? "Author" : "Authors"),
                    subtitle: Text(
                      data
                          .map((author) => author.authorEntity!.fullName)
                          .join("\n"),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
