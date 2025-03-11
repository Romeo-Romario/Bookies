import 'package:bookies/services/modules/adding_page_view/models/authors_recomendation.dart';
import 'package:bookies/services/modules/adding_page_view/widgets/author_input/author_recomendation_list_tile.dart';
import 'package:bookies/services/shared/db/data.dart';
import 'package:flutter/material.dart';

class AuthorPickerDialog extends StatefulWidget {
  const AuthorPickerDialog({super.key});

  @override
  State<AuthorPickerDialog> createState() => _AuthorPickerDialogState();
  static Future<PickedAuthor?> showAsDialog({required BuildContext context}) {
    return showDialog(
        context: context,
        builder: (context) {
          return AuthorPickerDialog();
        });
  }
}

class _AuthorPickerDialogState extends State<AuthorPickerDialog> {
  final AuthorsRecomendation authorsRecomendation = AuthorsRecomendation();
  final _controller = TextEditingController();
  // List<AuthorsInfoTableData>? authors;

  late Future<List<AuthorsInfoTableData>> authorsFuture;

  @override
  void initState() {
    _loadAuthors();
    super.initState();
  }

  void _loadAuthors() {
    authorsFuture = authorsRecomendation.getAuthors(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SizedBox(
          width: 450,
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                height: 240,
                child: AuthorRecomendationList(futureAuthors: authorsFuture),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.deepPurple, width: 1),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: TextFormField(
                        controller: _controller,
                        onChanged: (value) {
                          setState(() {
                            _loadAuthors();
                          });
                        },
                      )),
                      FloatingActionButton(
                        onPressed: () async {
                          Navigator.pop(
                            context,
                            PickedAuthor(
                              author: _controller.text,
                            ),
                          );
                        },
                        shape: CircleBorder(),
                        mini: true,
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PickedAuthor {
  final int? id;
  final String author;
  bool get existedInDatabase => id != null;

  PickedAuthor({this.id, required this.author});
}
