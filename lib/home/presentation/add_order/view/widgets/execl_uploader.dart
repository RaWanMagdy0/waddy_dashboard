import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart' hide Border;
import 'package:waddy_dashboard/core/styles/fonts/app_fonts.dart';

class ExcelUploader extends StatelessWidget {
  const ExcelUploader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: Colors.grey.shade300, width: 2.w),
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
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Add Order outo",
                  style: AppFonts.font35BlackWeight500,
                ),
              ),
              30.verticalSpace,
              Container(
                height: 300.h,
                width: 500.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: GestureDetector(
                  onTap: () async {
                    await _readExcelAndUploadToFirebase(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.upload_file),
                      10.horizontalSpace,
                      Text("Bulk Upload", style: AppFonts.font15BlackWeight400),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _readExcelAndUploadToFirebase(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
    );

    if (result == null || result.files.single.bytes == null) {
      if (!context.mounted) return;

      _showMessage(context, "The file was not selected.");
      return;
    }

    final bytes = result.files.single.bytes!;
    final excel = Excel.decodeBytes(bytes);
    final sheet = excel.tables[excel.tables.keys.first];

    if (sheet == null) {
      if (!context.mounted) return;

      _showMessage(context, "The file is empty or invalid.");
      return;
    }

    final headers = [
      'Client Name',
      'Phone',
      'Address',
      'Order Type',
      'Price',
      'Payment Way',
      'Note',
      'Weight',
    ];

    for (int rowIndex = 1; rowIndex < sheet.rows.length; rowIndex++) {
      final row = sheet.rows[rowIndex];

      for (int colIndex = 0; colIndex < headers.length; colIndex++) {
        if (headers[colIndex] == 'Note') continue; // Note is optional

        final cellValue = colIndex < row.length
            ? row[colIndex]?.value?.toString().trim() ?? ''
            : '';

        if (cellValue.isEmpty) {
          if (!context.mounted) return;

          _showMessage(
            context,
            "❌ cell '${headers[colIndex]}' Empty in row number${rowIndex + 1}",
          );
          return;
        }
      }
    }

    int uploadedCount = 0;
    for (int rowIndex = 1; rowIndex < sheet.rows.length; rowIndex++) {
      final row = sheet.rows[rowIndex];

      final order = {
        'client_name': row[0]?.value.toString().trim(),
        'phone': row[1]?.value.toString().trim(),
        'address': row[2]?.value.toString().trim(),
        'order_type': row[3]?.value.toString().trim(),
        'price': row[4]?.value.toString().trim(),
        'payment_way': row[5]?.value.toString().trim(),
        'note': row[6]?.value?.toString().trim() ?? '',
        'weight': row[7]?.value.toString().trim(),
        'created_at': FieldValue.serverTimestamp(),
      };

      await FirebaseFirestore.instance.collection('orders').add(order);
      uploadedCount++;
    }

    if (!context.mounted) return;
    _showMessage(
      context,
      "✅ has been uploaded $uploadedCount Order successfully!",
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.black87,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
