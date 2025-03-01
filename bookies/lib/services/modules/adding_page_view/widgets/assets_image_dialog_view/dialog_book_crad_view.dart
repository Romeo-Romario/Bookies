import 'package:flutter/material.dart';

class DialogBookCradView extends StatelessWidget {
  const DialogBookCradView({this.imagePath, super.key});
  final imagePath;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, imagePath);
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Image(image: AssetImage(imagePath)),
        ),
      ),
    );
  }
}
