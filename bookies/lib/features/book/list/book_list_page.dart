import 'dart:ffi';

import 'package:bookies/data/entities/book_info_entity.dart';
import 'package:bookies/data/entities/folder_entity.dart';
import 'package:bookies/data/repository/book_repository.dart';
import 'package:bookies/data/repository/folders_repository.dart';
import 'package:bookies/features/book/add/book_add_page.dart';
import 'package:bookies/features/book/detail/book_detail.dart';
import 'package:bookies/features/book/list/widgets/book_grid_view.dart';
import 'package:bookies/features/folder/add/folder_add_dialog.dart';
import 'package:bookies/features/folder/folder_grid_view/folder_grid_view.dart';
import 'package:bookies/features/statistics/bookies_statistics_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get_it/get_it.dart';

class BookListPage extends StatefulWidget {
  int? parentFolderId;
  String? parentFolderName;
  BookListPage({super.key, this.parentFolderId, this.parentFolderName});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  final BookRepository bookRepository = GetIt.I.get();
  final FoldersRepository foldersRepository = GetIt.I.get();

  late Future<List<BookInfoEntity>> booksFuture;
  late Future<List<FolderEntity>> foldersFuture;

  final GlobalKey<ExpandableFabState> _fabKey = GlobalKey<ExpandableFabState>();

  @override
  void initState() {
    super.initState();
    booksFuture = bookRepository.getAll(widget.parentFolderId);
    foldersFuture = foldersRepository.getAll(widget.parentFolderId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.parentFolderName == null
            ? Text("Libary")
            : Text(widget.parentFolderName!),
        centerTitle: true,
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        actions: [
          if (widget.parentFolderId == null)
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
            ),
          if (widget.parentFolderId != null)
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                    size: 30,
                    color: Colors.red[200],
                  )),
            )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: foldersFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return FolderGridView(
                      folders: snapshot.data!,
                      onTap: (entity) async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookListPage(
                              parentFolderId: entity.booksFolderId,
                              parentFolderName: entity.booksFolderName,
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Center();
                },
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
                          booksFuture =
                              bookRepository.getAll(widget.parentFolderId);
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
        key: _fabKey,
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
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BookAddPage.create(
                            folderId: widget.parentFolderId,
                          )),
                );
                setState(() {
                  booksFuture = bookRepository.getAll(widget.parentFolderId);
                });
                _fabKey.currentState?.toggle();
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
              onPressed: () async {
                await FolderAddDialog.showAsDialog(
                    context: context,
                    parentFolderId: widget.parentFolderId,
                    func: addFolder);
                _fabKey.currentState?.toggle();
              },
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
            ),
          )
        ],
      ),
    );
  }

  void addFolder(FolderEntity entity) {
    foldersRepository.add(entity: entity);
    setState(() {
      booksFuture = bookRepository.getAll(widget.parentFolderId);
      foldersFuture = foldersRepository.getAll(widget.parentFolderId);
    });
    Navigator.pop(context);
  }
}
