import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'dart:async';
class PhoneInputWidget extends StatefulWidget {
  const PhoneInputWidget(
      {super.key, this.validator, required this.phoneController});

  final FutureOr<String?> Function(PhoneNumber?)? validator;
  final TextEditingController phoneController;

  @override
  State<PhoneInputWidget> createState() => _PhoneInputWidgetState();
}

class _PhoneInputWidgetState extends State<PhoneInputWidget> {
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: IntlPhoneField(
        keyboardType: TextInputType.phone,
        controller: widget.phoneController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(color: Colors.black),
        focusNode: focusNode,
        validator: widget.validator,
        decoration: InputDecoration(
          labelText: 'Phone Number',
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
        initialCountryCode: 'EG',
      ),
    );
  }
}
