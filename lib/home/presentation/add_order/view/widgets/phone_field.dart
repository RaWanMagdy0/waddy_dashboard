import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waddy_dashboard/core/const/custom/custom_text_form_field.dart';
import 'package:waddy_dashboard/core/styles/colors/app_colors.dart';
import 'package:waddy_dashboard/home/presentation/add_order/view_model/add_order_cubit.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({super.key, required this.viewModel});
  final AddOrderCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter phone number';
        }

        final cleaned = value.trim();

        if (!cleaned.startsWith('+02')) {
          return 'Phone number must 11 digits';
        }

        final digitsOnly = cleaned.replaceAll(RegExp(r'[^0-9]'), '');
        if (digitsOnly.length < 10) {
          return 'Phone number is too short';
        }

        return null;
      },

      controller: viewModel.phoneController,

      labelText: "Phone Number",
      keyBordType: TextInputType.phone,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.r)),
      borderColor: AppColors.kBlack,
      enabledBorderColor: AppColors.kBlack,
      focusedBorderColor: AppColors.kBaseColor,
    );
  }
}
