import 'package:bookies/data/entities/folder_entity.dart';
import 'package:bookies/features/shared/font_params/font_params.dart';
import 'package:flutter/material.dart';

class FolderDetailDialog extends StatefulWidget {
  final String folderName;
  final String fontStyle;
  final int folderId;
  final void Function(FolderEntity entity) onEdit;
  final void Function(FolderEntity entity) onDelete;

  const FolderDetailDialog(
      {super.key,
      required this.folderName,
      required this.fontStyle,
      required this.folderId,
      required this.onEdit,
      required this.onDelete});

  static Future showAsDialog({
    required BuildContext context,
    required String folderName,
    required String fontStyle,
    required int folderId,
    required void Function(FolderEntity) onEdit,
    required void Function(FolderEntity) onDelete,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return FolderDetailDialog(
          folderName: folderName,
          fontStyle: fontStyle,
          folderId: folderId,
          onEdit: onEdit,
          onDelete: onDelete,
        );
      },
    );
  }

  @override
  State<FolderDetailDialog> createState() => _FolderDetailDialogState();
}

class _FolderDetailDialogState extends State<FolderDetailDialog> {
  String? pickedFont;
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    pickedFont = widget.fontStyle;
    _controller.text = widget.folderName;
  }

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
            mainAxisSize: MainAxisSize.min,
            spacing: 30,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 160,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        final entity = FolderEntity(
                            booksFolderName: _controller.text,
                            fontStyle: pickedFont!,
                            booksFolderId: widget.folderId);
                        widget.onDelete(entity);
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.folder_delete_outlined,
                        size: 20.0,
                        color: Colors.red,
                      ),
                      label: const Text(
                        "Delete",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 140,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        final entity = FolderEntity(
                            booksFolderName: _controller.text,
                            fontStyle: pickedFont!,
                            booksFolderId: widget.folderId);
                        widget.onEdit(entity);
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.edit,
                        size: 20.0,
                      ),
                      label: const Text("Edit"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
