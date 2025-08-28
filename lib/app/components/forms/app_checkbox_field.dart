import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppCheckboxField extends StatefulWidget {
  const AppCheckboxField({
    super.key,
    required this.label,
    required this.onChanged,
    required this.isChecked,
  });

  final bool isChecked;
  final String label;
  final ValueChanged onChanged;

  @override
  State<AppCheckboxField> createState() => _AppCheckboxFieldState();
}

class _AppCheckboxFieldState extends State<AppCheckboxField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: widget.isChecked,
          activeColor: Colors.blue,
          onChanged: widget.onChanged,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact
        ),
        SizedBox(width: 10.sp,),
        Expanded(
          child: Text(
            widget.label,
            style: GoogleFonts.poppins(),
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
