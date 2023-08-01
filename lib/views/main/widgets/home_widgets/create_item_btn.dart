import 'package:flutter/material.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_icon_button.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';
import 'package:medicalty/views/main/widgets/home_widgets/container_shade_widget.dart';

class CreateItemBtn extends StatelessWidget {
  const CreateItemBtn({
    super.key,
    this.image,
    this.text = 'Create Form',
    required this.onAddPressed,
    this.makeTextColorAsBtn = false,
  });
  final String? image;
  final String text;
  final void Function() onAddPressed;
  final bool makeTextColorAsBtn;

  Widget _buildImage() {
    if (image == null) {
      return const VerticalSizedBox(80);
    }
    return CircleSqureImage(
      pic: image!,
      width: 80,
      height: 80,
      isCircle: false,
      decoration: const BoxDecoration(),
    );
  }

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF149FF3);
    return ContainerShadeWidget(
      padding: CustomEdgeInsets.symmetric(4, 12),
      width: 170,
      child: Column(
        children: [
          const VerticalSizedBox(10),
          _buildImage(),
          const VerticalSizedBox(20),
          CustomIconButton(
            iconData: Icons.add,
            iconSize: 40,
            style: IconButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: color,
            ),
            tooltip: '',
            onPressed: onAddPressed,
          ),
          const VerticalSizedBox(30),
          Text(
            text,
            style: FontSizes.h7?.copyWith(
              color: makeTextColorAsBtn ? color : null,
            ),
          ),
        ],
      ),
    );
  }
}
