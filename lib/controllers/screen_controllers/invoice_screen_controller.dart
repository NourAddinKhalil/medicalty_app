import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';
import 'package:medicalty/helpers/enums.dart';
import 'package:medicalty/helpers/enums_helpers/payment_types_helper.dart';
import 'package:medicalty/models/invoice_model.dart';
import 'package:medicalty/models/product_model.dart';

class InvoiceScreenController extends HelpersController {
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
  final paymentTxtField = CurrencyTextFieldController(
    decimalSymbol: '.',
    thousandSymbol: ',',
    initDoubleValue: 0.00,
    enableNegative: false,
    currencySymbol: '\$',
  );
  final addressTxtField = TextEditingController();
  final customerAddressTxtField = TextEditingController();
  final accountingCodeTxtField = TextEditingController();

  final products = <ProductModel>[];

  String companyLogo = '';

  void fillProducts(List<ProductModel> pros) {
    products.clear();
    products.addAll(pros);
  }

  var model = InvoiceModel.defaultModel;

  var subTotal = 0.0;

  var _taxRate = 0.0;
  double get taxRate => _taxRate;
  set taxRate(double value) {
    _taxRate = value;
    calculateNet();
    // calculateRemaining();
  }

  var deposite = 0.0;
  MoneyTypeEnum depositeType = MoneyTypeEnum.fixed;
  bool get isDepositeTypeFixed => discountType == MoneyTypeEnum.fixed;

  var _discount = 0.0;
  double get discount => _discount;
  MoneyTypeEnum discountType = MoneyTypeEnum.fixed;
  bool get isDiscountTypeFixed => discountType == MoneyTypeEnum.fixed;

  set discount(double value) {
    _discount = value;
    calculateNet();
    // calculateRemaining();
  }

  var total = 0.0;

  var _clientMessage = '';
  String get clientMessage => _clientMessage.trim();
  set clientMessage(String message) {
    if (message != clientMessage) {
      _clientMessage = message;
      model = model.copyWith(message: message);
      update(['message']);
    }
  }

  bool get isMessageWritten => clientMessage != '' && clientMessage.isNotEmpty;

  void calcSubtotal() {
    var sum = 0.0;
    for (var element in products) {
      sum += element.price;
    }
    subTotal = sum;
    update(['subtotal']);
    // amountsTxtField.text = sum.toString();
    // paymentTxtField.text = _total().toString();
    calculateNet();
    // calculateRemaining();
  }

  double _total() {
    final tax = subTotal * taxRate;
    var discountVal = discount;
    if (discountType == MoneyTypeEnum.ratio) {
      discountVal = subTotal * discountVal;
    }
    return (subTotal + tax) - (discountVal);
  }

  void calculateNet() {
    // netBillTxtField.text = _total().toString();
    total = _total();
    // calculateRemaining();
    update(['total']);
  }

  var showPayTextField = false;

  void onPaymentTypeSelected(PaymentTypesClass selected) {
    showPayTextField = false;
    final payment = total * selected.payRatio;
    if (selected.id == PaymentTypeEnum.custom) {
      showPayTextField = true;
    }
    update(['pay_field']);
    paymentDueTxtField.text = selected.name;
    paymentTxtField.text = selected.payRatio.toStringAsFixed(2);
    model = model.copyWith(
      dueAmontType: selected.id,
      dueAmont: payment,
    );
    update(['payment_type']);
  }

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
}
