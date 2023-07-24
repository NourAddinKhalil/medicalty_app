import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/controllers/api_controllers/client_controller.dart';
import 'package:medicalty/controllers/screen_controllers/expense_screen_controller.dart';
import 'package:medicalty/helpers/convert_to_date_time.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/image_string_helpers.dart';
import 'package:medicalty/helpers/show_date_time_picker.dart';
import 'package:medicalty/helpers/validators.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_form.dart';
import 'package:medicalty/utiles/form_utiles/custom_suggestion_helpers.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_field.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';
import 'package:medicalty/utiles/images_utiles/custom_image_viewer.dart';
import 'package:medicalty/views/attatchment/widgets/select_attatchment_btn.dart';

class NewExpenseScreen extends GetView<ExpenseScreenController> {
  const NewExpenseScreen({super.key});

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
            title: 'New Expense',
          ),
          body: SafeArea(
            child: GetBuilder<ExpenseScreenController>(
              init: ExpenseScreenController(),
              builder: (controller) {
                return CustomForm(
                  saveButtonText: 'Create Expense',
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
                      '#ID Expense',
                      textAlign: TextAlign.center,
                      style: FontSizes.h7?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorsConstant.primaryColor,
                      ),
                    ),
                    const VerticalSizedBox(35),
                    CustomTextFormField(
                      label: 'Address',
                      horizantalPadding: 20,
                      controller: controller.addressTxtField,
                      textInputType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.next,
                      validator: Validators.checkIfNotEmpty,
                      icon: Icons.location_on_outlined,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          address: value,
                        );
                      },
                      showlable: false,
                      showHint: true,
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'Decription',
                      horizantalPadding: 20,
                      controller: controller.descriptionTxtField,
                      textInputType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      minLines: 4,
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
                    Row(
                      children: [
                        const HorizantalSizedBox(20),
                        Expanded(
                          child: CustomTextFormField(
                            label: 'Time',
                            showlable: false,
                            showHint: true,
                            readOnly: true,
                            controller: controller.timeTxtField,
                            textInputType: TextInputType.datetime,
                            textInputAction: TextInputAction.next,
                            validator: Validators.validateTimeFormat,
                            icon: Icons.watch_later_outlined,
                            onTap: () async {
                              controller.timeTxtField.text =
                                  await ShowDateTimePickers
                                      .showCustomTimePicker(
                                          controller.timeTxtField.text);
                            },
                            onSaved: (value) {
                              controller.model = controller.model.copyWith(
                                time: DateTimeHelpers.convertToTimeOfDayV2(
                                    value!),
                              );
                            },
                          ),
                        ),
                        const HorizantalSizedBox(6),
                        Expanded(
                          child: CustomTextFormField(
                            label: 'Date',
                            controller: controller.dateTxtField,
                            readOnly: true,
                            textInputType: TextInputType.datetime,
                            textInputAction: TextInputAction.next,
                            validator: Validators.validateDateFormat,
                            icon: Icons.calendar_month_outlined,
                            onSaved: (value) {
                              controller.model = controller.model.copyWith(
                                date:
                                    DateTimeHelpers.convertStringToDate(value!),
                              );
                            },
                            onTap: () async {
                              controller.dateTxtField.text =
                                  await ShowDateTimePickers
                                      .showCustomDatePicker(
                                          controller.dateTxtField.text);
                            },
                            showlable: false,
                            showHint: true,
                          ),
                        ),
                        const HorizantalSizedBox(20),
                      ],
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'The value of the expense \$',
                      showlable: false,
                      horizantalPadding: 20,
                      showHint: true,
                      fillColor: const Color(0xFFC6FCFF),
                      controller: controller.totalValueTxtField,
                      textInputType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validator: Validators.validateMoneyField,
                      icon: Icons.attach_money_outlined,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          amount: double.parse(value!),
                        );
                      },
                    ),
                    const VerticalSizedBox(15),
                    GetBuilder<ClientController>(builder: (cliCtrl) {
                      return CustomTextField(
                        title: 'Pay For',
                        hintText: 'Pay For',
                        horizantalPadding: 20,
                        showHint: true,
                        showlable: false,
                        controller: controller.payForTxtField,
                        suggestionCallback: (query) async {
                          final resList = await cliCtrl.get();
                          final res = resList.where((element) {
                            final name =
                                '${element.firstName} ${element.lastName}';
                            return name
                                .toLowerCase()
                                .contains(query.toLowerCase());
                          }).toList();
                          return res;
                        },
                        fieldList: null,
                        onSuggestionSelected: controller.onClientSelected,
                        itemBuilder: (context, suggestion) {
                          final name =
                              '${suggestion.firstName} ${suggestion.lastName}';
                          return CustomSuggestionHelpers
                              .itemPrimativTypesBuilder(
                            context,
                            name,
                            controller.payForTxtField.text,
                          );
                        },
                      );
                    }),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'Accounting code',
                      horizantalPadding: 20,
                      showlable: false,
                      showHint: true,
                      controller: controller.accountingCodeTxtField,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      icon: Icons.display_settings_outlined,
                      validator: null,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          accountingCode: value,
                        );
                      },
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'Customer Address',
                      horizantalPadding: 20,
                      showlable: false,
                      showHint: true,
                      controller: controller.customerAddressTxtField,
                      textInputType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.next,
                      validator: null,
                      icon: Icons.location_on_outlined,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          customerAddress: value,
                        );
                      },
                    ),
                    const VerticalSizedBox(15),
                    SelectAttatchmentBtn(
                      buttonTitle: 'Attach File',
                      attatchments: const [],
                      onSelected: (attachments) {},
                      iconOnEnd: true,
                    ),
                    const VerticalSizedBox(20),
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
