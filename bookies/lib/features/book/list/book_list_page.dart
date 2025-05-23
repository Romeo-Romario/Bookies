import 'dart:ffi';

import 'package:bookies/data/entities/book_info_entity.dart';
import 'package:bookies/data/entities/folder_entity.dart';
import 'package:bookies/data/repository/book_repository.dart';
import 'package:bookies/features/book/detail/book_detail.dart';
import 'package:bookies/features/book/list/widgets/book_grid_view.dart';
import 'package:bookies/features/folder/folder_grid_view/folder_grid_view.dart';
import 'package:bookies/features/statistics/bookies_statistics_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get_it/get_it.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  final BookRepository bookRepository = GetIt.I.get();

  late Future<List<BookInfoEntity>> booksFuture;

  final folderElements = [
    FolderEntity(booksFolderId: 0, booksFolderName: "Fantasy"),
    FolderEntity(booksFolderId: 0, booksFolderName: "Science Fiction"),
    FolderEntity(booksFolderId: 0, booksFolderName: "Romance"),
  ];

  @override
  void initState() {
    super.initState();
    booksFuture = bookRepository.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Libary"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StatisticPage(),
                    ),
                  );
                },
                icon: Icon(Icons.stacked_line_chart_rounded)),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FolderGridView(
                folders: folderElements,
                onTap: (entity) {},
              ),
              FutureBuilder(
                future: booksFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return BookGridView(
                      books: snapshot.data!,
                      onTap: (entity) async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BookDetail(bookId: entity.bookId!),
                          ),
                        );
                        setState(() {
                          booksFuture = bookRepository.getAll();
                        });
                      },
                    );
                  }

                  return Center(
                    child: Text("Loading..."),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        type: ExpandableFabType.up,
        overlayStyle: ExpandableFabOverlayStyle(
          color: Colors.white.withOpacity(0.9),
        ),
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.add),
          fabSize: ExpandableFabSize.regular,
          shape: const CircleBorder(),
        ),
        closeButtonBuilder: FloatingActionButtonBuilder(
          size: 56,
          builder: (BuildContext context, void Function()? onPressed,
              Animation<double> progress) {
            return IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.check_circle_outline,
                size: 40,
              ),
            );
          },
        ),
        children: [
          SizedBox(
            height: 70,
            width: 120,
            child: FloatingActionButton.large(
              onPressed: () async {
                await Navigator.pushNamed(context, "/adding");
                setState(() {
                  booksFuture = bookRepository.getAll();
                });
              },
              heroTag: null, // You can change this
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Add book",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    "assets/custom_icons/add_book.png",
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
              height: 70,
              width: 120,
              child: FloatingActionButton.large(
                onPressed: () {},
                heroTag: null,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 5,
                  children: [
                    Text(
                      "Add Folder",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      Icons.folder,
                      size: 24,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class Folder {
  int? parentFolderId;
  String name;
  int numberOfElements;

  Folder(
      {this.parentFolderId,
      required this.name,
      required this.numberOfElements});
}
