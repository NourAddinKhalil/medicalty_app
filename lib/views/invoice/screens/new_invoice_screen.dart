import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/controllers/screen_controllers/money_screen_controller.dart';
import 'package:medicalty/controllers/screen_controllers/invoice_screen_controller.dart';
import 'package:medicalty/helpers/convert_to_date_time.dart';
import 'package:medicalty/helpers/enums.dart';
import 'package:medicalty/helpers/enums_helpers/payment_types_helper.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/image_string_helpers.dart';
import 'package:medicalty/helpers/show_date_time_picker.dart';
import 'package:medicalty/helpers/validators.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/buttons_utiles/select_item_button.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_form.dart';
import 'package:medicalty/utiles/form_utiles/custom_suggestion_helpers.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_field.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';
import 'package:medicalty/utiles/images_utiles/custom_image_viewer.dart';
import 'package:medicalty/views/invoice/screens/pay_amount_screen.dart';
import 'package:medicalty/views/invoice/widgets/money_details_invoice.dart';
import 'package:medicalty/views/message/screens/message_screen.dart';

class NewInvoiceScreen extends GetView<InvoiceScreenController> {
  const NewInvoiceScreen({super.key});

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
            title: 'New Invoice',
          ),
          body: SafeArea(
            child: GetBuilder<InvoiceScreenController>(
                init: InvoiceScreenController(),
                builder: (controller) {
                  return CustomForm(
                    saveButtonText: 'Create Invoice',
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
                          enableTabToChoose: false,
                          height: 120,
                          width: 120,
                          image: controller.companyLogo,
                          allowedExtensions:
                              ImageStringHelpers.imagesExtensions,
                          showChooseDocument: false,
                          showChooseVideo: false,
                        ),
                      ),
                      const VerticalSizedBox(15),
                      Text(
                        '#ID Invoice',
                        textAlign: TextAlign.center,
                        style: FontSizes.h7?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorsConstant.primaryColor,
                        ),
                      ),
                      const VerticalSizedBox(35),
                      CustomTextField(
                        title: 'Pay For',
                        hintText: 'Pay For',
                        horizantalPadding: 20,
                        showHint: true,
                        showlable: false,
                        controller: controller.payForTxtField,
                        suggestionCallback: (val) {
                          return [];
                        },
                        fieldList: const [],
                        onSuggestionSelected: (selected) {},
                        itemBuilder: (context, suggestion) {
                          return CustomSuggestionHelpers
                              .itemPrimativTypesBuilder(
                            context,
                            suggestion,
                            controller.payForTxtField.text,
                          );
                        },
                      ),
                      const VerticalSizedBox(15),
                      CustomTextFormField(
                        label: 'Invoice Address',
                        horizantalPadding: 20,
                        controller: controller.addressTxtField,
                        textInputType: TextInputType.streetAddress,
                        textInputAction: TextInputAction.next,
                        validator: Validators.checkIfNotEmpty,
                        icon: Icons.location_on_outlined,
                        onSaved: (value) {
                          controller.model = controller.model.copyWith(
                            invoiceAddress: value,
                          );
                        },
                        showlable: false,
                        showHint: true,
                      ),
                      const VerticalSizedBox(15),
                      CustomTextFormField(
                        label: 'Date of transmission',
                        controller: controller.dateTxtField,
                        horizantalPadding: 20,
                        readOnly: true,
                        textInputType: TextInputType.datetime,
                        textInputAction: TextInputAction.next,
                        validator: Validators.validateDateFormat,
                        icon: Icons.calendar_month_outlined,
                        onSaved: (value) {
                          controller.model = controller.model.copyWith(
                            dueDate:
                                DateTimeHelpers.convertStringToDate(value!),
                          );
                        },
                        onTap: () async {
                          controller.dateTxtField.text =
                              await ShowDateTimePickers.showCustomDatePicker(
                                  controller.dateTxtField.text);
                        },
                        showlable: false,
                        showHint: true,
                      ),
                      const VerticalSizedBox(15),
                      CustomTextField<PaymentTypesClass>(
                        title: 'Payment Due',
                        hintText: 'Payment Due',
                        horizantalPadding: 20,
                        showHint: true,
                        showlable: false,
                        controller: controller.paymentDueTxtField,
                        suggestionCallback: (val) {
                          return paymentTypesList;
                        },
                        fieldList: paymentTypesList,
                        onSuggestionSelected: controller.onPaymentTypeSelected,
                        itemBuilder: (context, suggestion) {
                          return CustomSuggestionHelpers
                              .itemPrimativTypesBuilder(
                            context,
                            suggestion.name,
                            controller.paymentDueTxtField.text,
                          );
                        },
                      ),
                      const VerticalSizedBox(15),
                      GetBuilder<InvoiceScreenController>(
                        id: 'pay_field',
                        builder: (controller) {
                          if (!controller.showPayTextField) {
                            return const SizedBox();
                          }
                          return Column(
                            children: [
                              CustomTextFormField(
                                label: 'Paymnet amount',
                                controller: controller.paymentTxtField,
                                horizantalPadding: 20,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.number,
                                validator: (value) {
                                  return Validators.validateMoneyField(
                                      value, false);
                                },
                                onSaved: (value) {
                                  controller.model = controller.model.copyWith(
                                    dueAmont:
                                        controller.paymentTxtField.doubleValue,
                                  );
                                },
                              ),
                              const VerticalSizedBox(25),
                            ],
                          );
                        },
                      ),
                      SelectItemButton(
                        title: 'Select Items',
                        iconOnEnd: true,
                        onTab: () {},
                      ),
                      const VerticalSizedBox(15),
                      CustomTextField(
                        title: 'Items',
                        hintText: 'Items',
                        horizantalPadding: 20,
                        showHint: true,
                        showlable: false,
                        controller: controller.itemsTxtField,
                        suggestionCallback: (val) {
                          return [];
                        },
                        fieldList: const [],
                        onSuggestionSelected: (selected) {},
                        itemBuilder: (context, suggestion) {
                          return CustomSuggestionHelpers
                              .itemPrimativTypesBuilder(
                            context,
                            suggestion,
                            controller.itemsTxtField.text,
                          );
                        },
                      ),
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
                      const VerticalSizedBox(30),
                      Center(
                        child: Container(
                          margin: CustomEdgeInsets.horizontal(40),
                          padding: CustomEdgeInsets.symmetric(12, 30),
                          decoration: BoxDecoration(
                            color: const Color(0xFFB0C929).withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // subtotal
                              GetBuilder<InvoiceScreenController>(
                                id: 'subtotal',
                                builder: (controller) {
                                  return MoneyDetailsInvoice(
                                    title: 'Subtotal',
                                    amount: controller.subTotal,
                                    fontSize: FontSizes.h7?.fontSize,
                                    onPressed: () {},
                                    showAddText: false,
                                  );
                                },
                              ),
                              const VerticalSizedBox(8),
                              // Discount
                              GetBuilder<MoneyScreenController>(
                                init: MoneyScreenController('Discount'),
                                // global: false,
                                // assignId: true,
                                // id: 'dis',
                                // key: const Key('dis'),
                                tag: 'Dis',
                                builder: (disCtrl) {
                                  if (disCtrl.getAmount > 0) {
                                    controller.discount = disCtrl.getAmount;
                                    controller.discountType = disCtrl.moneyType;
                                  }
                                  return MoneyDetailsInvoice(
                                    title: 'Discount',
                                    amount: disCtrl.getAmount,
                                    onPressed: () {
                                      Get.to(() => const PayAmountScreen(
                                            tagName: 'Dis',
                                          ));
                                    },
                                    // color: ColorsConstant.green1,
                                    isFixed: controller.isDiscountTypeFixed,
                                  );
                                },
                              ),
                              const VerticalSizedBox(8),
                              // tax
                              GetBuilder<MoneyScreenController>(
                                init: MoneyScreenController(
                                  'Tax',
                                  onlyOneType: true,
                                  type: MoneyTypeEnum.ratio,
                                ),
                                // id: 'tax',
                                // global: false,
                                // assignId: true,
                                // key: const Key('tax'),
                                tag: 'Tax',
                                builder: (taxCtrl) {
                                  if (taxCtrl.getAmount > 0) {
                                    controller.taxRate = taxCtrl.getAmount;
                                  }
                                  return MoneyDetailsInvoice(
                                    title: 'Tax',
                                    amount: taxCtrl.getAmount,
                                    onPressed: () {
                                      Get.to(() => const PayAmountScreen(
                                            tagName: 'Tax',
                                          ));
                                    },
                                    // color: ColorsConstant.green1,
                                    isFixed: false,
                                  );
                                },
                              ),
                              const VerticalSizedBox(8),
                              // deposite
                              GetBuilder<MoneyScreenController>(
                                init: MoneyScreenController('Deposite'),
                                // id: 'depo',
                                // global: false,
                                // assignId: true,
                                // key: const Key('depo'),
                                tag: 'Depo',
                                builder: (depoCtrl) {
                                  if (depoCtrl.getAmount > 0) {
                                    controller.deposite = depoCtrl.getAmount;
                                    controller.depositeType =
                                        depoCtrl.moneyType;
                                  }
                                  return MoneyDetailsInvoice(
                                    title: 'Request deposite',
                                    amount: depoCtrl.getAmount,
                                    onPressed: () {
                                      Get.to(() => const PayAmountScreen(
                                            tagName: 'Depo',
                                          ));
                                    },
                                    // color: ColorsConstant.green1,
                                    isFixed: controller.isDepositeTypeFixed,
                                  );
                                },
                              ),

                              const VerticalSizedBox(8),
                              // total
                              GetBuilder<InvoiceScreenController>(
                                id: 'total',
                                builder: (controller) {
                                  return MoneyDetailsInvoice(
                                    title: 'Total',
                                    amount: controller.total,
                                    fontSize: FontSizes.h7?.fontSize,
                                    onPressed: () {},
                                    showAddText: false,
                                  );
                                },
                              ),
                              const VerticalSizedBox(8),
                            ],
                          ),
                        ),
                      ),
                      const VerticalSizedBox(15),

                      // Message
                      SelectItemButton(
                        isSelected: false,
                        title: 'Message Client',
                        iconOnEnd: true,
                        iconColor: ColorsConstant.green1,
                        onTab: () async {
                          final message = await Get.to<String?>(
                            () => const MessageScreen(),
                            transition: Transition.downToUp,
                          );

                          if (message != null) {
                            controller.clientMessage = message;
                          }
                        },
                        onClearPressed: () {
                          controller.clientMessage = '';
                        },
                      ),
                      // Message details
                      GetBuilder<InvoiceScreenController>(
                        id: 'message',
                        builder: (controller) {
                          final selected = controller.isMessageWritten;
                          if (!selected) return const SizedBox();
                          return Padding(
                            padding: CustomEdgeInsets.horizontal(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const VerticalSizedBox(15),
                                Text(
                                  controller.clientMessage,
                                  style: FontSizes.h6?.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      const VerticalSizedBox(30),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
