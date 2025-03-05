import 'package:bookies/services/modules/adding_page_view/models/image_saver.dart';
import 'package:bookies/services/modules/adding_page_view/widgets/author_picker_dialog.dart';
import 'package:bookies/services/modules/adding_page_view/widgets/image_picker.dart';
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
  String? imagePath;
  AuthorsInfoTableData? author;
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            spacing: 20,
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
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 25),
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
                label: Text(author?.author_fullname ?? "Select Author"),
                icon: Icon(Icons.account_circle_outlined),
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: FloatingActionButton(
                  onPressed: () {},
                  heroTag: UniqueKey(),
                  child: Text("Pick Genre"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 100,
                    height: 50,
                    color: Colors.purple[300],
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    color: Colors.purple[300],
                  ),
                ],
              ),
              Container(
                width: 250,
                height: 45,
                child: FloatingActionButton(
                    onPressed: () {
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
