import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookies/data/entities/folder_entity.dart';
import 'package:flutter/material.dart';

class FolderLibaryView extends StatelessWidget {
  final void Function(FolderEntity entity) onTap;
  final FolderEntity element;

  FolderLibaryView({super.key, required this.element, required this.onTap});

  final Map<String, List> fontFamilyMap = {
    "Anciza Serif": [FontWeight.w700, 35.0],
    "Are You Serious": [FontWeight.w700, 40.0],
    "Ceveat": [FontWeight.w700, 40.0],
    "Knewave": [FontWeight.w400, 30.0],
    "Lavishlyyours": [FontWeight.w700, 40.0],
    "Ole": [FontWeight.w700, 45.0],
    "Roboto": [FontWeight.w600, 30.0],
    "Rouger Script": [FontWeight.w700, 40.0],
    "Rubik Distressed": [FontWeight.w500, 30.0],
    "Unifraktur Maguntia": [FontWeight.w700, 30.0],
  };

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(element),
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16.0)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              // Big centered text
              Center(
                  child: AutoSizeText(
                element.booksFolderName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontFamilyMap[element.fontStyle]![1],
                  fontWeight: fontFamilyMap[element.fontStyle]![0],
                  color: Colors.indigo[900],
                  fontFamily: element.fontStyle,
                ),
                maxLines: 2,
                minFontSize: 12,
                overflow: TextOverflow.ellipsis,
              )),
              // Positioned(
              //   bottom: 8,
              //   right: 12,
              //   child: Text(
              //     "12",
              //     style: TextStyle(
              //       fontSize: 14,
              //       color: Colors.grey[600],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
