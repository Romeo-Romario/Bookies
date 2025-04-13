import 'package:bookies/features/book/detail/widgets/numbers_scroll_view.dart';
import 'package:flutter/material.dart';

Future<int?> showUpdateDialog(
    {required BuildContext context,
    required int numberOfPages,
    required int readPages}) {
  return showDialog<int?>(
    context: context,
    builder: (context) {
      return UpdateProgressDialog(
          numberOfPages: numberOfPages, readPages: readPages);
    },
  );
}

class UpdateProgressDialog extends StatelessWidget {
  final int readPages;
  final int numberOfPages;

  UpdateProgressDialog(
      {super.key, required this.numberOfPages, required this.readPages});

  final List<int> numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  int get numberOfScrolls => numberOfPages.toString().length;

  final _controller = FixedExtentScrollController(initialItem: 2);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 20,
          children: [
            Text("Update progress"),
            SizedBox(
              height: 150, // Make sure height is fixed
              child: Row(
                children: [
                  Expanded(
                    child: NumbersScrollView(
                        controller: _controller, numbers: numbers),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print(_controller.selectedItem);
                Navigator.pop(context, 42); // Return some value
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
