import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/gen/assets.gen.dart';

import 'package:medicalty/helpers/validators.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_form.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({
    super.key,
    this.title = 'Client message',
  });
  final String title;

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final messageController = TextEditingController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      imagePath: Assets.images.blueBack.path,
      child: Scaffold(
        appBar: CustomAppbar(
          title: widget.title,
          icon: Icons.clear_outlined,
          backOnRightSide: true,
        ),
        body: SafeArea(
          child: CustomForm(
            paddingHorizantal: 20,
            save: () async {
              Get.back(result: messageController.text.trim());
            },
            saveButtonText: 'Save Message',
            children: [
              const VerticalSizedBox(20),
              CustomTextFormField(
                label: 'Client Message',
                controller: messageController,
                textInputType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                showUnderlinedStyle: true,
                fillColor: null,
                validator: Validators.checkIfNotEmpty,
                onSaved: (value) {},
              ),
              const VerticalSizedBox(160),
            ],
          ),
        ),
      ),
    );
  }
}
