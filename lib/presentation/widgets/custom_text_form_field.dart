import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:india_today_demo/utils/constants/k_text_style.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? textEditingController;
  final int? maxLength;
  final int? maxLines;
  final String? topLabel;
  final String? hintText;
  final String? initialValue;
  final TextInputType? textInputType;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  const CustomTextFormField(
      {Key? key,
      this.textEditingController,
      this.maxLength,
      this.maxLines,
      this.topLabel,
      this.hintText,
      this.onChange,
      this.initialValue,
      this.textInputType,
      this.validator})
      : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  int totalLetters = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.topLabel == null
            ? const SizedBox()
            : Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.topLabel ?? "",
                      style: KTextStyle.textFiledTopHint),
                ),
              ),
        TextFormField(
          validator: widget.validator,
          style: KTextStyle.textFieldStyle,
          keyboardType: widget.textInputType,
          initialValue: widget.initialValue,
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
            ),
          ),
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          controller: widget.textEditingController,
          onChanged: widget.onChange,
        ),
      ],
    );
  }
}
