import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_elevated_button.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';

class CustomForm extends StatelessWidget {
  CustomForm({
    super.key,
    required this.children,
    required this.save,
    this.saveButtonText = 'Save',
    this.childrenAfterSaveButton,
    this.paddingHorizantal = 14,
    this.paddingVertical = 6,
    this.saveStyle,
  });
  final _formState = GlobalKey<FormState>();
  final List<Widget> children;
  final Future<void> Function() save;
  final String saveButtonText;
  final ButtonStyle? saveStyle;
  final List<Widget>? childrenAfterSaveButton;
  final double paddingVertical;
  final double paddingHorizantal;

  Future<void> _save() async {
    final isValid = _formState.currentState?.validate() ?? false;
    if (!isValid) return;
    _formState.currentState!.save();

    await save();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formState,
      child: SingleChildScrollView(
        key: const PageStorageKey<String>('form_key'),
        padding: CustomEdgeInsets.symmetric(paddingVertical, paddingHorizantal),
        // reverse: true,
        dragStartBehavior: DragStartBehavior.down,
        // physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...children,
            // button save
            Row(
              children: [
                const Expanded(
                  child: HorizantalSizedBox(double.infinity),
                ),
                SizedBox(
                  width: 330.w,
                  child: CustomElevatedButton(
                    // padding: 10,
                    title: saveButtonText,
                    textStyle: FontSizes.h6?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    style: saveStyle ??
                        ElevatedButton.styleFrom(
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                        ),
                    onPressed: _save,
                    allowOnlineOnly: false,
                    allowRegisterOnly: false,
                  ),
                ),
                const Expanded(
                  child: HorizantalSizedBox(double.infinity),
                ),
              ],
            ),
            ...?childrenAfterSaveButton,
            // const BottomPadding(),
          ],
        ),
      ),
    );
  }
}
