import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicalty/constants/apis/api_constants.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/helpers/utiles.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';

class ImageHelpers {
  static Widget getNetworkImage(
    String pic,
    double width,
    double height,
    String id, {
    bool loadAssestImage = true,
  }) {
    if (id == '') id = Utiles.generateRandomString();
    return CachedNetworkImage(
      imageUrl: ApiConstants.imagesPath + pic,
      placeholder: (context, url) {
        return Padding(
          padding: CustomEdgeInsets.all(8.0),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      cacheKey: id,
      errorWidget: (context, url, error) {
        if (loadAssestImage) {
          return _buildErrorCachedImageWidgetForWithAssets(
            context,
            url,
            error,
            width,
            height,
          );
        } else {
          return _buildErrorCachedImageWidgetWithText(
            context,
            url,
            error,
          );
        }
      },
      fit: BoxFit.cover,
      width: width.w,
      height: height.h,
    );
  }

  static Widget getFileImage(
    String pic,
    double width,
    double height, {
    bool loadAssestImage = true,
  }) {
    return Image.file(
      File(pic),
      errorBuilder: (context, error, stackTrace) {
        if (loadAssestImage) {
          return _buildErrorImageWidgetWithAssets(
              context, error, stackTrace, width, height);
        } else {
          return _buildErrorImageWidgetWithText(context, error, stackTrace);
        }
      },
      fit: BoxFit.contain,
      width: width.w, //95.0,
      height: height.h, //95.0,
    );
  }

  static Widget getAssetImage(
    double width,
    double height, {
    bool loadAssestImage = true,
    String? pic,
    BoxFit boxFit = BoxFit.contain,
  }) {
    return Image.asset(
      pic ?? '',
      errorBuilder: (context, error, stackTrace) {
        if (loadAssestImage) {
          return _buildErrorImageWidgetWithAssets(
              context, error, stackTrace, width, height);
        } else {
          return _buildErrorImageWidgetWithText(context, error, stackTrace);
        }
      },
      fit: boxFit,
      width: width.w, //95.0,
      height: height.h, //95.0,
    );
  }

  static Widget getSVGAssetImage(
    double width,
    double height, {
    required String pic,
    BoxFit boxFit = BoxFit.contain,
    Color? color,
  }) {
    return SvgPicture.asset(
      pic,
      fit: boxFit,
      width: width.w, //95.0,
      height: height.h, //95.0,
      allowDrawingOutsideViewBox: true,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(
              color,
              BlendMode.modulate,
            ),
    );
  }

  static Widget getLottieAssetImage(
    double width,
    double height,
    String pic,
  ) {
    return const SizedBox();
    // LottieBuilder.asset(
    //   pic,
    //   fit: BoxFit.contain,
    //   width: width.w, //95.0,
    //   height: height.h, //95.0,
    //   errorBuilder: (context, error, stackTrace) {
    //     return _buildErrorImageWidgetWithAssets(
    //         context, error, stackTrace, width, height);
    //   },
    // );
  }

  static Widget _buildErrorImageWidgetWithAssets(
    BuildContext context,
    Object object,
    StackTrace? stackTrace,
    double width,
    double height,
  ) {
    return getSVGAssetImage(
      width,
      height,
      pic: Assets.svgs.profileImg,
      boxFit: BoxFit.cover,
      // fit: BoxFit.cover,
      // width: width.w,
      // height: height.h,
    );
  }

  static Widget _buildErrorCachedImageWidgetForWithAssets(
    BuildContext context,
    String url,
    dynamic error,
    double width,
    double height,
  ) {
    return Icon(
      Icons.error_outline,
      size: 50.sp,
    );
    // Image.asset(
    //   'no image',
    //   fit: BoxFit.cover,
    //   width: width.w,
    //   height: height.h,
    // );
  }

  static Widget _buildErrorImageWidgetWithText(
    BuildContext context,
    Object object,
    StackTrace? stackTrace,
  ) {
    return Center(
      child: Padding(
        padding: CustomEdgeInsets.all(8.0),
        child: const Text('خطأ حدث أثناء تحميل الصورة'),
      ),
    );
  }

  static Widget _buildErrorCachedImageWidgetWithText(
    BuildContext context,
    String url,
    dynamic error,
  ) {
    return Center(
      child: Padding(
        padding: CustomEdgeInsets.all(8.0),
        child: const Text('خطأ حدث أثناء تحميل الصورة'),
      ),
    );
  }
}
