import 'package:path/path.dart' as path;

class ImageStringHelpers {
  static String getFileName(String file) {
    return path.basename(file);
  }

  static String getFileExtension(String file) {
    return path.extension(file);
  }

  static const imagesExtensions = [
    'jpg',
    'jpeg',
    'gif',
    'png',
    'svg',
  ];
  static const videosExtensions = [
    'mp4',
  ];

  static bool isImage(String file) {
    final images = [
      '.jpg',
      '.jpeg',
      '.gif',
      '.png',
      '.tiff',
      '.raw',
    ];
    return images.contains(path.extension(file).toLowerCase());
  }
}
