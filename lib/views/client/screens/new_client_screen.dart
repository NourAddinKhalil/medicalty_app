import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/controllers/screen_controllers/client_screen_controller.dart';
import 'package:medicalty/helpers/enums.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/image_string_helpers.dart';
import 'package:medicalty/helpers/validators.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_form.dart';
import 'package:medicalty/utiles/form_utiles/custom_suggestion_helpers.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_field.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';
import 'package:medicalty/utiles/images_utiles/custom_image_viewer.dart';

class NewClientScreen extends GetView<ClientScreenController> {
  const NewClientScreen({super.key});

  Widget _buildTextFieldHelper(Widget first, Widget second) {
    return Row(
      children: [
        first,
        const HorizantalSizedBox(6),
        Flexible(
          flex: 3,
          child: second,
        ),
      ],
    );
  }

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
            title: 'Create Clients',
          ),
          body: SafeArea(
            child: GetBuilder<ClientScreenController>(
              init: ClientScreenController(),
              builder: (controller) {
                return CustomForm(
                  paddingHorizantal: 20,
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
                      '#ID Client',
                      textAlign: TextAlign.center,
                      style: FontSizes.h7?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorsConstant.primaryColor,
                      ),
                    ),
                    const VerticalSizedBox(35),
                    _buildTextFieldHelper(
                      CustomTextField<PersonTypesEnum>(
                        title: '',
                        width: 120,
                        showlable: false,
                        showClearIcon: false,
                        showHint: false,
                        controller: controller.personPrefixTxtField,
                        suggestionCallback: (val) {
                          return PersonTypesEnum.values;
                        },
                        fieldList: PersonTypesEnum.values,
                        onSuggestionSelected: (selected) {
                          controller.personPrefixTxtField.text = selected.name;
                          controller.model = controller.model.copyWith(
                            nameDescription: selected.name,
                          );
                        },
                        itemBuilder: (context, suggestion) {
                          return CustomSuggestionHelpers
                              .itemPrimativTypesBuilder(
                            context,
                            suggestion.name,
                            controller.personPrefixTxtField.text,
                          );
                        },
                      ),
                      CustomTextFormField(
                        label: 'First Name',
                        controller: controller.firstNameTxtField,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: Validators.checkIfNotEmpty,
                        icon: Icons.contacts_outlined,
                        onSaved: (value) {
                          controller.model = controller.model.copyWith(
                            firstName: value,
                          );
                        },
                        showlable: false,
                        showHint: true,
                      ),
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'Second and last name',
                      controller: controller.lastNameTxtField,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: Validators.checkIfNotEmpty,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          lastName: value,
                        );
                      },
                      icon: Icons.contacts_outlined,
                      showlable: false,
                      showHint: true,
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'Company Name',
                      showlable: false,
                      showHint: true,
                      controller: controller.companyTxtField,
                      textInputType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      validator: Validators.validatePhoneNumberField,
                      icon: Icons.phone_outlined,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          companyName: value,
                        );
                      },
                    ),
                    const VerticalSizedBox(15),
                    _buildTextFieldHelper(
                      CustomTextField<PhoneTypesEnum>(
                        title: '',
                        width: 120,
                        showlable: false,
                        showClearIcon: false,
                        showHint: false,
                        controller: controller.phoneTypeTxtField,
                        suggestionCallback: (val) {
                          return PhoneTypesEnum.values;
                        },
                        fieldList: PhoneTypesEnum.values,
                        onSuggestionSelected: (selected) {
                          controller.phoneTypeTxtField.text = selected.name;
                          controller.model = controller.model.copyWith(
                            phoneDescription: selected.name,
                          );
                        },
                        itemBuilder: (context, suggestion) {
                          return CustomSuggestionHelpers
                              .itemPrimativTypesBuilder(
                            context,
                            suggestion.name,
                            controller.phoneTypeTxtField.text,
                          );
                        },
                      ),
                      CustomTextFormField(
                        label: 'Phone Number',
                        controller: controller.phoneTxtField,
                        textInputType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        validator: Validators.validatePhoneNumberField,
                        icon: Icons.phone_outlined,
                        onSaved: (value) {
                          controller.model = controller.model.copyWith(
                            phone: value,
                          );
                        },
                        showlable: false,
                        showHint: true,
                      ),
                    ),
                    const VerticalSizedBox(15),
                    _buildTextFieldHelper(
                      CustomTextField<EmailTypesEnum>(
                        title: '',
                        showClearIcon: false,
                        width: 120,
                        showlable: false,
                        showHint: false,
                        controller: controller.emailTypeTxtField,
                        suggestionCallback: (val) {
                          return EmailTypesEnum.values;
                        },
                        fieldList: EmailTypesEnum.values,
                        onSuggestionSelected: (selected) {
                          controller.emailTypeTxtField.text = selected.name;
                          controller.model = controller.model.copyWith(
                            emailDescription: selected.name,
                          );
                        },
                        itemBuilder: (context, suggestion) {
                          return CustomSuggestionHelpers
                              .itemPrimativTypesBuilder(
                            context,
                            suggestion.name,
                            controller.emailTypeTxtField.text,
                          );
                        },
                      ),
                      CustomTextFormField(
                        label: 'E-mail',
                        showlable: false,
                        showHint: true,
                        controller: controller.emailTxtField,
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: Validators.validateEmail,
                        icon: Icons.email_outlined,
                        onSaved: (value) {
                          controller.model = controller.model.copyWith(
                            firstName: value,
                          );
                        },
                      ),
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'Attributed to',
                      showlable: false,
                      showHint: true,
                      controller: controller.attributedToTxtField,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: Validators.checkIfNotEmpty,
                      onSaved: (value) {
                        // controller.model =
                        //       controller.model.copyWith(: value,);
                      },
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'Customer Address',
                      showlable: false,
                      showHint: true,
                      controller: controller.addressTxtField,
                      textInputType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.next,
                      validator: null,
                      icon: Icons.location_on_outlined,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          address: value,
                        );
                      },
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'Customer Address 2',
                      showlable: false,
                      showHint: true,
                      controller: controller.address2TxtField,
                      textInputType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.next,
                      validator: null,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          address2: value,
                        );
                      },
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'City',
                      showlable: false,
                      showHint: true,
                      controller: controller.cityTxtField,
                      textInputType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.next,
                      validator: null,
                      icon: Icons.location_city_outlined,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          city: value,
                        );
                      },
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'Inturupt',
                      showlable: false,
                      showHint: true,
                      controller: controller.inturuptTxtField,
                      textInputType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.next,
                      icon: Icons.flag_outlined,
                      validator: null,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          province: value,
                        );
                      },
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'Zip Code',
                      showlable: false,
                      showHint: true,
                      controller: controller.zipCodeTxtField,
                      textInputType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validator: null,
                      icon: Icons.folder_zip_outlined,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          zipCode: value,
                        );
                      },
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'Country',
                      showlable: false,
                      showHint: true,
                      controller: controller.countryTxtField,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: null,
                      icon: Icons.flag_outlined,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          country: value,
                        );
                      },
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
