import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImageSaver {
  Future<String> getDirectory() async {
    final el = await getApplicationDocumentsDirectory();
    return el.path;
  }

  Future<String> getDocumentsPath() async {
    return getDirectory().toString();
  }

  Future<String> saveImage(XFile imageFile) async {
    final fileName = 'user_image_${DateTime.now().millisecondsSinceEpoch}.png';
    await imageFile.saveTo(File('${await getDirectory()}\\$fileName').path);
    return fileName;
  }

  Future<File> getSavedImage(String fileName) async {
    return File('${await getDirectory()}\\$fileName');
  }

  Future<String> getPathToImage(String fileName) async {
    return '${await getDirectory()}\\$fileName';
  }

  Future<void> deleteAllUserImages() async {
    final dir = Directory(await getDirectory()); // Get the directory
    final List<FileSystemEntity> files = dir.listSync(); // Get all files

    for (var file in files) {
      if (file is File &&
          file.path.contains('${Platform.pathSeparator}user_image_')) {
        await file.delete();
      }
    }
  }
}
