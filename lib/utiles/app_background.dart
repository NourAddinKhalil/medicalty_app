import 'package:flutter/material.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({
    super.key,
    required this.child,
    this.imagePath,
    this.showImage = true,
  });
  final Widget child;
  final String? imagePath;
  final bool showImage;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: showImage
          ? Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: ImageHelpers.getAssetImage(
                    double.infinity,
                    double.infinity,
                    pic: imagePath ?? Assets.images.formBack.path,
                    boxFit: BoxFit.fill,
                  ),
                ),
                child,
              ],
            )
          : child,
    );
  }
}
