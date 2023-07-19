import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/validators.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_form.dart';
import 'package:medicalty/utiles/form_utiles/custom_suggestion_helpers.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_field.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';
import 'package:medicalty/utiles/images_utiles/custom_image_viewer.dart';

class NewProductScreen extends StatefulWidget {
  const NewProductScreen({Key? key}) : super(key: key);

  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  final productTypeTxtField = TextEditingController();
  final unitNumberTxtField = TextEditingController();
  final unitPriceTxtField = CurrencyTextFieldController(
    decimalSymbol: '.',
    thousandSymbol: ',',
    initDoubleValue: 0.00,
    enableNegative: false,
    currencySymbol: '\$',
  );
  final productNameTxtField = TextEditingController();
  final productDescriptionTxtField = TextEditingController();

  Future<void> save() async {}

  @override
  void dispose() {
    unitPriceTxtField.dispose();
    unitNumberTxtField.dispose();
    productTypeTxtField.dispose();
    productNameTxtField.dispose();
    productDescriptionTxtField.dispose();
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
            title: 'New Product / Service',
          ),
          body: SafeArea(
            child: CustomForm(
              saveButtonText: 'Create Product',
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
                  '#ID Product',
                  textAlign: TextAlign.center,
                  style: FontSizes.h7?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorsConstant.primaryColor,
                  ),
                ),
                const VerticalSizedBox(35),
                CustomTextField(
                  title: 'Product type',
                  hintText: 'Product type',
                  horizantalPadding: 20,
                  showHint: true,
                  showlable: false,
                  textController: productTypeTxtField,
                  suggestionCallback: (val) {
                    return [];
                  },
                  fieldList: const [],
                  onSuggestionSelected: (selected) {},
                  itemBuilder: (context, suggestion) {
                    return CustomSuggestionHelpers.itemPrimativTypesBuilder(
                      context,
                      suggestion,
                      productTypeTxtField.text,
                    );
                  },
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'product name',
                  horizantalPadding: 20,
                  controller: productNameTxtField,
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
                  label: 'Product Description',
                  horizantalPadding: 20,
                  controller: productDescriptionTxtField,
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
                Row(
                  children: [
                    const HorizantalSizedBox(20),
                    Expanded(
                      child: CustomTextFormField(
                        label: 'unit price \$',
                        controller: unitPriceTxtField,
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
                    ),
                    const HorizantalSizedBox(4),
                    Expanded(
                      child: CustomTextFormField(
                        label: 'Unit number',
                        controller: unitNumberTxtField,
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        validator: Validators.validateNumberField,
                        showSuffix: false,
                        onSaved: (value) {
                          // _signupModel = _signupModel.copyWith(name: value);
                        },
                        showlable: false,
                        showHint: true,
                      ),
                    ),
                    const HorizantalSizedBox(20),
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
