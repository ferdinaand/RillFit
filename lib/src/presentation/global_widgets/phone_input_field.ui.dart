import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/domain/services/themes.services.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class PhoneInputField extends StatelessWidget {
  const PhoneInputField({
    super.key,
    required this.controller,
    this.onChanged,
  });

  final TextEditingController controller;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(
              color: Get.find<ThemeService>().isDarkMode
                  ? grayScale700
                  : grayScale100,
            ),
            borderRadius: const BorderRadius.all(
              smallRadius,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: const [
              TextUi(
                'NGR ',
                style: bodySmall,
              ),
              Icon(
                Icons.expand_more,
                color: primary,
                size: 24,
              )
            ],
          ),
        ),
        const Gap(12),
        Expanded(
          child: TextFieldUi(
            hintText: 'Phone number',
            controller: controller,
            inputFormatter: [
              LengthLimitingTextInputFormatter(11),
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.emailAddress,
            onChanged: onChanged,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.numeric(),
              FormBuilderValidators.required(
                errorText: 'An 11 digit phone number is required to proceed',
              ),
              FormBuilderValidators.maxLength(
                11,
                errorText: 'Phone number must be 11 characters',
              ),
              FormBuilderValidators.minLength(
                11,
                errorText: 'Phone number must be 11 characters',
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
