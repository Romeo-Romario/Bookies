import 'package:bookies/services/modules/adding_page_view/models/image_saver.dart';
import 'package:bookies/services/shared/custom_enums/image_source_type.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerView extends StatefulWidget {
  final void Function(String imagePath) onImagepathChanged;
  final void Function(ImageSourceType imageSourceType) onImageSourceTypeChanged;

  const ImagePickerView({
    super.key,
    required this.onImagepathChanged,
    required this.onImageSourceTypeChanged,
  });

  @override
  State<ImagePickerView> createState() => _ImagePickerViewState();
}

class _ImagePickerViewState extends State<ImagePickerView> {
  final ImagePicker _picker = ImagePicker();

  Image? selectedImage;
  ImageSourceType selectedType = ImageSourceType.asset;
  final ImageSaver _imageSaver = ImageSaver();
  @override
  Widget build(BuildContext context) {
    final sourceTypes = ImageSourceType.values.toList();

    return Column(
      spacing: 20,
      children: [
        InkWell(
          onTap: _onTap,
          child: Container(
            width: 150,
            height: 200,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius:
                  BorderRadius.circular(20.0), // Adjust the radius as needed
            ),
            child: selectedImage ??
                Icon(
                  Icons.add_a_photo_outlined,
                  color: Colors.white,
                  size: 40,
                ),
          ),
        ),
        // SizedBox(height: 20,),
        // ignore: sized_box_for_whitespace
        Container(
          width: 250,
          child: SegmentedButton(
            segments: List.generate(
              sourceTypes.length,
              (index) {
                return ButtonSegment(
                  value: sourceTypes[index],
                  label: Text(sourceTypes[index].name),
                );
              },
            ),
            selected: {selectedType},
            onSelectionChanged: (p0) => setState(() {
              selectedType = p0.first;
            }),
          ),
        ),
      ],
    );
  }

  Future _onTap() async {
    final image = await switch (selectedType) {
      ImageSourceType.asset => _selectImageFromAssets(),
      ImageSourceType.local => _selectImageFromGallery(),
    };

    setState(() {
      widget.onImageSourceTypeChanged(selectedType);
      selectedImage = image;
    });
  }

  Future<Image?> _selectImageFromAssets() async {
    return Image.asset(
      "assets/default_images/8.png",
      width: 30,
    );
  }

  Future<Image?> _selectImageFromGallery() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      return null;
    }

    final imageName = await _imageSaver.saveImage(pickedFile);
    widget.onImagepathChanged(await _imageSaver.getPathToImage(imageName));
    final imageFile = await _imageSaver.getSavedImage(imageName);
    return Image.file(imageFile, width: 200, height: 200, fit: BoxFit.cover);
  }
}
