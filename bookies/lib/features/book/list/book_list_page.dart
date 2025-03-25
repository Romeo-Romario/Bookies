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

  List<BookInfoEntity> books = [];

  late Future<List<BookInfoEntity>> booksFuture;

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
