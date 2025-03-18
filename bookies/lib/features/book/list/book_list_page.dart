import 'package:bookies/data/entities/book_info_entity.dart';
import 'package:bookies/data/repository/book_repository.dart';
import 'package:bookies/features/book/list/widgets/book_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  final BookRepository bookRepository = GetIt.I.get();

  List<BookInfoEntity> books = [
    BookInfoEntity(
        bookId: 0,
        folderId: 0,
        bookName: "Witcher 1",
        imagePath: "assets/default_images/8.png",
        imageSourceType: ImageSourceType.asset,
        readPages: 100,
        numberOfPages: 322,
        status: false,
        authorId: 1,
        genreId: 1,
        grade: null),
    BookInfoEntity(
        bookId: 0,
        folderId: 0,
        bookName: "Witcher 2",
        imagePath: "assets/default_images/5.png",
        imageSourceType: ImageSourceType.asset,
        readPages: 333,
        numberOfPages: 333,
        status: true,
        authorId: 1,
        genreId: 1,
        grade: 4),
  ];

  late final Future<List<BookInfoEntity>> booksFuture;

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
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: booksFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return BookGridView(books: snapshot.data!);
            }

            return BookGridView(books: books);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, "/adding");
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
