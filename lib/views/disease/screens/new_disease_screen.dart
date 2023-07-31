import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/controllers/screen_controllers/attatchment_screen_controller.dart';
import 'package:medicalty/controllers/screen_controllers/disease_screen_controller.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/image_string_helpers.dart';
import 'package:medicalty/helpers/validators.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_form.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';
import 'package:medicalty/utiles/images_utiles/custom_image_viewer.dart';
import 'package:medicalty/views/attatchment/widgets/select_attatchment_btn.dart';

class NewDiseaseScreen extends GetView<DiseaseScreenController> {
  const NewDiseaseScreen({Key? key}) : super(key: key);

  Future<void> save() async {}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: AppBackground(
        child: Scaffold(
          appBar: const CustomAppbar(
            title: 'Disease reporting',
          ),
          body: SafeArea(
            child: GetBuilder<DiseaseScreenController>(
              init: DiseaseScreenController(),
              builder: (controller) {
                return CustomForm(
                  saveButtonText: 'Create Disease',
                  paddingHorizantal: 0,
                  childrenAfterSaveButton: const [
                    VerticalSizedBox(15),
                  ],
                  save: save,
                  children: [
                    const VerticalSizedBox(15),
                    Center(
                      child: CustomImageViewer(
                        enableRadius: true,
                        enableTabToChoose: true,
                        height: 120,
                        width: 120,
                        allowedExtensions: ImageStringHelpers.imagesExtensions,
                        showChooseDocument: false,
                        showChooseVideo: false,
                        image: controller.image,
                        onImageChoosen: controller.onImageChoosen,
                      ),
                    ),
                    const VerticalSizedBox(15),
                    Text(
                      '#ID Disease',
                      textAlign: TextAlign.center,
                      style: FontSizes.h7?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorsConstant.primaryColor,
                      ),
                    ),
                    const VerticalSizedBox(35),
                    CustomTextFormField(
                      label: 'The name of the disease',
                      horizantalPadding: 20,
                      controller: controller.diseaseNameTxtField,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: Validators.checkIfNotEmpty,
                      icon: Icons.contacts_outlined,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          name: value,
                        );
                      },
                      showlable: false,
                      showHint: true,
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'Description of the disease',
                      horizantalPadding: 20,
                      controller: controller.diseaseDescriptionTxtField,
                      textInputType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      minLines: 5,
                      validator: Validators.checkIfNotEmpty,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          description: value,
                        );
                      },
                      showlable: false,
                      showHint: true,
                    ),
                    const VerticalSizedBox(15),
                    GetBuilder<AttatchmentScreenController>(
                      init: AttatchmentScreenController(),
                      tag: 'Images',
                      builder: (context) {
                        return SelectAttatchmentBtn(
                          buttonTitle: 'Results image',
                          iconColor: ColorsConstant.green1,
                          attatchments: const [],
                          allowedExtensions:
                              ImageStringHelpers.imagesExtensions,
                          showChooseDocument: false,
                          showChooseVideo: false,
                          tagName: 'Images',
                          onSelected: (attachments) {},
                        );
                      },
                    ),
                    const VerticalSizedBox(15),
                    GetBuilder<AttatchmentScreenController>(
                      init: AttatchmentScreenController(),
                      tag: 'Videos',
                      builder: (context) {
                        return SelectAttatchmentBtn(
                          buttonTitle: 'Videos',
                          iconColor: ColorsConstant.green1,
                          attatchments: const [],
                          allowedExtensions:
                              ImageStringHelpers.videosExtensions,
                          showChooseDocument: false,
                          showChooseImage: false,
                          tagName: 'Videos',
                          onSelected: (attachments) {},
                        );
                      },
                    ),
                    const VerticalSizedBox(60),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
