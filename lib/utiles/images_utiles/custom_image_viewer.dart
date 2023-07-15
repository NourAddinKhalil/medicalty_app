import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/helpers/show_custom_dialog.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
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
    this.index,
    this.imageHandeler,
    this.image,
    this.id = '',
  }) : super(key: key);

  final double height;
  final double width;
  final bool enableRadius;
  final bool saveToDevice;
  final bool enableTabToChoose;
  final int? index;
  final void Function(int index, File? image)? imageHandeler;
  final File? image;
  final String id;
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
      image = File(widget.image!.path);
    }
  }

  @override
  void didUpdateWidget(covariant CustomImageViewer oldWidget) {
    super.didUpdateWidget(oldWidget);
    image = widget.image;
  }

  void _onTab() async {
    final imagePath = await ShowCustomDialog.showCustomDialogPicker(
      // context,
      isCircle: widget.enableRadius,
      saveToDevice: widget.saveToDevice,
    );

    if (imagePath.isNotEmpty) {
      setState(() {
        image = File(imagePath.first);
        if (widget.enableTabToChoose) {
          widget.imageHandeler!(widget.index!, image!);
        }
      });
    }
  }

  Widget _buildImage(String image) {
    return image.contains('https://') //|| image.contains('https')
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
      child: Padding(
        padding: CustomEdgeInsets.all(4.0),
        child: widget.enableTabToChoose
            ? const Text('إضغط لإختيار صورة')
            : const Text('لا يوجد صورة'),
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
        Positioned(
          top: 5,
          right: 5,
          child: Material(
            color: Colors.transparent,
            child: IconButton(
              onPressed: () {
                if (image != null) {
                  setState(() {
                    image = null;
                    if (widget.enableTabToChoose) {
                      widget.imageHandeler!(widget.index!, null);
                    }
                  });
                }
              },
              tooltip: 'حذف الصورة',
              hoverColor: theme.iconTheme.color,
              icon: const Icon(Icons.delete_outline),
            ),
          ),
        ),
      ],
    );
  }
}
