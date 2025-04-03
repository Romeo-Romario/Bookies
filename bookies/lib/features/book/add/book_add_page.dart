import 'package:bookies/data/entities/authors_list_entity.dart';
import 'package:bookies/data/entities/book_info_entity.dart';
import 'package:bookies/data/repository/authors_list_repository.dart';
import 'package:bookies/data/repository/authors_list_with_authors_repository.dart';
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
import 'package:flutter_rating/flutter_rating.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

class BookAddPage extends StatefulWidget {
  final BookInfoEntity? book;

  bool get isCreate => book == null;
  bool get isEdit => book != null;

  const BookAddPage.edit({super.key, required this.book});
  const BookAddPage.create({super.key}) : book = null;

  @override
  State<BookAddPage> createState() => _BookAddPageState();
}

class _BookAddPageState extends State<BookAddPage> {
  final BookRepository bookRepository = GetIt.I.get();
  final AuthorRepository authorRepository = GetIt.I.get();
  final GenreRepository genreRepository = GetIt.I.get();
  final AuthorsListRepository authorsListRepository = GetIt.I.get();
  final AuthorsListWithAuthorsRepository authorsListWithAuthorsRepository =
      GetIt.I.get();

  final bookNameController = TextEditingController();
  final feedbackController = TextEditingController();
  ImageSourceType imageSourceType = ImageSourceType.asset;
  String imagePath = "";
  final List<PickedAuthor> selectedAuthors = [];
  PickedGenre? genre;
  int? numberOfPages;
  int? numberOfReadPages;
  double rating = 0;
  bool pageMode = false;

  late final Future prepareEditFuture;

  List<PickedAuthor> editBookAuthors = []; //Compare with other final list
  Key resetKey = UniqueKey(); // Return starting image to image picker
  bool previosImageChanged = false;
  @override
  void initState() {
    super.initState();

    final book = widget.book;

    prepareEditFuture = book == null ? Future.value() : getPrepareEditFuture();

    if (book == null) {
      return;
    }

    bookNameController.text = book.bookName;
    feedbackController.text = book.feedback ?? '';

    imageSourceType = book.imageSourceType;
    imagePath = book.imagePath;

    rating = book.grade ?? 0;
    pageMode = book.status;
    numberOfPages = book.numberOfPages;
    numberOfReadPages = book.readPages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        title: SegmentedButton<String>(
          segments: const [
            ButtonSegment(
                value: "New", label: Text("New Book"), icon: Icon(Icons.add)),
            ButtonSegment(
                value: "Finished",
                label: Text("Finished"),
                // icon: Icon(Icons.done_all_rounded)),
                icon: Icon(Icons.book)),
          ],
          selected: {!pageMode ? "New" : "Finished"},
          onSelectionChanged: (newSelection) {
            setState(() {
              pageMode = newSelection.first == "New" ? false : true;
            });
          },
          multiSelectionEnabled: false,
        ),
      ),
      floatingActionButton: widget.isCreate
          ? FloatingActionButton.extended(
              onPressed: onAddBook,
              icon: Icon(Icons.add),
              label: Text("Add"),
            )
          : FloatingActionButton.extended(
              onPressed: onEditBook,
              icon: Icon(Icons.edit),
              label: Text("Edit"),
            ),
      body: FutureBuilder(
          future: prepareEditFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Text('Loading...'));
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Stack(
                      children: [
                        ImagePickerView(
                          key: resetKey,
                          initialPath: imagePath,
                          initialType: imageSourceType,
                          onImagePathChanged: (imagePath) =>
                              this.imagePath = imagePath,
                          onImageSourceTypeChanged: (imageSourceType) =>
                              this.imageSourceType = imageSourceType,
                          onPreviosImageChanged: (previosImageChanged) =>
                              setState(() => this.previosImageChanged =
                                  previosImageChanged),
                        ),
                        if (widget.book != null && previosImageChanged)
                          Positioned(
                            top: 8,
                            left: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                OutlinedButton.icon(
                                  onPressed: resetImagePicker,
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.white
                                        .withOpacity(0.8), // Semi-transparent
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size(50, 50),
                                  ),
                                  label: Icon(
                                      Icons.keyboard_double_arrow_left_sharp,
                                      size: 16),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    if (widget.book != null)
                      SizedBox(
                        height: 5,
                      ),
                    TextFormField(
                      controller: bookNameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter book title"),
                    ),
                    ExpansionChips.outlined(
                      length: selectedAuthors.length,
                      title: 'Authors',
                      labelBuilder: (index) =>
                          Text(selectedAuthors[index].author),
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
                            side:
                                BorderSide(color: Colors.deepPurple, width: 1),
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
                            label: numberOfPages != null
                                ? "Number of pages"
                                : null,
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
                        if (!pageMode)
                          SizedBox(
                            width: 140,
                            height: 70,
                            child: LabeledContainer(
                              label: numberOfReadPages != null
                                  ? "Finished pages"
                                  : null,
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
                    if (pageMode)
                      LabeledContainer(
                        label: "Rate the book:",
                        child: StarRating(
                          size: 50,
                          rating: rating,
                          allowHalfRating: true,
                          onRatingChanged: (rating) =>
                              setState(() => this.rating = rating),
                        ),
                      ),
                    if (pageMode)
                      SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: TextFormField(
                          controller: feedbackController,
                          decoration: InputDecoration(
                            labelText: "Write feedback",
                            border: OutlineInputBorder(),
                            alignLabelWithHint: true,
                            contentPadding: EdgeInsets.only(top: 12, left: 12),
                          ),
                          maxLines: null,
                          expands: true,
                          textAlignVertical: TextAlignVertical.top,
                        ),
                      ),
                    SizedBox(
                      height: 65,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Future getPrepareEditFuture() async {
    final book = widget.book;
    if (book == null) {
      return;
    }

    final asd = await genreRepository.search(widget.book!.genreId!);

    genre = PickedGenre(genreName: asd.name, id: asd.id);

    final map = await authorRepository.getAllByBook(book.bookId!);

    final res = map
        .map(
          (e) => PickedAuthor(author: e.fullName, id: e.id!),
        )
        .toList();

    selectedAuthors.addAll(res);
    editBookAuthors.addAll(selectedAuthors);
  }

  Future onAddBook() async {
    if (checkProperties() == false) {
      return;
    }

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
      status: pageMode ? true : false,
      feedback: pageMode ? feedbackController.text : null,
      genreId: genreId,
      grade: pageMode ? rating : null,
    ));

    for (var element in selectedAuthors) {
      await authorsListRepository
          .add(AuthorsListEntity(bookId: bookId, authorId: element.id!));
    }

    Navigator.pop(context);
  }

  Future onEditBook() async {
    if (checkProperties() == false) {
      return;
    }

    // Image
    String? finalImagePath;
    if (previosImageChanged &&
        widget.book!.imageSourceType != ImageSourceType.asset) {
      deletePreviousImage(widget.book!.imagePath);

      finalImagePath = imageSourceType == ImageSourceType.local
          ? await saveImage(imagePath)
          : imagePath;
    } else {
      finalImagePath = imageSourceType == ImageSourceType.local
          ? await saveImage(imagePath)
          : imagePath;
    }

    // Genre
    int? genreId = genre!.existedInDatabase
        ? genre!.id
        : await genreRepository.add(genre!.genreName);

    // Handle authors
    await checkAuthorsOnEdit(
        widget.book!.bookId!, selectedAuthors, editBookAuthors!);

    final result = BookInfoEntity(
      bookId: widget.book!.bookId,
      folderId: widget.book?.folderId,
      bookName: bookNameController.text,
      imagePath: finalImagePath,
      imageSourceType: imageSourceType,
      readPages: numberOfReadPages!,
      numberOfPages: numberOfPages!,
      status: pageMode ? true : false,
      feedback: pageMode ? feedbackController.text : null,
      genreId: genreId,
      grade: pageMode ? rating : null,
    );

    await bookRepository.update(result);
    Navigator.pop(context, result);
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

    // Check if user add finished page
    if (pageMode) {
      if (rating == 0) {
        alert(context);
        return false;
      }
      numberOfReadPages = numberOfPages;
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

  void deletePreviousImage(String imagepath) {
    ImageSaver imageSaver = ImageSaver();
    imageSaver.deleteImage(imagePath);
  }

  void resetImagePicker() {
    setState(() {
      imagePath = widget.book!.imagePath;
      imageSourceType = widget.book!.imageSourceType;
      resetKey = UniqueKey(); // Generates a new key to force widget rebuild
      previosImageChanged = false;
    });
  }

  // All actions with authorslist table and authors table on book edit
  Future<void> checkAuthorsOnEdit(int bookId, List<PickedAuthor> newAuthors,
      List<PickedAuthor> pastAuthors) async {
    //Add all new authors
    for (var i = 0; i < newAuthors.length; i++) {
      if (!newAuthors[i].existedInDatabase) {
        newAuthors[i] = PickedAuthor(
            author: newAuthors[i].author,
            id: await authorRepository.add(newAuthors[i].author));
      }
    }

    // Add new pairs in AuthorsListTable if nessesary
    for (var i = 0; i < newAuthors.length; i++) {
      if (!pastAuthors.contains(newAuthors[i])) {
        await authorsListRepository.add(
            AuthorsListEntity(bookId: bookId, authorId: newAuthors[i].id!));
      }
    }

    //Delete authors that was removed
    for (var i = 0; i < pastAuthors.length; i++) {
      if (!newAuthors.contains(pastAuthors[i])) {
        await authorsListRepository.deletePair(bookId, pastAuthors[i].id!);
      }
    }
  }
}
