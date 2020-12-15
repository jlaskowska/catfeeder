import 'dart:io';

import 'package:catfeeder/image_picker_repository.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerRepositoryImpl implements ImagePickerRepository {
  final _picker = ImagePicker();
  File _image;

  Future<void> getImage() async {
    try {
      final pickedFile = await _picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );
      _image = File(pickedFile.path);
    } catch (e) {
      print(e);
    }
  }

  @override
  File get pickedImage => _image;

  @override
  bool get hasUserPickedImage => _image != null;
}
