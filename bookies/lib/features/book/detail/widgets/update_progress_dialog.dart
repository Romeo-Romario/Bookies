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
  final List<FixedExtentScrollController> controllers;
  UpdateProgressDialog(
      {super.key, required this.numberOfPages, required this.readPages})
      : controllers = List.generate(
          numberOfPages.toString().length,
          (index) {
            String strReadPages = "0" *
                    (numberOfPages.toString().length -
                        readPages.toString().length) +
                readPages.toString();
            return FixedExtentScrollController(
                initialItem: int.parse(strReadPages[index]));
          },
        );

  final List<int> numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

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
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  numberOfPages.toString().length,
                  (index) {
                    if (index == 0) {
                      return NumbersScrollView(
                          controller: controllers[index],
                          numbers: List.generate(
                            int.parse(numberOfPages.toString()[0]) + 1,
                            (index) => index,
                          ));
                    }
                    return NumbersScrollView(
                        controller: controllers[index], numbers: numbers);
                  },
                )),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                    context,
                    int.parse(controllers
                        .map(
                          (e) => e.selectedItem,
                        )
                        .toList()
                        .join()));
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
