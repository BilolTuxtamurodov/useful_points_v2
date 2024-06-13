import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usefulpoints/data/tools/styles/app_colors.dart';
import 'package:usefulpoints/data/tools/styles/text_theme.dart';

class CustomFormField extends StatefulWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String hintText;
  final TextInputType inputType;
  const CustomFormField({super.key, required this.controller, this.isPassword = false, this.hintText = '', this.inputType = TextInputType.text});

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool canShow = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w),
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.w),
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: Theme.of(context).hintColor),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.r),
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          controller: widget.controller,
          textInputAction: TextInputAction.done,
          keyboardType: widget.inputType,
          obscureText: !canShow && widget.isPassword,
          decoration: InputDecoration(
            contentPadding: widget.isPassword ? EdgeInsets.only(top: 5.h) : null,
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: robotoRegular.displayMedium?.copyWith(color: Theme.of(context).hintColor),
            suffixIcon: widget.isPassword ?
            Padding(
              padding: widget.isPassword ? EdgeInsets.only(top: 5.h) : EdgeInsets.zero,
              child: InkWell(
                onTap: () => setState(() {
                  canShow = !canShow;
                }),
                child: const Icon(Icons.remove_red_eye,),
              ),
            ) : null,
          ),
        ),
      ),
    );
  }
}
