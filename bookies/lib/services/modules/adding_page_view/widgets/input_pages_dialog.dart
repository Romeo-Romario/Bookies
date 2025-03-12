import 'package:flutter/material.dart';

class InputPagesDialog extends StatefulWidget {
  final String message;
  const InputPagesDialog({required this.message, super.key});

  @override
  State<InputPagesDialog> createState() => _InputPagesDialogState();

  Future<int?> showAsDialog({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) {
        return InputPagesDialog(message: message);
      },
    );
  }
}

class _InputPagesDialogState extends State<InputPagesDialog> {
  final pagesNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Text(
              widget.message,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 250,
              child: TextFormField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                controller: pagesNumberController,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              width: 150,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    if (pagesNumberController.text.isEmpty) {
                      Navigator.pop(context, null);
                    } else {
                      Navigator.pop(
                          context, int.parse(pagesNumberController.text));
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color?>(Colors.purple[400]),
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
