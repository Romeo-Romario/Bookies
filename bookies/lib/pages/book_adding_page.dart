import 'package:bookies/services/modules/adding_page_view/widgets/image_picker.dart';
import 'package:bookies/services/shared/custom_enums/image_source_type.dart';
import 'package:flutter/material.dart';

class BookAddingPage extends StatefulWidget {
  const BookAddingPage({super.key});

  @override
  State<BookAddingPage> createState() => _BookAddingPageState();
}

class _BookAddingPageState extends State<BookAddingPage> {
  final bookNameController = TextEditingController();
  final bookAuthorController = TextEditingController();

  String? imagePath;
  ImageSourceType imageSourceType = ImageSourceType.asset;

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
        child: Form(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              ImagePickerView(
                onImagepathChanged: (imagePath) => this.imagePath = imagePath,
                onImageSourceTypeChanged: (imageSourceType) =>
                    this.imageSourceType = imageSourceType,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
                child: TextFormField(
                  controller: bookNameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Input name of the book'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 250,
                      child: TextFormField(
                        controller: bookAuthorController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Write the Author Name'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
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
              SizedBox(
                height: 20,
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
              SizedBox(
                height: 20,
              ),
              Container(
                width: 250,
                height: 45,
                child: FloatingActionButton(
                    onPressed: () {},
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
