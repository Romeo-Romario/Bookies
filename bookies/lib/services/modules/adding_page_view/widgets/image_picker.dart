import 'dart:io';

import 'package:bookies/services/modules/adding_page_view/models/image_saver.dart';
import 'package:bookies/services/modules/adding_page_view/widgets/assets_image_dialog_view/assets_image_dialog.dart';
import 'package:bookies/services/shared/custom_enums/image_source_type.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
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
              color: Colors.grey[300],
              border: Border.all(
                color: Colors.deepPurple,
                width: selectedImage != null ? 0 : 3,
              ),
              borderRadius:
                  BorderRadius.circular(20.0), // Adjust the radius as needed
            ),
            child: selectedImage ??
                Icon(
                  Icons.add_a_photo_outlined,
                  color: Colors.deepPurple[600],
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
    final assetImage = await AssetsImageDialog.showAsDialog(context: context);
    try {
      if (assetImage == null) {
        return null;
      }
      return Image.asset(assetImage);
    } catch (e) {
      return null;
    }
  }

  Future<Image?> _selectImageFromGallery() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      return null;
    }

    if (Platform.isWindows) {
      widget.onImagepathChanged(pickedFile.path);
      return Image.file(File(pickedFile.path),
          width: 200, height: 200, fit: BoxFit.cover);
    } else {
      XFile? croppedImage = await cropImage(pickedFile);
      if (croppedImage == null) {
        return null;
      }
      widget.onImagepathChanged(croppedImage.path);
      return Image.file(File(croppedImage.path),
          width: 200, height: 200, fit: BoxFit.cover);
    }
  }
}

cropImage(XFile? image) async {
  CroppedFile? croppedFile = await ImageCropper().cropImage(
    sourcePath: image!.path,
    uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        toolbarColor: Color(0xFF311B92),
        toolbarWidgetColor: Colors.white,
        activeControlsWidgetColor: Color(0xFF311B92),
        backgroundColor: Colors.black,
        statusBarColor: Color(0xFF311B92),
        cropFrameColor: Color(0xFF311B92),
        cropGridColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      ),
      IOSUiSettings(
        title: 'Crop Image',
        doneButtonTitle: 'Done',
        cancelButtonTitle: 'Cancel',
        aspectRatioLockEnabled: false,
        resetButtonHidden: false,
        rotateButtonsHidden: false,
        aspectRatioPickerButtonHidden: false,
      ),
    ],
  );
  if (croppedFile == null) {
    return null;
  }

  return XFile(croppedFile.path);
}
