import 'package:bookies/data/entities/authors_list_entity.dart';
import 'package:bookies/data/entities/book_info_entity.dart';
import 'package:bookies/data/repository/authors_list_repository.dart';
import 'package:bookies/data/repository/authors_repository.dart';
import 'package:bookies/data/repository/book_repository.dart';
import 'package:bookies/data/repository/genre_repository.dart';
import 'package:bookies/features/book/add/logic/image_saver.dart';
import 'package:bookies/features/book/add/widgets/author_picker/author_picker_dialog.dart';
import 'package:bookies/features/book/add/widgets/author_picker/picked_author.dart';
import 'package:bookies/features/book/add/widgets/genre_picker_dialog.dart';
import 'package:bookies/features/book/add/widgets/image_picker.dart';
import 'package:bookies/features/book/add/widgets/input_pages_dialog.dart';
import 'package:bookies/features/book/add/widgets/labeled_container.dart';
import 'package:bookies/features/shared/widgets/expansion_chips/expansion_chips.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

class BookAddPage extends StatefulWidget {
  const BookAddPage({super.key});

  @override
  State<BookAddPage> createState() => _BookAddPageState();
}

class _BookAddPageState extends State<BookAddPage> {
  final BookRepository bookRepository = GetIt.I.get();
  final AuthorsRepository authorRepository = GetIt.I.get();
  final GenreRepository genreRepository = GetIt.I.get();
  final AuthorsListRepository authorsListRepository = GetIt.I.get();
  final bookNameController = TextEditingController();
  ImageSourceType imageSourceType = ImageSourceType.asset;
  int? numberOfPages;
  int? numberOfReadPages;
  String imagePath = "";

  PickedGenre? genre;

  final List<PickedAuthor> selectedAuthors = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        title: Text("Add book"),
        centerTitle: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20), // Round the bottom corners
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: onAddBook,
        heroTag: UniqueKey(),
        icon: Icon(Icons.add),
        label: Text("Add to libary"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              ImagePickerView(
                onImagePathChanged: (imagePath) => this.imagePath = imagePath,
                onImageSourceTypeChanged: (imageSourceType) =>
                    this.imageSourceType = imageSourceType,
              ),
              TextFormField(
                controller: bookNameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Input name of the book'),
              ),
              ExpansionChips.outlined(
                length: selectedAuthors.length,
                title: 'Authors',
                labelBuilder: (index) => Text(selectedAuthors[index].author),
                onTap: (index) {
                  setState(() {
                    selectedAuthors.removeAt(index);
                  });
                },
                onAddTap: () async {
                  final author = await AuthorPickerDialog.showAsDialog(
                    context: context,
                  );
                  setState(() {
                    if (author != null &&
                        checkContainedAuthor(selectedAuthors, author)) {
                      selectedAuthors.add(author);
                    }
                  });
                },
              ),
              LabeledContainer(
                label: genre?.genreName != null ? "Genre" : null,
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      side: BorderSide(color: Colors.deepPurple, width: 1),
                    ),
                    onPressed: () async {
                      genre = await GenrePickerDialog.showAsDialog(
                          context: context);
                      setState(() {});
                    },
                    label: Text(genre?.genreName ?? "Select Genre"),
                    icon: Icon(Icons.auto_fix_high_outlined),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 140,
                    height: 70,
                    child: LabeledContainer(
                      label: numberOfPages != null ? "Number of pages" : null,
                      child: SizedBox(
                        height: 50,
                        child: OutlinedButton(
                            onPressed: () async {
                              numberOfPages = await InputPagesDialog(
                                      message:
                                          "Enter number of pages \n in the book")
                                  .showAsDialog(context: context);
                              setState(() {});
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              side: BorderSide(
                                  color: Colors.deepPurple, width: 1),
                            ),
                            child: Center(
                              child: numberOfPages == null
                                  ? Text(
                                      "Enter number of pages",
                                      textAlign: TextAlign.center,
                                    )
                                  : Text(
                                      numberOfPages.toString(),
                                      style: TextStyle(fontSize: 18),
                                    ),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 140,
                    height: 70,
                    child: LabeledContainer(
                      label:
                          numberOfReadPages != null ? "Finished pages" : null,
                      child: SizedBox(
                        height: 50,
                        child: OutlinedButton(
                            onPressed: () async {
                              numberOfReadPages = await InputPagesDialog(
                                      message:
                                          "Enter number of finised \n pages in the book")
                                  .showAsDialog(context: context);
                              setState(() {});
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              side: BorderSide(
                                  color: Colors.deepPurple, width: 1),
                            ),
                            child: Center(
                              child: numberOfReadPages == null
                                  ? Text(
                                      "Enter number of finished pages",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 12),
                                    )
                                  : Text(
                                      numberOfReadPages.toString(),
                                      style: TextStyle(fontSize: 18),
                                    ),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future onAddBook() async {
    if (checkProperties()) {
      // Give the ability to user not to set read pages
      numberOfReadPages = numberOfReadPages ?? 0;

      for (var i = 0; i < selectedAuthors.length; i++) {
        if (!selectedAuthors[i].existedInDatabase) {
          selectedAuthors[i] = PickedAuthor(
              author: selectedAuthors[i].author,
              id: await authorRepository.add(selectedAuthors[i].author));
        }
      }

      int genreId = await genreRepository.add(genre!.genreName);

      final finalImagePath = imageSourceType == ImageSourceType.local
          ? await saveImage(imagePath)
          : imagePath;

      int bookId = await bookRepository.add(BookInfoEntity(
        bookId: null,
        folderId: null,
        bookName: bookNameController.text,
        imagePath: finalImagePath,
        imageSourceType: imageSourceType,
        readPages: numberOfReadPages!,
        numberOfPages: numberOfPages!,
        status: false,
        genreId: genreId,
        grade: 0,
      ));

      for (var element in selectedAuthors) {
        await authorsListRepository
            .add(AuthorsListEntity(bookId: bookId, authorId: element.id!));
      }
    }

    Navigator.pop(context);
  }

  bool checkProperties() {
    int _numberOfReadPages = numberOfPages ?? 0;
    if (bookNameController.text.isEmpty ||
        numberOfPages == null ||
        imagePath.isEmpty ||
        selectedAuthors.isEmpty ||
        genre == null) {
      alert(context);
      return false;
    }

    if (numberOfPages! <= 0 ||
        _numberOfReadPages < 0 ||
        numberOfPages! < _numberOfReadPages) {
      alert(context);
      return false;
    }
    return true;
  }

  void alert(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            "Wrong Input",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
        );
      },
    );
  }

  Future<String> saveImage(String imagePath) async {
    ImageSaver _imageSaver = ImageSaver();
    final imageName = await _imageSaver.saveImage(XFile(imagePath));
    final imageFile = await _imageSaver.getSavedImage(imageName);
    return imageFile.path;
  }

  bool checkContainedAuthor(
      List<PickedAuthor> authors, PickedAuthor pickedAuthor) {
    return authors.contains(pickedAuthor) ? false : true;
  }
}
