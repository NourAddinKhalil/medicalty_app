import 'dart:io';
import 'dart:math';

import 'package:get/get.dart';

class AttatchmentScreenController extends GetxController {
  AttatchmentScreenController([List<String> current = const []]) {
    if (current.isNotEmpty) {
      selectedAttatchmets.addAll(current);
      allAttatchmets.addAll(current);
    }
  }

  final selectedAttatchmets = <String>[];
  final allAttatchmets = <String>[];
  var _allSizeInMega = 0.0;

  void handleSelectFile(String file, bool isAdd) {
    if (isAdd) {
      selectedAttatchmets.add(file);
    } else {
      selectedAttatchmets.remove(file);
    }
    update([file]);
    update(['info']);
    update(['progress']);
  }

  void onAttatchmentChoosen(List<String> list) {
    if (list.isEmpty) return;
    allAttatchmets.clear();
    selectedAttatchmets.clear();
    selectedAttatchmets.addAll(list);
    allAttatchmets.addAll(list);
    update(['attatchments']);
    update(['info']);
    update(['progress']);
  }

  String get allowedMemoryString {
    const allowedSize = 10 * 1024 * 1024;
    final i = getSuffixIndex(allowedSize);
    final size = getSize(allowedSize, i);

    return '$size ${getSizeSuffix(i)}';
  } // 10MB

  Future<String> getFileSizeAsString(String filePath,
      [int decimals = 1]) async {
    final res = await getFileSize(filePath);
    final size = res['size'];
    if (size <= 0) return '0 B';
    final i = int.parse(res['i']);

    return '${size.toStringAsExponential(decimals)} ${getSizeSuffix(i)}';
  }

  Future<String> getAllFilesSize() async {
    var sum = 0.0;
    if (selectedAttatchmets.isEmpty) return '0.00 MB';

    for (var element in selectedAttatchmets) {
      final size = await getFileSize(element);
      sum += size['size'];
    }

    // final i = getSuffixIndex(sum);
    // final allSize = getSize(sum);
    _allSizeInMega = sum;
    update(['progress']);

    return '${sum.toStringAsFixed(2)} ${getSizeSuffix(2)}';
  }

  double get progressValue {
    return _allSizeInMega / 10;
  }

  Future<Map<String, dynamic>> getFileSize(String filePath) async {
    final file = File(filePath);
    final bytes = await file.length();
    if (bytes <= 0) {
      return {
        'size': 0,
        'i': 0,
      };
    }

    // final i = getSuffixIndex(bytes);
    final size = getSize(bytes);

    return {
      'size': size,
      'i': 2,
    };
  }

  double getSize(int bytes, [int i = 2]) {
    return (bytes / pow(1024, i));
  }

  int getSuffixIndex(int bytes) {
    return (log(bytes) / log(1024)).floor();
  }

  String getSizeSuffix(int i) {
    final suffix = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    return suffix[i];
  }
}
