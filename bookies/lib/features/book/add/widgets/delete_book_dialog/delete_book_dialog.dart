import 'package:flutter/material.dart';

class DeleteBookDialog extends StatelessWidget {
  final String? bookname;
  final int bookId;
  final void Function(int bookId) func;

  const DeleteBookDialog(
      {super.key, this.bookname, required this.bookId, required this.func});

  static Future showAsDialog({
    required BuildContext context,
    required int bookId,
    String? bookname,
    required void Function(int) func,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return DeleteBookDialog(
          bookId: bookId,
          func: func,
          bookname: bookname,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Confirm Deletion"),
      content: Text(
        'Are you sure you want to delete "${bookname?.isNotEmpty == true ? bookname : "this"}" book?',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            "Cancel",
            style: TextStyle(fontSize: 16),
          ),
        ),
        TextButton.icon(
          icon: Icon(
            Icons.delete_forever,
            size: 20,
            color: Colors.red[400],
          ),
          onPressed: () {
            func(bookId);
            Navigator.of(context).pop();
          },
          label: const Text(
            "Delete",
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
