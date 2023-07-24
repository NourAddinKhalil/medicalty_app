import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/helpers/show_custom_dialog.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_icon_button.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';

class CustomImageViewer extends StatefulWidget {
  const CustomImageViewer({
    Key? key,
    // this.driverImage,
    this.height = 300,
    this.width = double.infinity,
    this.enableRadius = false,
    this.saveToDevice = false,
    this.enableTabToChoose = true,
    this.onImageChoosen,
    this.image,
    this.id = '',
    this.allowedExtensions,
    this.showChooseDocument = true,
    this.showChooseVideo = true,
    this.showChooseImage = true,
  }) : super(key: key);

  final double height;
  final double width;
  final bool enableRadius;
  final bool saveToDevice;
  final bool enableTabToChoose;
  final void Function(String? image)? onImageChoosen;
  final String? image;
  final String id;
  final bool showChooseImage;
  final bool showChooseVideo;
  final bool showChooseDocument;
  final List<String>? allowedExtensions;
  // final File? driverImage;

  @override
  State<CustomImageViewer> createState() => _CustomImageViewerState();
}

class _CustomImageViewerState extends State<CustomImageViewer> {
  // String? imagePath = 'assets/images/_fhdvideogames0010.jpg';
  File? image;

  @override
  void initState() {
    super.initState();
    if (widget.image != null) {
      image = File(widget.image!);
    }
  }

  @override
  void didUpdateWidget(covariant CustomImageViewer oldWidget) {
    super.didUpdateWidget(oldWidget);
    image = File(widget.image!);
  }

  void _onTab() async {
    final imagePath = await ShowCustomDialog.showCustomDialogPicker(
      allowedExtensions: widget.allowedExtensions,
      showChooseDocument: widget.showChooseDocument,
      showChooseImage: widget.showChooseImage,
      showChooseVideo: widget.showChooseVideo,
      multiSelect: false,
      isCircle: widget.enableRadius,
      saveToDevice: widget.saveToDevice,
    );

    if (imagePath.isNotEmpty) {
      setState(() {
        image = File(imagePath.first);
        if (widget.enableTabToChoose) {
          widget.onImageChoosen!(image!.path);
        }
      });
    }
  }

  Widget _buildImage(String image) {
    return image.isURL //contains('https://') //|| image.contains('https')
        ? ImageHelpers.getNetworkImage(
            image,
            widget.width,
            widget.height,
            widget.id,
            loadAssestImage: false,
          )
        : ImageHelpers.getFileImage(
            image,
            widget.width,
            widget.height,
            loadAssestImage: false,
          );
  }

  Widget _buildTabToChooseImage() {
    return Center(
      child: widget.enableTabToChoose
          ? ImageHelpers.getSVGAssetImage(
              widget.width,
              widget.height,
              pic: Assets.svgs.profileEditImg,
            )
          : ImageHelpers.getSVGAssetImage(
              widget.width,
              widget.height,
              pic: Assets.svgs.profileImg,
            ),
    );
  }

  Widget _buildInkWell() {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular((widget.height / 2).r),
        onTap: !widget.enableTabToChoose ? null : _onTab,
        child: image?.path == null || image!.path == ''
            ? _buildTabToChooseImage()
            : _buildImage(image!.path),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        if (widget.enableRadius)
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular((widget.height / 2).r),
            ),
            child: CircleAvatar(
              radius: (widget.height / 2).r,
              backgroundColor:
                  theme.appBarTheme.iconTheme?.color!.withAlpha(100),
              foregroundColor: theme.colorScheme.onSurface,
              child: ClipOval(
                // clipBehavior: Clip.hardEdge,
                child: _buildInkWell(),
              ),
            ),
          ),
        if (!widget.enableRadius)
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
              // borderRadius: BorderRadius.circular(
              //     !widget.enableRadius ? 0 : widget.height),
            ),
            clipBehavior: Clip.hardEdge,
            height: widget.height.h,
            width: widget.width.w,
            child: _buildInkWell(),
          ),
        if (image?.path.isNotEmpty ?? false)
          Positioned(
            top: 15.h,
            right: 15.w,
            child: SizedBox(
              width: 26.w,
              height: 26.h,
              child: Center(
                child: CustomIconButton(
                  onPressed: () {
                    if (image != null) {
                      setState(() {
                        image = null;
                        if (widget.enableTabToChoose) {
                          widget.onImageChoosen!(null);
                        }
                      });
                    }
                  },
                  tooltip: '',
                  style: IconButton.styleFrom(
                    backgroundColor: ColorsConstant.red,
                    foregroundColor: Colors.white,
                    // alignment: Alignment.center,
                    padding: const EdgeInsets.all(0),
                  ),
                  iconData: Icons.clear,
                  iconSize: 20,
                  allowOnlineOnly: false,
                  allowRegisterOnly: false,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
