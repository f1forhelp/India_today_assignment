import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController textEditingController;
  final int? maxLength;
  final int? maxLines;
  final String? topLabel;
  final String? hintText;
  const CustomTextFormField(
      {Key? key,
      required this.textEditingController,
      this.maxLength,
      this.maxLines,
      this.topLabel,
      this.hintText})
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
                  child: Text(widget.topLabel ?? ""),
                ),
              ),
        TextFormField(
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
            ),
          ),
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          controller: widget.textEditingController,
          onChanged: (val) {
            totalLetters = val.length;
            setState(() {});
          },
        ),
      ],
    );
  }
}
