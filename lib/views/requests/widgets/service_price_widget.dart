import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/validators.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_form.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';
import 'package:medicalty/views/invoice/widgets/invoice_bottom_header.dart';
import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicePriceWidget extends StatefulWidget {
  const ServicePriceWidget({
    super.key,
    required this.prevValue,
    required this.onSave,
  });
  final double prevValue;
  final void Function(double price) onSave;

  @override
  State<ServicePriceWidget> createState() => _ServicePriceWidgetState();
}

class _ServicePriceWidgetState extends State<ServicePriceWidget> {
  final priceController = CurrencyTextFieldController(
    currencySymbol: '\$',
    enableNegative: false,
    currencyOnLeft: true,
    decimalSymbol: '.',
    thousandSymbol: ',',
    numberOfDecimals: 2,
  );
  @override
  void initState() {
    priceController.text = widget.prevValue.toStringAsFixed(2);
    super.initState();
  }

  @override
  void dispose() {
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InvoiceBottomHeader(
      title: 'Write service price amount',
      child: CustomForm(
        paddingHorizantal: 20,
        save: () async {
          Get.back();
        },
        children: [
          CustomTextFormField(
            label: '',
            innerTextStyle: FontSizes.h6?.copyWith(
              color: ColorsConstant.green1,
              fontWeight: FontWeight.bold,
            ),
            controller: priceController,
            validator: Validators.validateMoneyField,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.number,
            showUnderlinedStyle: true,
            enabledBorder: const UnderlineInputBorder(),
            onSaved: (value) {
              widget.onSave(priceController.doubleValue);
            },
          ),
          const VerticalSizedBox(30),
        ],
      ),
    );
  }
}
