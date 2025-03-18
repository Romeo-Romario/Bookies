import 'package:bookies/features/book/add/widgets/author_picker/picked_author.dart';
import 'package:bookies/services/modules/adding_page_view/models/image_saver.dart';

import 'package:bookies/data/source/drift/drift_app_database.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// String book_name
// int? numberOfPages;
//   int? numberOfReadPages;
//   String? imagePath;
//   PickedAuthor? author;
//   PickedGenre? genre;

void alert(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(
          "Wrong Input",
          textAlign: TextAlign.center,
        ),
        alignment: Alignment.center,
      );
    },
  );
}

Future<String> saveImage(String imagePath) async {
  ImageSaver _imageSaver = ImageSaver();
  final imageName = await _imageSaver.saveImage(XFile(imagePath));
  final imageFile = await _imageSaver.getSavedImage(imageName);
  return imageFile.path;
}

Future<int?> saveAuthor(PickedAuthor author) async {
  final DriftAppDatabase db = DriftAppDatabase();
  if (author.existedInDatabase) {
    return author.id;
  } else {
    final existingAuthor = await (db.select(db.authorsInfoTable)
          ..where((t) =>
              t.author_fullname.upper().equals(author.author.toUpperCase())))
        .getSingleOrNull();
    if (existingAuthor != null) {
      return existingAuthor.author_id;
    } else {
      await db.into(db.authorsInfoTable).insert(
          AuthorsInfoTableCompanion.insert(author_fullname: author.author));
      final resultQuery = await db.select(db.authorsInfoTable)
        ..where((t) => t.author_fullname.equals(author.author));
      final resultAuthor = await resultQuery.getSingle();
      return resultAuthor.author_id;
    }
  }
}
