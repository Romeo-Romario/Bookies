import 'package:flutter/material.dart';

class AuthorPickerDialog extends StatefulWidget {
  const AuthorPickerDialog({super.key});

  @override
  State<AuthorPickerDialog> createState() => _AuthorPickerDialogState();
  static Future<String?> showAsDialog(
      {required BuildContext context, String? author}) {
    return showDialog(
        context: context,
        builder: (context) {
          return AuthorPickerDialog();
        });
  }
}

class _AuthorPickerDialogState extends State<AuthorPickerDialog> {
  String? author;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SizedBox(
          width: 400,
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.purple,
                ),
                width: double.infinity,
                height: 240,
                //TODO: add list of authors
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.deepPurple, width: 1),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child: TextFormField()),
                      SizedBox(
                        width: 10,
                      ),
                      FloatingActionButton(
                        onPressed: () {},
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
