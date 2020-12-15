import 'dart:io';

abstract class ImagePickerRepository {
  Future<void> getImage();

  bool get hasUserPickedImage;

  File get pickedImage;
}
