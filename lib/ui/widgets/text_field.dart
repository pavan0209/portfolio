import 'package:flutter/material.dart';
import 'package:portfolio/common/styles/index.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const AppTextField(
      {super.key,
      required this.controller,
      this.labelText,
      this.hintText,
      this.maxLines,
      this.keyboardType,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.defaultPadding),
      child: TextFormField(
        controller: controller,
        style: AppStyles.whiteText(),
        keyboardType: keyboardType ?? TextInputType.text,
        cursorColor: AppColors.white,
        maxLines: maxLines,
        validator: validator,
        textInputAction: TextInputAction.none,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: AppColors.darkYellow),
          hintText: hintText,
          hintStyle: AppStyles.lightGreyText(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.lightGrey,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.darkYellow.withOpacity(0.6),
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.darkGrey,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.red,
              width: 2,
            ),
          ),
          errorStyle: AppStyles.redText(),
        ),
      ),
    );
  }
}
