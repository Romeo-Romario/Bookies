import 'package:bookies/data/entities/folder_entity.dart';
import 'package:flutter/material.dart';

class FolderLibaryView extends StatelessWidget {
  final void Function(FolderEntity entity) onTap;
  final FolderEntity element;

  const FolderLibaryView(
      {super.key, required this.element, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(element),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16.0)),
        elevation: 5,
        child: Stack(
          children: [
            // Big centered text
            Center(
              child: Text(
                element.booksFolderName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[900],
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              right: 12,
              child: Text(
                "12", // TODO: implement book count
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
