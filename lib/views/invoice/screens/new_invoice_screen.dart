import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
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
import 'package:medicalty/views/invoice/widgets/money_details_invoice.dart';
import 'package:medicalty/views/message/screens/message_screen.dart';

class NewInvoiceScreen extends StatefulWidget {
  const NewInvoiceScreen({super.key});

  @override
  State<NewInvoiceScreen> createState() => _NewInvoiceScreenState();
}

class _NewInvoiceScreenState extends State<NewInvoiceScreen> {
  final descriptionTxtField = TextEditingController();
  final paymentDueTxtField = TextEditingController();
  final itemsTxtField = TextEditingController();
  final dateTxtField = TextEditingController();
  final payForTxtField = TextEditingController();
  final totalValueTxtField = CurrencyTextFieldController(
    decimalSymbol: '.',
    thousandSymbol: ',',
    initDoubleValue: 0.00,
    enableNegative: false,
    currencySymbol: '\$',
  );
  final addressTxtField = TextEditingController();
  final customerAddressTxtField = TextEditingController();
  final accountingCodeTxtField = TextEditingController();

  Future<void> save() async {}

  @override
  void dispose() {
    descriptionTxtField.dispose();
    dateTxtField.dispose();
    payForTxtField.dispose();
    paymentDueTxtField.dispose();
    itemsTxtField.dispose();
    totalValueTxtField.dispose();
    addressTxtField.dispose();
    customerAddressTxtField.dispose();
    accountingCodeTxtField.dispose();
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
            title: 'New Invoice',
          ),
          body: SafeArea(
            child: CustomForm(
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
                  textController: payForTxtField,
                  suggestionCallback: (val) {
                    return [];
                  },
                  fieldList: const [],
                  onSuggestionSelected: (selected) {},
                  itemBuilder: (context, suggestion) {
                    return CustomSuggestionHelpers.itemPrimativTypesBuilder(
                      context,
                      suggestion,
                      payForTxtField.text,
                    );
                  },
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Invoice Address',
                  horizantalPadding: 20,
                  controller: addressTxtField,
                  textInputType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  validator: Validators.checkIfNotEmpty,
                  icon: Icons.location_on_outlined,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                  showlable: false,
                  showHint: true,
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Date of transmission',
                  controller: dateTxtField,
                  horizantalPadding: 20,
                  readOnly: true,
                  textInputType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
                  validator: Validators.validateDateFormat,
                  icon: Icons.calendar_month_outlined,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                  onTap: () async {
                    dateTxtField.text =
                        await ShowDateTimePickers.showCustomDatePicker(
                            dateTxtField.text);
                  },
                  showlable: false,
                  showHint: true,
                ),
                const VerticalSizedBox(15),
                CustomTextField(
                  title: 'Payment Due',
                  hintText: 'Payment Due',
                  horizantalPadding: 20,
                  showHint: true,
                  showlable: false,
                  textController: paymentDueTxtField,
                  suggestionCallback: (val) {
                    return [];
                  },
                  fieldList: const [],
                  onSuggestionSelected: (selected) {},
                  itemBuilder: (context, suggestion) {
                    return CustomSuggestionHelpers.itemPrimativTypesBuilder(
                      context,
                      suggestion,
                      paymentDueTxtField.text,
                    );
                  },
                ),
                const VerticalSizedBox(15),
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
                  textController: itemsTxtField,
                  suggestionCallback: (val) {
                    return [];
                  },
                  fieldList: const [],
                  onSuggestionSelected: (selected) {},
                  itemBuilder: (context, suggestion) {
                    return CustomSuggestionHelpers.itemPrimativTypesBuilder(
                      context,
                      suggestion,
                      itemsTxtField.text,
                    );
                  },
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Accounting code',
                  horizantalPadding: 20,
                  showlable: false,
                  showHint: true,
                  controller: accountingCodeTxtField,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  icon: Icons.display_settings_outlined,
                  validator: null,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Customer Address',
                  horizantalPadding: 20,
                  showlable: false,
                  showHint: true,
                  controller: customerAddressTxtField,
                  textInputType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  validator: null,
                  icon: Icons.location_on_outlined,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                ),
                const VerticalSizedBox(30),
                Center(
                  child: Container(
                    margin: CustomEdgeInsets.horizontal(50),
                    padding: CustomEdgeInsets.symmetric(12, 40),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB0C929).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // subtotal
                        // GetBuilder<InvoiceScreenController>(
                        //   id: 'subtotal',
                        //   builder: (controller) {
                        //     return
                        MoneyDetailsInvoice(
                          title: 'Subtotal',
                          amount: 0.00, //controller.subTotal,
                          fontSize: FontSizes.h7?.fontSize,
                          onPressed: () {},
                          showAddText: false,
                        ),
                        //   },
                        // ),
                        const VerticalSizedBox(8),
                        // Discount
                        // GetBuilder<DiscountScreenController>(
                        //   init: DiscountScreenController(),
                        //   builder: (disCtrl) {
                        // if (disCtrl.getDiscount > 0) {
                        //   controller.discount = disCtrl.getDiscount;
                        //   controller.discountType = disCtrl.moneyType;
                        // }
                        // return
                        MoneyDetailsInvoice(
                          title: 'Discount',
                          amount: 0.00, //disCtrl.getDiscount,
                          onPressed: () {
                            // Get.toNamed(AppRouter.discountRoute);
                          },
                          // color: ColorsConstant.green1,
                          isFixed: true, //controller.isDiscountTypeFixed,
                        ),
                        //   },
                        // ),
                        const VerticalSizedBox(8),
                        // tax
                        // GetBuilder<CustomSearchController<TaxModel>>(
                        //   init: CustomSearchController<TaxModel>(
                        //       defaultModel: TaxModel.defaultModel),
                        //   id: 'tax',
                        //   builder: (searchCtrl) {
                        //     final isThere = searchCtrl.isModelSelected();
                        //     if (isThere) {
                        //       controller.taxRate = searchCtrl.list.first.ratio;
                        //     }
                        //     return
                        MoneyDetailsInvoice(
                          title: 'Tax',
                          amount:
                              0.00, //isThere ? searchCtrl.list[0].ratio : 0.00,
                          onPressed: () {
                            // Get.toNamed(AppRouter.searchTaxRoute);
                          },
                          // color: ColorsConstant.green1,
                          isFixed: false,
                        ),
                        //   },
                        // ),
                        const VerticalSizedBox(8),
                        // deposite
                        // GetBuilder<DepositeScreenController>(
                        //   init: DepositeScreenController(),
                        //   builder: (depoCtrl) {
                        //     if (depoCtrl.getDeposite > 0) {
                        //       controller.deposite = depoCtrl.getDeposite;
                        //       controller.depositeType = depoCtrl.moneyType;
                        //     }
                        //     return
                        MoneyDetailsInvoice(
                          title: 'Request deposite',
                          amount: 0.00, //depoCtrl.getDeposite,
                          onPressed: () {
                            // Get.toNamed(AppRouter.depositeRoute);
                          },
                          // color: ColorsConstant.green1,
                          isFixed: true, //controller.isDepositeTypeFixed,
                        ),
                        //   },
                        // ),

                        const VerticalSizedBox(8),
                        // total
                        // GetBuilder<InvoiceScreenController>(
                        //   id: 'total',
                        //   builder: (controller) {
                        //     return
                        MoneyDetailsInvoice(
                          title: 'Total',
                          amount: 0.00, //controller.total,
                          fontSize: FontSizes.h7?.fontSize,
                          onPressed: () {},
                          showAddText: false,
                        ),
                        //   },
                        // ),
                        const VerticalSizedBox(8),
                      ],
                    ),
                  ),
                ),
                const VerticalSizedBox(15),
                SelectItemButton(
                  title: 'Message Client',
                  iconOnEnd: true,
                  iconColor: ColorsConstant.green1,
                  onTab: () {
                    Get.to(() => const MessageScreen());
                  },
                ),
                const VerticalSizedBox(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
