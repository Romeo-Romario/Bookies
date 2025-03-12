import 'package:bookies/services/modules/adding_page_view/models/image_saver.dart';
import 'package:bookies/services/modules/adding_page_view/widgets/author_picker_dialog.dart';
import 'package:bookies/services/modules/adding_page_view/widgets/genre_picker_dialog.dart';
import 'package:bookies/services/modules/adding_page_view/widgets/image_picker.dart';
import 'package:bookies/services/modules/adding_page_view/widgets/input_pages_dialog.dart';
import 'package:bookies/services/modules/adding_page_view/widgets/labeled_container.dart';
import 'package:bookies/services/shared/custom_enums/image_source_type.dart';
import 'package:bookies/services/shared/db/data.dart';
import 'package:flutter/material.dart';

class BookAddingPage extends StatefulWidget {
  const BookAddingPage({super.key});

  @override
  State<BookAddingPage> createState() => _BookAddingPageState();
}

class _BookAddingPageState extends State<BookAddingPage> {
  final bookNameController = TextEditingController();
  ImageSourceType imageSourceType = ImageSourceType.asset;
  int? numberOfPages;
  int? numberOfReadPages;
  String? imagePath;
  PickedAuthor? author;
  PickedGenre? genre;
  //TODO: use ImageSaver
  ImageSaver _imageSaver = ImageSaver();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              ImagePickerView(
                onImagepathChanged: (imagePath) => this.imagePath = imagePath,
                onImageSourceTypeChanged: (imageSourceType) =>
                    this.imageSourceType = imageSourceType,
              ),
              TextFormField(
                controller: bookNameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Input name of the book'),
              ),
              LabeledContainer(
                label: author?.author != null ? "Author" : null,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    side: BorderSide(color: Colors.deepPurple, width: 1),
                  ),
                  onPressed: () async {
                    author =
                        await AuthorPickerDialog.showAsDialog(context: context);
                    setState(() {});
                  },
                  label: Text(author?.author ?? "Select Author"),
                  icon: Icon(Icons.account_circle_outlined),
                ),
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
              Container(
                width: 250,
                height: 45,
                child: FloatingActionButton(
                    onPressed: () async {
                      //TODO: Save the image that will be used by book
                    },
                    heroTag: UniqueKey(),
                    child: Text("Add to libary")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
