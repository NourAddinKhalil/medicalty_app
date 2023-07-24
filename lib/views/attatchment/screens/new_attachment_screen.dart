import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:medicalty/controllers/screen_controllers/attatchment_screen_controller.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/image_string_helpers.dart';
import 'package:medicalty/helpers/show_custom_dialog.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/buttons_utiles/squre_btn_with_border.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_form.dart';
import 'package:medicalty/views/attatchment/widgets/selected_attatchment_frame_widget.dart';
import 'package:medicalty/views/requests/widgets/arrival_time_widget.dart';

class NewAttachmentScreen extends GetView<AttatchmentScreenController> {
  const NewAttachmentScreen({
    super.key,
    this.allowedExtensions,
    this.showChooseDocument = true,
    this.showChooseVideo = true,
    this.showChooseImage = true,
    this.tagName,
  });
  final bool showChooseImage;
  final bool showChooseVideo;
  final bool showChooseDocument;
  final List<String>? allowedExtensions;
  final String? tagName;

  @override
  String? get tag => tagName;

  // _buildSelectItem(String pic, Widget child) {
  //   return Row(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       child,
  //       SqureBtnWithBorder(
  //         width: 94,
  //         height: 94,
  //         child: ImageStringHelpers.isImage(pic)
  //             ? ImageHelpers.getFileImage(pic, 94, 94)
  //             : Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Container(
  //                     width: 50.w,
  //                     height: 50.h,
  //                     alignment: Alignment.center,
  //                     padding: CustomEdgeInsets.all(5),
  //                     decoration: BoxDecoration(
  //                       color: Colors.red,
  //                       borderRadius: BorderRadius.circular(10.r),
  //                     ),
  //                     child: Text(
  //                       ImageStringHelpers.getFileExtension(pic),
  //                       textAlign: TextAlign.center,
  //                       style: FontSizes.h9?.copyWith(
  //                         color: Colors.white,
  //                       ),
  //                     ),
  //                   ),
  //                   const VerticalSizedBox(5),
  //                   Text(
  //                     ImageStringHelpers.getFileName(pic),
  //                     maxLines: 1,
  //                     textAlign: TextAlign.center,
  //                     overflow: TextOverflow.fade,
  //                     style: FontSizes.h9?.copyWith(
  //                       fontSize: 10.sp,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //       ),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      imagePath: Assets.images.blueBack.path,
      child: Scaffold(
        appBar: const CustomAppbar(
          title: 'Add attachments',
          backOnRightSide: true,
          icon: Icons.clear_outlined,
        ),
        body: GetBuilder<AttatchmentScreenController>(
          tag: tagName,
          builder: (context) {
            return CustomForm(
              paddingHorizantal: 30,
              save: () async {
                controller.update(['selected_attatchment']);
                Get.back();
              },
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upload files',
                      style: FontSizes.h6?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const VerticalSizedBox(15),
                    SqureBtnWithBorder(
                      child: Icon(
                        Icons.add,
                        size: 30.sp,
                      ),
                      onTap: () async {
                        final res =
                            await ShowCustomDialog.showCustomDialogPicker(
                          allowedExtensions: allowedExtensions,
                          showChooseDocument: showChooseDocument,
                          showChooseImage: showChooseImage,
                          showChooseVideo: showChooseVideo,
                        );
                        controller.onAttatchmentChoosen(res);
                      },
                    ),
                  ],
                ),
                const VerticalSizedBox(15),
                // Text(
                //   'Quote PDF',
                //   style: FontSizes.h6?.copyWith(
                //     fontWeight: FontWeight.w400,
                //   ),
                // ),
                const VerticalSizedBox(15),
                GetBuilder<AttatchmentScreenController>(
                  id: 'attatchments',
                  tag: tagName,
                  builder: (controller) {
                    return ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: controller.allAttatchmets.length,
                      itemBuilder: (_, index) {
                        final file = controller.allAttatchmets[index];
                        return SelectedAttatchmentFrameWidget(
                          file: file,
                          child: Expanded(
                            child: GetBuilder<AttatchmentScreenController>(
                              id: file,
                              tag: tagName,
                              builder: (controller) {
                                return ArrivalTimeWidget(
                                  title: ImageStringHelpers.getFileName(file),
                                  selected: controller.selectedAttatchmets
                                      .contains(file),
                                  onChange: (selected) {
                                    controller.handleSelectFile(file, selected);
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, index) {
                        return const VerticalSizedBox(15);
                      },
                    );
                  },
                ),
                const VerticalSizedBox(15),
                GetBuilder<AttatchmentScreenController>(
                  id: 'info',
                  tag: tagName,
                  builder: (controller) {
                    return FutureBuilder<String>(
                      future: controller.getAllFilesSize(),
                      builder: (_, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text(
                            'Caluclating Files Size ....',
                            textAlign: TextAlign.center,
                            style: FontSizes.h7?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Colors.black45,
                            ),
                          );
                        }
                        if (snapshot.hasError) {
                          return Text(
                            snapshot.error.toString(),
                            textAlign: TextAlign.center,
                            style: FontSizes.h7?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Colors.red,
                            ),
                          );
                        }
                        final data = snapshot.data ?? '0.00 MB';
                        return Text(
                          'You‘ve attached $data out of the ${controller.allowedMemoryString} limit',
                          textAlign: TextAlign.center,
                          style: FontSizes.h7?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.black45,
                          ),
                        );
                      },
                    );
                  },
                ),
                const VerticalSizedBox(15),
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: GetBuilder<AttatchmentScreenController>(
                    id: 'progress',
                    tag: tagName,
                    builder: (controller) {
                      return LinearProgressIndicator(
                        minHeight: 10,
                        value: controller.progressValue,
                        backgroundColor: const Color(0xFFD9D9D9),
                      );
                    },
                  ),
                ),
                const VerticalSizedBox(40),
              ],
            );
          },
        ),
      ),
    );
  }
}
