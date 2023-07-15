import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart' as syspaths;

class CustomFilePicker {
  static Future<String?> showImagePicker(
    ImageSource imageSource, {
    bool isCircle = false,
    bool saveIntoDevice = false,
  }) async {
    final image = await ImagePicker().pickImage(
      source: imageSource,
      // maxWidth: 500,
      // maxHeight: 500,
      // imageQuality: 50,
    );
    if (image == null) {
      return null;
    }

    // File imageFile = File(image.path);

    final tempImage = await _cropImage(
          image.path,
          isCircle ? CropStyle.circle : CropStyle.rectangle,
        ) ??
        image.path;
    File imageFile = File(tempImage);
    imageFile = await compressImage(imageFile);

    return _completeSavingOperation(saveIntoDevice, tempImage, imageFile);

    // if (!saveIntoDevice) {
    //   return imageFile.path;
    // }

    // final appDir = await syspaths.getExternalStorageDirectory();
    // final imageName = path.basename(tempImage);
    // final saveDir = '${appDir?.path}/$imageName';
    // final newImage = await imageFile.copy(saveDir);
    // newImage.create();
    // // await image.saveTo(saveDir);
    // return newImage.path;
  }

  static Future<String?> _completeSavingOperation(
      bool saveIntoDevice, String old, File file) async {
    if (!saveIntoDevice) {
      return file.path;
    }

    final appDir = await syspaths.getTemporaryDirectory();
    final imageName = path.basename(old);
    final saveDir = '${appDir.path}/$imageName';
    final newImage = await file.copy(saveDir);
    final newFile = await newImage.create();

    // await image.saveTo(saveDir);
    return newFile.path;
  }

  static Future<String> saveSignature(ui.Image image) async {
    final appDir = await syspaths.getTemporaryDirectory();
    final bytedata = await image.toByteData(format: ui.ImageByteFormat.png);
    final imageByte = bytedata!.buffer.asUint8List(
      bytedata.offsetInBytes,
      bytedata.lengthInBytes,
    );

    final fileName = '${appDir.path}/${DateTime.now().toUtc()}.png';
    final file = File(fileName);
    await file.writeAsBytes(imageByte, flush: true);

    // await image.saveTo(saveDir);
    return fileName;
  }

  static Future<String?> showVideoPicker(
    ImageSource videoSource, {
    bool isCircle = false,
    bool saveIntoDevice = false,
  }) async {
    final video = await ImagePicker().pickVideo(
      source: videoSource,
      // maxWidth: 500,
      // maxHeight: 500,
      // imageQuality: 50,
    );

    if (video == null) {
      return null;
    }

    File videoFile = File(video.path);

    return await _completeSavingOperation(
        saveIntoDevice, videoFile.path, videoFile);

    // if (!saveIntoDevice) {
    //   return videoFile.path;
    // }

    // final appDir = await syspaths.getExternalStorageDirectory();
    // final videoName = path.basename(videoFile.path);
    // final saveDir = '${appDir?.path}/$videoName';
    // final newVideo = await videoFile.copy(saveDir);
    // newVideo.create();
    // // await image.saveTo(saveDir);
    // return newVideo.path;
  }

  static Future<List<String>> showFilePicker({
    bool allowMultiple = false,
    String dialogTitle = 'Pick a file',
  }) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: allowMultiple,
      dialogTitle: dialogTitle,
    );
    if (result == null || result.paths.isEmpty) return [];

    final List<String> paths = [];

    for (var element in result.paths) {
      if (element != null) {
        final path =
            await _completeSavingOperation(true, element, File(element));
        paths.add(path ?? element);
      }
    }

    return paths;
  }

  static Future<File> compressImage(File image) {
    return FlutterNativeImage.compressImage(
      image.absolute.path,
      quality: 100,
      percentage: 10,
    );
  }

  static Future<String?> _cropImage(String path, CropStyle cropStyle) async {
    final cropped = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      aspectRatioPresets: [CropAspectRatioPreset.square],
      // compressQuality: 50,
      // maxHeight: 600,
      // maxWidth: 600,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.teal,
          toolbarWidgetColor: Colors.white,
          hideBottomControls: true,
          lockAspectRatio: true,
        ),
      ],
      cropStyle: cropStyle,
    );

    if (cropped == null) {
      return null;
    }
    return cropped.path;
  }
}
