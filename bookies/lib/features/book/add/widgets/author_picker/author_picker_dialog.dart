import 'package:bookies/data/entities/author_entity.dart';
import 'package:bookies/data/repository/authors_repository.dart';
import 'package:bookies/features/book/add/widgets/author_picker/author_recomendation_list.dart';
import 'package:bookies/features/book/add/widgets/author_picker/picked_author.dart';
import 'package:bookies/data/source/drift/drift_app_database.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AuthorPickerDialog extends StatefulWidget {
  const AuthorPickerDialog({super.key});

  @override
  State<AuthorPickerDialog> createState() => _AuthorPickerDialogState();

  static Future<PickedAuthor?> showAsDialog({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AuthorPickerDialog();
      },
    );
  }
}

class _AuthorPickerDialogState extends State<AuthorPickerDialog> {
  final AuthorsRepository authorsRepository = GetIt.I.get();

  final _controller = TextEditingController();

  late Future<List<AuthorEntity>> authorsFuture;

  @override
  void initState() {
    _loadAuthors();
    super.initState();
  }

  void _loadAuthors() {
    authorsFuture = authorsRepository.search(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              width: double.infinity,
              height: 240,
              child: AuthorRecomendationList(
                futureAuthors: authorsFuture,
                onAddAuthor: (author) {
                  Navigator.pop(context, author);
                },
              ),
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
                        FocusScope.of(context).unfocus();
                        if (_controller.text.trim().isEmpty) {
                          Navigator.pop(context);
                        } else {
                          Navigator.pop(
                            context,
                            PickedAuthor(
                              author: _controller.text,
                            ),
                          );
                        }
                      },
                      shape: CircleBorder(),
                      mini: true,
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
