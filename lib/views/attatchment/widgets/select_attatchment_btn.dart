import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/controllers/screen_controllers/attatchment_screen_controller.dart';
import 'package:medicalty/utiles/buttons_utiles/select_item_button.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/views/attatchment/screens/new_attachment_screen.dart';
import 'package:medicalty/views/attatchment/widgets/selected_attatchment_frame_widget.dart';

class SelectAttatchmentBtn extends StatelessWidget {
  const SelectAttatchmentBtn({
    super.key,
    this.buttonTitle = 'Attach receipt',
    required this.attatchments,
    required this.onSelected,
    this.backgroundColor = ColorsConstant.appbarColor,
    this.iconColor = ColorsConstant.green1,
    this.titleStyle,
    this.iconOnEnd = false,
    this.icon = FontAwesomeIcons.plus,
    this.onTap,
  });
  final String buttonTitle;
  final List<String> attatchments;
  final void Function(List<String> attachments) onSelected;
  final Color backgroundColor;
  final Color iconColor;
  final TextStyle? titleStyle;
  final bool iconOnEnd;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SelectItemButton(
          isSelected: false,
          title: buttonTitle,
          icon: icon,
          backgroundColor: backgroundColor,
          titleStyle: titleStyle,
          iconOnEnd: iconOnEnd,
          iconColor: iconColor,
          // subTitle:
          //     selected ? controller.messageTxtField.text : null,
          onTab: onTap ??
              () async {
                await Get.to(
                  () => const NewAttachmentScreen(),
                  transition: Transition.downToUp,
                );
              },
          onClearPressed: () {},
        ),
        GetBuilder<AttatchmentScreenController>(
          id: 'selected_attatchment',
          init: AttatchmentScreenController(attatchments),
          builder: (controller) {
            if (controller.selectedAttatchmets.isEmpty) {
              return const SizedBox();
            }
            onSelected(controller.selectedAttatchmets);
            return Column(
              children: [
                const VerticalSizedBox(15),
                Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  children: controller.selectedAttatchmets.map((e) {
                    return SelectedAttatchmentFrameWidget(
                      file: e,
                      child: const SizedBox(),
                    );
                  }).toList(),
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
