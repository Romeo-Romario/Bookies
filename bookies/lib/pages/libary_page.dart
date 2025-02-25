import 'package:bookies/services/modules/libary/models/book_info.dart';
import 'package:bookies/services/modules/libary/widgets/display_books_in_liabry.dart';
import 'package:bookies/services/shared/db/data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LibaryPage extends StatefulWidget {
  const LibaryPage({super.key});

  @override
  State<LibaryPage> createState() => _LibaryPageState();
}

class _LibaryPageState extends State<LibaryPage> {
  List<BookInfo> books = [
    BookInfo(
        bookId: 0,
        booksFolderId: 0,
        bookName: "Witcher 1",
        imagePath: "assets/default_images/8.png",
        imageSourceType: ImageSourceType.asset,
        readPages: 100,
        numberOfPages: 322,
        status: false,
        authorId: 1,
        genreId: 1,
        grade: null),
    BookInfo(
        bookId: 0,
        booksFolderId: 0,
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
  @override
  void initState() {
    super.initState();
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
        child: GridView.builder(
            primary: false,
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              mainAxisSpacing: 10.0, // Vertical spacing between grid items
              crossAxisSpacing: 10.0, // Horizontal spacing between grid items
              childAspectRatio: 3 / 4,
            ),
            itemCount: books.length,
            itemBuilder: (context, index) {
              final element = books[index];
              // return cards.map((el) => BookInfoView(element: el)).toList(),}
              return BookLibaryView(element: element);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final db = Database();

          for (var el in await db.select(db.genresInfoTable).get()) {
            print(el);
          }
          for (var el in await db.select(db.booksFolderInfoTable).get()) {
            print(el);
          }
        },
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
