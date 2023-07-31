import 'package:flutter/material.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/gen/assets.gen.dart';

import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/show_custom_dialog.dart';
import 'package:medicalty/helpers/validators.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_form.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';
import 'package:medicalty/views/attatchment/widgets/select_attatchment_btn.dart';
import 'package:medicalty/views/requests/widgets/arrival_time_widget.dart';

class AddNewNoteScreen extends StatelessWidget {
  const AddNewNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      imagePath: Assets.images.blueBack.path,
      child: Scaffold(
        appBar: const CustomAppbar(
          title: 'Add Note',
          icon: Icons.clear_outlined,
          backOnRightSide: true,
        ),
        body: SafeArea(
          child: CustomForm(
            paddingHorizantal: 20,
            save: () async {},
            children: [
              // Write Anote to Your team
              CustomTextFormField(
                label: 'Write Anote to Your team',
                controller: null, // controller.fullNameTxtField,
                textInputAction: TextInputAction.newline,
                textInputType: TextInputType.multiline,
                fillColor: null,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(),
                ),
                showUnderlinedStyle: true,
                validator: Validators.checkIfNotEmpty,
                onSaved: (value) {
                  // controller.employeeModel =
                  //     controller.employeeModel.copyWith(name: value);
                },
              ),
              const VerticalSizedBox(15),
              SelectAttatchmentBtn(
                backgroundColor: Colors.transparent,
                buttonTitle: 'Attatch files',
                titleStyle: FontSizes.h6?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                iconOnEnd: true,
                icon: Icons.link_outlined,
                onTap: () {
                  ShowCustomDialog.showCustomDialogPicker(showIcons: false);
                },
                attatchments: const [],
                onSelected: (attachments) {},
              ),
              const VerticalSizedBox(15),
              Text(
                'Link note',
                style: FontSizes.h6?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              const VerticalSizedBox(8),
              Text(
                'Share note internally on selected client work ',
                style: FontSizes.h7?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: ColorsConstant.primaryColor,
                ),
              ),
              const VerticalSizedBox(15),
              ArrivalTimeWidget(
                title: 'Job',
                selected: false,
                showCircleOnEnd: true,
                onChange: (newVal) {},
              ),
              ArrivalTimeWidget(
                title: 'Invoices',
                selected: true,
                showCircleOnEnd: true,
                onChange: (newVal) {},
              ),
              const VerticalSizedBox(80),
            ],
          ),
        ),
      ),
    );
  }
}
