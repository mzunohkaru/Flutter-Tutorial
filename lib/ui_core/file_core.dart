import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

class FileCore {
  static Future<Uint8List?> getImage() async {
    final xFile = await _pickImage();
    final compressedImage = await _compressFile(xFile);
    if (compressedImage == null) return null;
    return compressedImage;
  }

  static Future<XFile?> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  static Future<Uint8List?> _compressFile(XFile? file) async {
    if (file == null) return null;
    final result = await FlutterImageCompress.compressWithFile(
      file.path,
      minWidth: 2300,
      minHeight: 1500,
      quality: 94,
      rotate: 90,
    );
    return result;
  }
}
