import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookies/data/entities/author_entity.dart';
import 'package:bookies/data/entities/book_info_entity.dart';
import 'package:bookies/data/entities/genre_entity.dart';
import 'package:bookies/data/repository/authors_repository.dart';
import 'package:bookies/data/repository/book_repository.dart';
import 'package:bookies/data/repository/genre_repository.dart';
import 'package:bookies/features/book/add/book_add_page.dart';
import 'package:bookies/features/book/add/widgets/labeled_container.dart';
import 'package:bookies/features/book/detail/widgets/finish_book_page.dart';
import 'package:bookies/features/book/detail/widgets/update_progress_dialog.dart';
import 'package:bookies/features/bookmark/detail/bookmark_detail.dart';
import 'package:bookies/features/bookmark/list/bookmark_list_page.dart';
import 'package:bookies/features/shared/navigation/navigator_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:get_it/get_it.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BookDetail extends StatefulWidget {
  final int bookId;

  const BookDetail({super.key, required this.bookId});

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  late BookInfoEntity bookInfo;
  late List<AuthorEntity> authors;
  late GenreEntity genre;
  late Future initFuture;

  int? updatedPages;
  final AuthorRepository authorRepository = GetIt.I.get();
  final GenreRepository genreRepository = GetIt.I.get();
  final BookRepository bookRepository = GetIt.I.get();

  double animatedReadPages = 0;
  @override
  void initState() {
    super.initState();
    initFuture = loadFuture();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return success();
        }
        return Scaffold(
          body: Center(child: Text("Loading...")),
        );
      },
    );
  }

  void onEditPageTab() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookAddPage.edit(book: bookInfo),
      ),
    );

    if (result == null) {
      return;
    }

    if (result is BookInfoEntity) {
      setState(() {
        initFuture = loadFuture();
      });
    }
  }

  Future loadFuture() async {
    final bookId = widget.bookId;
    bookInfo = (await bookRepository.getOne(bookId))!;
    authors = await authorRepository.getAllByBook(bookId);
    genre = await genreRepository.search(bookInfo.genreId!);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        animatedReadPages = 0; // reset first
      });

      Future.delayed(Duration(milliseconds: 100), () {
        setState(() {
          animatedReadPages = bookInfo.readPages.toDouble();
        });
      });
    });
  }

  Widget success() {
    final image = switch (bookInfo.imageSourceType) {
      ImageSourceType.asset => Image.asset(bookInfo.imagePath),
      ImageSourceType.local => Image.file(File(bookInfo.imagePath),
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
            bookInfo.bookName,
            maxLines: 2,
            minFontSize: 6,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
            child: FloatingActionButton(
              onPressed: onEditPageTab,
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Icon(Icons.settings),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 30,
            children: [
              // Section 1
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Hero(
                    tag: bookInfo.bookId.toString(),
                    child: Container(
                      width: 150,
                      height: 200,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: image,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: bookInfo.status ? 20 : 30,
                      children: [
                        bookInfo.status
                            ? Text(
                                "Finished",
                                style: TextStyle(
                                  color: Colors.green[900],
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TweenAnimationBuilder<double>(
                                    tween: Tween(
                                        begin: 0,
                                        end: bookInfo.readPages.toDouble()),
                                    duration: Duration(milliseconds: 1500),
                                    builder: (context, value, child) {
                                      return Text(
                                        value.toInt().toString(),
                                        style: TextStyle(
                                          color: Colors.green[900],
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      );
                                    },
                                  ),
                                  Text(
                                    " / ${bookInfo.numberOfPages}",
                                    style: TextStyle(
                                      color: Colors.green[900],
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                        if (!bookInfo.status)
                          OutlinedButton.icon(
                            onPressed: onUpdate,
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
                                  vertical: 12, horizontal: 12),
                              minimumSize: Size(20, 60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        if (bookInfo.status)
                          SizedBox(
                            height: 80,
                            child: Center(
                                child: Column(
                              children: [
                                StarRating(
                                  starCount: 3,
                                  size: 40,
                                  rating: bookInfo.grade!,
                                  allowHalfRating: true,
                                ),
                                StarRating(
                                  starCount: 2,
                                  size: 40,
                                  rating: bookInfo.grade! - 3,
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
              if (!bookInfo.status)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () async {
                        final result = await context.push(
                          (context) => BookmarkDetail(
                            bookId: widget.bookId,
                            func: () => Navigator.pop(context, true),
                            option: true,
                          ),
                        );
                        if (result != null && result == true) {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    BookmarksListPage(bookId: widget.bookId),
                              ));
                        }
                      },
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookmarksListPage(
                              bookId: widget.bookId,
                            ),
                          ),
                        );
                      },
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
              if (bookInfo.status)
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
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 90),
                    minimumSize: Size(70, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              // Section 3
              Card(
                child: ListTile(
                  leading: Icon(Icons.account_circle_outlined),
                  title: Text(authors.length == 1 ? "Author" : "Authors"),
                  subtitle: Text(
                    authors.map((author) => author.fullName).join("\n"),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.auto_fix_high_outlined),
                  title: Text("Genre: "),
                  subtitle: Text(genre.name),
                ),
              ),
              if (bookInfo.status)
                LabeledContainer(
                  label: "Feedback",
                  labelSize: 22,
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      constraints: BoxConstraints(
                        minHeight: 100,
                      ),
                      child: bookInfo.feedback!.isEmpty
                          ? Center(
                              child: Text("No feedback"),
                            )
                          : Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                bookInfo.feedback!,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ))),
                )
            ],
          ),
        ),
      ),
    );
  }

  //TODO: go to sleep
  Future onUpdate() async {
    final data;

    updatedPages = await showUpdateDialog(
        context: context,
        numberOfPages: bookInfo.numberOfPages,
        readPages: bookInfo.readPages);

    if (updatedPages == null) {
      return;
    }

    checkUpdatePages();

    if (updatedPages! >= bookInfo.numberOfPages) {
      data = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FinishBookPage(
              bookName: bookInfo.bookName,
            ),
          ));
      if (data == null) {
        updatedPages = bookInfo.readPages;
        return;
      }

      bookRepository.update(BookInfoEntity(
          bookId: bookInfo.bookId,
          folderId: bookInfo.folderId,
          bookName: bookInfo.bookName,
          imagePath: bookInfo.imagePath,
          imageSourceType: bookInfo.imageSourceType,
          readPages: bookInfo.numberOfPages,
          numberOfPages: bookInfo.numberOfPages,
          status: true,
          feedback: data["feedback"],
          genreId: bookInfo.genreId,
          grade: data["rating"]));
    }

    await bookRepository.updatePages(bookInfo.bookId!, updatedPages!);

    setState(() {
      initFuture = loadFuture();
    });
  }

  Future checkUpdatePages() async {
    if (updatedPages! < bookInfo.readPages) {
      updatedPages = bookInfo.readPages;
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                "You cannot read backwards",
                textAlign: TextAlign.center,
              ),
              alignment: Alignment.center,
            );
          });
    }
    if (updatedPages! > bookInfo.numberOfPages) {
      updatedPages = bookInfo.numberOfPages;
    }
  }
}
