import 'package:bookies/features/book/add/widgets/assets_image_dialog_view/dialog_book_crad_view.dart';
import 'package:flutter/material.dart';

class AssetsImageDialog extends StatefulWidget {
  const AssetsImageDialog({super.key});

  @override
  State<AssetsImageDialog> createState() => _AssetsImageDialogState();

  static Future<String?> showAsDialog({
    required BuildContext context,
    String? pastUrl,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AssetsImageDialog();
      },
    );
  }
}

class _AssetsImageDialogState extends State<AssetsImageDialog> {
  List<String> imagePaths = [
    "assets/default_images/1.png",
    "assets/default_images/2.png",
    "assets/default_images/3.png",
    "assets/default_images/4.png",
    "assets/default_images/5.png",
    "assets/default_images/6.png",
    "assets/default_images/7.png",
    "assets/default_images/8.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
          clipBehavior: Clip.antiAlias,
          height: 500,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: GridView.builder(
                primary: false,
                padding: const EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  mainAxisSpacing: 10.0, // Vertical spacing between grid items
                  crossAxisSpacing:
                      10.0, // Horizontal spacing between grid items
                  childAspectRatio: 3 / 4,
                ),
                itemCount: imagePaths.length,
                itemBuilder: (context, index) {
                  final element = imagePaths[index];
                  // return cards.map((el) => BookInfoView(element: el)).toList(),}
                  return DialogBookCradView(imagePath: element);
                }),
          )),
    );
  }
}
