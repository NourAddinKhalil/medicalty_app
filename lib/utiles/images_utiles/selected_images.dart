import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_file/open_file.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/image_string_helpers.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_icon_button.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';

class SelectedImages extends StatefulWidget {
  const SelectedImages({
    super.key,
    required this.paths,
    required this.imageSelected,
  });
  final List<String> paths;
  final void Function(List<String> imagesPath) imageSelected;

  @override
  State<SelectedImages> createState() => _SelectedImagesState();
}

class _SelectedImagesState extends State<SelectedImages> {
  final List<String> imagesPath = [];
  @override
  void initState() {
    // imagesPath.addAll([
    //   '.mp4',
    //   '.mp3',
    //   '.jbg',
    //   '.jbeg',
    //   '.pdf',
    //   '.doc',
    //   '.docx',
    //   '.gif',
    // ]);
    imagesPath.addAll(widget.paths);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SelectedImages oldWidget) {
    imagesPath.clear();
    imagesPath.addAll(widget.paths);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      runAlignment: WrapAlignment.start,
      alignment: WrapAlignment.start,
      children: imagesPath.map<Widget>((filePath) {
        return InkWell(
          onTap: () async {
            await OpenFile.open(File(filePath).path);
          },
          child: Container(
            height: 80.h,
            width: 80.w,
            margin: CustomEdgeInsets.only(right: 8, bottom: 8),
            decoration: BoxDecoration(
              color: ColorsConstant.greyBackground,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0.h,
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (ImageStringHelpers.isImage(filePath))
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: ImageHelpers.getFileImage(filePath, 80, 80),
                        ),
                      if (!ImageStringHelpers.isImage(filePath))
                        Container(
                          // width: 35.w,
                          height: 30.h,
                          padding: CustomEdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Text(
                            ImageStringHelpers.getFileExtension(filePath),
                            textAlign: TextAlign.center,
                            style: FontSizes.h9?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      if (!ImageStringHelpers.isImage(filePath))
                        const VerticalSizedBox(5),
                      if (!ImageStringHelpers.isImage(filePath))
                        Text(
                          ImageStringHelpers.getFileName(filePath),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.fade,
                          style: FontSizes.h9?.copyWith(
                            fontSize: 10.sp,
                          ),
                        ),
                    ],
                  ),
                ),
                Positioned(
                  top: 3.h,
                  right: 2.w,
                  child: SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: CustomIconButton(
                      iconData: Icons.clear_outlined,
                      iconSize: 17,
                      tooltip: 'Remove',
                      style: IconButton.styleFrom(
                        alignment: Alignment.center,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(0),
                      ),
                      onPressed: () {
                        setState(() {
                          imagesPath.remove(filePath);
                          widget.imageSelected(imagesPath);
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
