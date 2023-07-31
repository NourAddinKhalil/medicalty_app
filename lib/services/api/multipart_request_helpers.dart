import 'dart:io';

import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:medicalty/helpers/image_string_helpers.dart';

class MultipartRequestHelpers {
  static MultipartFile getMultipartFile(String path) {
    return MultipartFile(
      File(path),
      filename: ImageStringHelpers.getFileName(path),
    );
  }
}
