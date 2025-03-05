import 'package:bookies/services/modules/libary/models/book_info.dart';
import 'package:bookies/services/modules/libary/widgets/libary_books_view/display_books_in_liabry.dart';
import 'package:bookies/services/shared/custom_enums/image_source_type.dart';
import 'package:flutter/material.dart';

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
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 3 / 4,
            ),
            itemCount: books.length,
            itemBuilder: (context, index) {
              final element = books[index];
              return BookLibaryView(element: element);
            }),
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
