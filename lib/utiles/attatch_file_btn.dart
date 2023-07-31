import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/show_custom_dialog.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_text_button.dart';
import 'package:medicalty/utiles/images_utiles/selected_images.dart';

class AttatchFileBtn extends StatefulWidget {
  const AttatchFileBtn({
    super.key,
    required this.title,
    this.fullWidth = false,
    this.description = '',
    this.onTab,
    this.allowMultiSelect = false,
    this.paths = const [],
    required this.imageSelected,
  });
  final String title;
  final String description;
  final bool fullWidth;
  final void Function()? onTab;
  final bool allowMultiSelect;
  final List<String> paths;
  final void Function(List<String> imagesPath) imageSelected;

  @override
  State<AttatchFileBtn> createState() => _AttatchFileBtnState();
}

class _AttatchFileBtnState extends State<AttatchFileBtn> {
  // var showSelectedImages = false;
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
  void didUpdateWidget(covariant AttatchFileBtn oldWidget) {
    imagesPath.clear();
    imagesPath.addAll(widget.paths);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: widget.fullWidth
          ? CrossAxisAlignment.stretch
          : CrossAxisAlignment.center,
      children: [
        CustomTextIconButton(
          iconData: Icons.cloud_upload_outlined,
          allowOnlineOnly: false,
          allowRegisterOnly: false,
          title: widget.title,
          onPressed: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            final res = await ShowCustomDialog.showCustomDialogPicker(
              multiSelect: widget.allowMultiSelect,
            );

            if (!widget.allowMultiSelect) imagesPath.clear();

            if (res.isNotEmpty) {
              setState(() {
                // showSelectedImages = true;
                imagesPath.addAll(res);
              });

              widget.imageSelected(imagesPath);
            }
          },
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xff939393),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0.r),
            ),
            side: const BorderSide(
              color: Color(0xff939393),
            ),
            textStyle: FontSizes.h6,
            padding: CustomEdgeInsets.all(15),
          ),
        ),
        const VerticalSizedBox(14),
        Padding(
          padding: CustomEdgeInsets.only(left: 10),
          child: Text(
            widget.description,
            style: FontSizes.h9?.copyWith(
              color: const Color(0xff939393),
            ),
          ),
        ),
        if (imagesPath.isNotEmpty) const VerticalSizedBox(12),
        if (imagesPath.isNotEmpty)
          SelectedImages(
            imageSelected: widget.imageSelected,
            paths: imagesPath,
          ),
      ],
    );
    // SizedBox(
    //   width: fullWidth ? double.infinity : 0,
    //   child: DottedBorder(
    //     // borderPadding: CustomEdgeInsets.all(30),
    //     borderType: BorderType.RRect,
    //     radius: Radius.circular(30.r),
    //     strokeWidth: 2,
    //     dashPattern: const [16, 12, 10, 4],
    //     color: const Color.fromARGB(255, 5, 187, 87),
    //     strokeCap: StrokeCap.round,
    //     child: InkWell(
    //       borderRadius: BorderRadius.circular(30.r),
    //       radius: 30.r,
    //       onTap: onTab,
    //       child: Padding(
    //         padding: CustomEdgeInsets.all(30),
    //         child: Center(
    //           child: Text(
    //             title,
    //             style: const TextStyle(
    //               color: Color.fromARGB(255, 5, 187, 87),
    //               fontWeight: FontWeight.w600,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
