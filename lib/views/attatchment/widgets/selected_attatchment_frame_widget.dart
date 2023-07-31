import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/image_string_helpers.dart';
import 'package:medicalty/utiles/buttons_utiles/squre_btn_with_border.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedAttatchmentFrameWidget extends StatelessWidget {
  const SelectedAttatchmentFrameWidget({
    super.key,
    required this.child,
    required this.file,
  });
  final Widget child;
  final String file;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        child,
        SqureBtnWithBorder(
          width: 94,
          height: 94,
          child: ImageStringHelpers.isImage(file)
              ? ImageHelpers.getFileImage(file, 94, 94)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50.w,
                      height: 50.h,
                      alignment: Alignment.center,
                      padding: CustomEdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        ImageStringHelpers.getFileExtension(file),
                        textAlign: TextAlign.center,
                        style: FontSizes.h9?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const VerticalSizedBox(5),
                    Text(
                      ImageStringHelpers.getFileName(file),
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
      ],
    );
  }
}
