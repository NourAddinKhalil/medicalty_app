import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalty/controllers/screen_controllers/theme_controller.dart';
import 'package:medicalty/helpers/image_string_helpers.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';

class CircleSqureImage extends StatelessWidget {
  const CircleSqureImage({
    Key? key,
    required this.pic,
    this.radius = 0.0,
    required this.width,
    required this.height,
    this.isCircle = true,
    this.id = '',
    this.decoration = const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: colorBorder,
        ),
        top: BorderSide(
          color: colorBorder,
        ),
        right: BorderSide(
          color: colorBorder,
        ),
        left: BorderSide(
          color: colorBorder,
        ),
      ),
      // .all(
      //   color: Colors.grey,
      // ),
    ),
    // this.showTextError = false,
  }) : super(key: key);

  static const Color colorBorder = Colors.grey;
  final String pic;
  final double radius;
  final double width;
  final double height;
  final String id;
  // final String assetImage;
  final bool isCircle;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    if (!isCircle) {
      return Container(
        decoration: decoration,
        child: pic.isEmpty || pic == ''
            ? ImageHelpers.getAssetImage(
                width,
                height,
              )
            : ImageHelpers.getNetworkImage(
                pic,
                width,
                height,
                id,
              ),
      );
    }
    return GetBuilder<ThemeController>(
      builder: (prov) {
        final isSvg =
            '.svg' == ImageStringHelpers.getFileExtension(pic).toLowerCase();
        final dark = prov.isDarkMode;
        return CircleAvatar(
          radius: radius.r,
          backgroundColor: dark ? Colors.black26 : Colors.grey.shade100,
          child: ClipOval(
            child: pic != '' &&
                    pic.isNotEmpty //&& !pic.contains('assets/images/')
                ? pic.contains(
                        'https://firebasestorage') // || pic.contains('https')
                    ? ImageHelpers.getNetworkImage(
                        pic,
                        width,
                        height,
                        id,
                      )
                    : isSvg
                        ? ImageHelpers.getSVGAssetImage(width, height, pic: pic)
                        : ImageHelpers.getFileImage(
                            pic,
                            width,
                            height,
                          )
                : ImageHelpers.getAssetImage(
                    width,
                    height,
                  ),
          ),
        );
      },
    );
  }
}
