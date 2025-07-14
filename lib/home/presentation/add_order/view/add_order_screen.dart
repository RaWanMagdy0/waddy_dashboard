// File: presentation/pages/add_order_screen.dart

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waddy_dashboard/core/const/custom/custom_botton.dart';
import 'package:waddy_dashboard/core/const/custom/custom_text_form_field.dart';
import 'package:waddy_dashboard/core/styles/colors/app_colors.dart';
import 'package:waddy_dashboard/core/styles/fonts/app_fonts.dart';
import 'package:waddy_dashboard/home/presentation/add_order/view/widgets/execl_uploader.dart';
import 'package:waddy_dashboard/home/presentation/add_order/view/widgets/phone_field.dart';
import 'package:waddy_dashboard/home/presentation/add_order/view_model/add_order_cubit.dart';
import 'package:waddy_dashboard/home/presentation/add_order/view_model/add_order_state.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  late AddOrderCubit viewModel;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    viewModel = context.read<AddOrderCubit>();
  }

  void _onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      viewModel.createOrder();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Order created successfully!")),
          );
        } else if (state is AddOrderFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Failed: ${state.message}")));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Create New Order",
                          style: AppFonts.font35BlackWeight500,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(24.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.r),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 2.w,
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            20.verticalSpace,
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Add Order Manully",
                                style: AppFonts.font35BlackWeight500,
                              ),
                            ),
                            20.verticalSpace,
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextFormField(
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please enter client name';
                                      }
                                      return null;
                                    },
                                    controller: viewModel.nameController,
                                    labelText: "Client Name",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.r),
                                    ),
                                    borderColor: AppColors.kBlack,
                                    enabledBorderColor: AppColors.kBlack,
                                    focusedBorderColor: AppColors.kBaseColor,
                                  ),
                                ),
                                30.horizontalSpace,
                                Expanded(
                                  child: PhoneField(viewModel: viewModel),
                                ),
                              ],
                            ),
                            20.verticalSpace,
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextFormField(
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please enter address';
                                      }
                                      return null;
                                    },
                                    controller: viewModel.addressController,
                                    onTap: () {},
                                    labelText: "Address",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.r),
                                    ),
                                    borderColor: AppColors.kBlack,
                                    enabledBorderColor: AppColors.kBlack,
                                    focusedBorderColor: AppColors.kBaseColor,
                                  ),
                                ),
                                30.horizontalSpace,
                                Expanded(
                                  child: CustomTextFormField(
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please enter Order Type';
                                      }
                                      return null;
                                    },
                                    controller: viewModel.typeController,
                                    onTap: () {},
                                    labelText: "Order Type",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.r),
                                    ),
                                    borderColor: AppColors.kBlack,
                                    enabledBorderColor: AppColors.kBlack,
                                    focusedBorderColor: AppColors.kBaseColor,
                                  ),
                                ),
                              ],
                            ),
                            20.verticalSpace,
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextFormField(
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please enter Price';
                                      }
                                      return null;
                                    },
                                    controller: viewModel.priceController,
                                    onTap: () {},
                                    labelText: "Price",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.r),
                                    ),
                                    borderColor: AppColors.kBlack,
                                    enabledBorderColor: AppColors.kBlack,
                                    focusedBorderColor: AppColors.kBaseColor,
                                  ),
                                ),
                                30.horizontalSpace,
                                Expanded(
                                  child: CustomTextFormField(
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please enter Payment Way';
                                      }
                                      return null;
                                    },
                                    controller: viewModel.paymentController,
                                    onTap: () {},
                                    labelText: "Payment Way",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.r),
                                    ),
                                    borderColor: AppColors.kBlack,
                                    enabledBorderColor: AppColors.kBlack,
                                    focusedBorderColor: AppColors.kBaseColor,
                                  ),
                                ),
                              ],
                            ),
                            20.verticalSpace,
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextFormField(
                                    controller: viewModel.noteController,
                                    onTap: () {},
                                    labelText: "Note ",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.r),
                                    ),
                                    borderColor: AppColors.kBlack,
                                    enabledBorderColor: AppColors.kBlack,
                                    focusedBorderColor: AppColors.kBaseColor,
                                  ),
                                ),
                                30.horizontalSpace,
                                Expanded(
                                  child: CustomTextFormField(
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please enter Weight';
                                      }
                                      return null;
                                    },
                                    controller: viewModel.weightController,
                                    onTap: () {},
                                    labelText: "Weight",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.r),
                                    ),
                                    borderColor: AppColors.kBlack,
                                    enabledBorderColor: AppColors.kBlack,
                                    focusedBorderColor: AppColors.kBaseColor,
                                  ),
                                ),
                              ],
                            ),
                            20.verticalSpace,
                            CustomButton(
                              height: 100.h,
                              width: 300.w,
                              onPressed: state is AddOrderLoading
                                  ? null
                                  : _onSubmit,
                              color: AppColors.kBaseColor,
                              text: "Confirm Order",
                              textStyle: AppFonts.font15BlackWeight700,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  ExcelUploader(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
