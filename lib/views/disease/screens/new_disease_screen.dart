import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/validators.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/buttons_utiles/select_item_button.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_form.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';
import 'package:medicalty/utiles/images_utiles/custom_image_viewer.dart';
import 'package:medicalty/views/attatchment/widgets/selected_attatchment_frame_widget.dart';

class NewDiseaseScreen extends StatefulWidget {
  const NewDiseaseScreen({Key? key}) : super(key: key);

  @override
  State<NewDiseaseScreen> createState() => _NewDiseaseScreenState();
}

class _NewDiseaseScreenState extends State<NewDiseaseScreen> {
  final productTypeTxtField = TextEditingController();
  final unitNumberTxtField = TextEditingController();
  final unitPriceTxtField = CurrencyTextFieldController(
    decimalSymbol: '.',
    thousandSymbol: ',',
    initDoubleValue: 0.00,
    enableNegative: false,
    currencySymbol: '\$',
  );
  final diseaseNameTxtField = TextEditingController();
  final diseaseDescriptionTxtField = TextEditingController();

  Future<void> save() async {}

  @override
  void dispose() {
    unitPriceTxtField.dispose();
    unitNumberTxtField.dispose();
    productTypeTxtField.dispose();
    diseaseNameTxtField.dispose();
    diseaseDescriptionTxtField.dispose();
    super.dispose();
  }

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
            child: CustomForm(
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
                    index: 0,
                    imageHandeler: (index, image) {
                      //
                    },
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
                  controller: diseaseNameTxtField,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: Validators.checkIfNotEmpty,
                  icon: Icons.contacts_outlined,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                  showlable: false,
                  showHint: true,
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Description of the disease',
                  horizantalPadding: 20,
                  controller: diseaseDescriptionTxtField,
                  textInputType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  minLines: 5,
                  validator: Validators.checkIfNotEmpty,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                  showlable: false,
                  showHint: true,
                ),
                const VerticalSizedBox(15),
                SelectItemButton(
                  title: 'Results image',
                  iconOnEnd: true,
                  onTab: () {},
                ),
                Column(
                  children: [
                    const VerticalSizedBox(15),
                    Wrap(
                      spacing: 15,
                      runSpacing: 15,
                      children: ['', '', ''].map((e) {
                        return SelectedAttatchmentFrameWidget(
                          file: e,
                          child: const SizedBox(),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const VerticalSizedBox(15),
                SelectItemButton(
                  title: 'Videos',
                  iconOnEnd: true,
                  onTab: () {},
                ),
                Column(
                  children: [
                    const VerticalSizedBox(15),
                    Wrap(
                      spacing: 15,
                      runSpacing: 15,
                      children: ['', '', ''].map((e) {
                        return SelectedAttatchmentFrameWidget(
                          file: e,
                          child: const SizedBox(),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const VerticalSizedBox(60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
