import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/show_custom_dialog.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_ink_well.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';
import 'package:medicalty/utiles/images_utiles/selected_images.dart';
import 'package:medicalty/utiles/title_upon_widget.dart';

class PickImageBox extends StatefulWidget {
  const PickImageBox({
    super.key,
    this.title = '',
    this.showTitle = true,
    required this.imageSelected,
    this.paths = const [],
    this.allowMultiSelect = true,
    this.width = 292,
  });
  final String title;
  final bool showTitle;
  final bool allowMultiSelect;
  final List<String> paths;
  final void Function(List<String> imagesPath) imageSelected;
  final double width;

  @override
  State<PickImageBox> createState() => _PickImageBoxState();
}

class _PickImageBoxState extends State<PickImageBox> {
  // var showSelectedImages = false;
  final List<String> imagesPath = [];

  @override
  void initState() {
    // showSelectedImages = widget.paths.isNotEmpty;
    if (widget.paths.isNotEmpty) {
      imagesPath.addAll(widget.paths);
    }
    // imagesPath.addAll(widget.paths);
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
    super.initState();
  }

  @override
  void didUpdateWidget(covariant PickImageBox oldWidget) {
    imagesPath.clear();
    imagesPath.addAll(widget.paths);
    super.didUpdateWidget(oldWidget);
  }

  void onTab() async {
    final res = await ShowCustomDialog.showCustomDialogPicker(
      multiSelect: widget.allowMultiSelect,
    );

    if (!widget.allowMultiSelect) {
      imagesPath.clear();
    }

    if (res.isNotEmpty) {
      setState(() {
        // showSelectedImages = true;
        imagesPath.addAll(res);
      });

      widget.imageSelected(imagesPath);
    }
  }

  Widget _buildBox() {
    return Row(
      children: [
        DottedBorder(
          borderType: BorderType.Rect,
          dashPattern: const [2],
          padding: CustomEdgeInsets.all(8),
          child: SizedBox(
            width: widget.width.w,
            height: 96.h,
            child: CustomInkWell(
              onTap: onTab,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageHelpers.getSVGAssetImage(
                    25,
                    25,
                    pic: '',
                  ),
                  const VerticalSizedBox(8),
                  SizedBox(
                    width: 170.w,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Drop your image, or select ',
                        style: FontSizes.h7?.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: 'click to browse',
                            style: FontSizes.h7?.copyWith(
                              color: ColorsConstant.green2,
                              fontWeight: FontWeight.w400,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = onTab,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Expanded(child: SizedBox())
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showTitle)
          TitleUponWidget(
            title: widget.title,
            style: FontSizes.h6?.copyWith(fontWeight: FontWeight.w400),
            child: _buildBox(),
          ),
        if (!widget.showTitle) _buildBox(),
        if (imagesPath.isNotEmpty) const VerticalSizedBox(12),
        if (imagesPath.isNotEmpty)
          SelectedImages(
            imageSelected: widget.imageSelected,
            paths: imagesPath,
          ),
      ],
    );
  }
}
