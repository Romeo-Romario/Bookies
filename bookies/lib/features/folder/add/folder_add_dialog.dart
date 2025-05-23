import 'package:bookies/data/entities/folder_entity.dart';
import 'package:bookies/features/shared/font_params/font_params.dart';
import 'package:flutter/material.dart';

class FolderAddDialog extends StatefulWidget {
  int? parentFolderId;
  void Function(FolderEntity entity) func;
  FolderAddDialog({super.key, this.parentFolderId, required this.func});

  @override
  State<FolderAddDialog> createState() => _FolderAddDialogState();

  static Future showAsDialog({
    required BuildContext context,
    int? parentFolderId,
    required void Function(FolderEntity) func,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return FolderAddDialog(
          parentFolderId: parentFolderId,
          func: func,
        );
      },
    );
  }
}

class _FolderAddDialogState extends State<FolderAddDialog> {
  final _controller = TextEditingController();
  String pickedFont = "Roboto";

  // Parent Folder id
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Container(
          width: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _controller,
                style: TextStyle(
                  fontFamily: pickedFont,
                  fontSize: fontFamilyDictionary[pickedFont]![1],
                  fontWeight: fontFamilyDictionary[pickedFont]![0],
                ),
                decoration: const InputDecoration(
                  labelText: "Folder name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: pickedFont,
                onChanged: (String? newFont) {
                  if (newFont != null) {
                    setState(() {
                      pickedFont = newFont;
                    });
                  }
                },
                decoration: const InputDecoration(
                  labelText: "Pick desired font",
                  border: OutlineInputBorder(),
                ),
                items: fontFamilies.map((font) {
                  return DropdownMenuItem<String>(
                    value: font,
                    child: Text(
                      "Pick desired font",
                      style: TextStyle(
                          fontFamily: font,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_controller.text.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Validation Error"),
                          content: const Text("Folder name can't be empty."),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text("OK"),
                            ),
                          ],
                        ),
                      );
                      return;
                    }
                    final newFolder = FolderEntity(
                        parentFolderId: widget.parentFolderId,
                        fontStyle: pickedFont,
                        booksFolderName: _controller.text);
                    widget.func(newFolder);
                  },
                  child: const Text("Add Folder"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
