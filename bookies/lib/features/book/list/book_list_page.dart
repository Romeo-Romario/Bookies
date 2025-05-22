import 'dart:ffi';

import 'package:bookies/data/entities/book_info_entity.dart';
import 'package:bookies/data/entities/folder_entity.dart';
import 'package:bookies/data/repository/book_repository.dart';
import 'package:bookies/features/book/detail/book_detail.dart';
import 'package:bookies/features/book/list/widgets/book_grid_view.dart';
import 'package:bookies/features/folder/folder_grid_view/folder_grid_view.dart';
import 'package:bookies/features/statistics/bookies_statistics_page.dart';
import 'package:flutter/material.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, "/adding");
          setState(() {
            booksFuture = bookRepository.getAll();
          });
        },
        heroTag: UniqueKey(),
        foregroundColor: Colors.deepPurpleAccent,
        child: Center(
          child: Image.asset(
            "assets/custom_icons/add_book.png",
            width: 30,
            color: Colors.purple[800],
          ),
        ),
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
