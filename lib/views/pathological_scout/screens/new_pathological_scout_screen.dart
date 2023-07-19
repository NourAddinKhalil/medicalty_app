import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/validators.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_form.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';
import 'package:medicalty/utiles/images_utiles/custom_image_viewer.dart';

class NewPathologicalScoutScreen extends StatefulWidget {
  const NewPathologicalScoutScreen({Key? key}) : super(key: key);

  @override
  State<NewPathologicalScoutScreen> createState() =>
      _NewPathologicalScoutScreenState();
}

class _NewPathologicalScoutScreenState
    extends State<NewPathologicalScoutScreen> {
  final totalAmountTxtField = CurrencyTextFieldController(
    decimalSymbol: '.',
    thousandSymbol: ',',
    initDoubleValue: 0.00,
    enableNegative: false,
    currencySymbol: '\$',
  );
  final scoutNameTxtField = TextEditingController();
  final descriptionTxtField = TextEditingController();

  Future<void> save() async {}

  @override
  void dispose() {
    totalAmountTxtField.dispose();
    scoutNameTxtField.dispose();
    descriptionTxtField.dispose();
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
            title: 'Pathological Scout',
          ),
          body: SafeArea(
            child: CustomForm(
              saveButtonText: 'Create Scout',
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
                  '#ID Scout',
                  textAlign: TextAlign.center,
                  style: FontSizes.h7?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorsConstant.primaryColor,
                  ),
                ),
                const VerticalSizedBox(35),
                CustomTextFormField(
                  label: 'Scout name',
                  horizantalPadding: 20,
                  controller: scoutNameTxtField,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: Validators.checkIfNotEmpty,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                  showlable: false,
                  showHint: true,
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Description',
                  horizantalPadding: 20,
                  controller: descriptionTxtField,
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
                CustomTextFormField(
                  label: 'total amount \$',
                  controller: totalAmountTxtField,
                  horizantalPadding: 20,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: Validators.validateMoneyField,
                  showSuffix: false,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                  showlable: false,
                  showHint: true,
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
