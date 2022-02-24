import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController textEditingController;
  final bool enableCounter;
  final int? maxLength;
  final int? maxLines;
  const CustomTextFormField(
      {Key? key,
      required this.textEditingController,
      this.enableCounter = false,
      this.maxLength,
      this.maxLines})
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
        TextFormField(
          decoration: InputDecoration(
            hintText: "Type a question here",
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
