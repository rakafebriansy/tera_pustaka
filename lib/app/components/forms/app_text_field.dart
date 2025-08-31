import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tera_pustaka/app/theme/app_%20colors.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.placeholder,
    required this.controller,
    this.obscure = false,
    this.keyboardType,
    this.rules,
    this.confirmController,
  });

  final String label;
  final String placeholder;
  final TextEditingController controller;
  final bool obscure;
  final TextInputType? keyboardType;
  final String? rules;
  final TextEditingController? confirmController;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {

  String? _dynamicValidator(String? value) {
    if (widget.rules == null) return null;

    final rules = widget.rules!.split('|');

    for (var rule in rules) {
      if (rule == 'required') {
        if (value == null || value.trim().isEmpty) {
          return '${widget.label} wajib diisi';
        }
      }

      if (rule.startsWith('min:')) {
        final min = int.tryParse(rule.split(':')[1]) ?? 0;
        if (value != null && value.length < min) {
          return '${widget.label} minimal $min karakter';
        }
      }

      if (rule == 'confirm_password') {
        if (widget.confirmController != null &&
            value != widget.confirmController!.text) {
          return 'Konfirmasi password tidak sama';
        }
      }
    }

    return null;
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: GoogleFonts.poppins(fontSize: 16.sp)),
        SizedBox(height: 4.sp,),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.obscure,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          validator: _dynamicValidator,
          decoration: InputDecoration(
            hintText: widget.placeholder,
            hintStyle: const TextStyle(color: Colors.grey),
            labelStyle: const TextStyle(color: AppColors.primary),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
