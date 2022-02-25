import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownMenu extends StatefulWidget {
  final List<String> dropDownItemns;
  final Function(String?) getSelected;
  final String? hintText;
  final String? intialValue;
  final String? Function(String?)? validator;
  const CustomDropDownMenu(
      {Key? key,
      required this.dropDownItemns,
      required this.getSelected,
      this.hintText,
      this.intialValue,
      this.validator})
      : super(key: key);

  @override
  _CustomDropDownMenuState createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  String? selectedValue;

  final TextStyle _textStyle = TextStyle(
    fontSize: 14.sp,
  );

  callGetValInit() {
    if (widget.intialValue != null && selectedValue == null) {
      widget.getSelected(widget.intialValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    callGetValInit();
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(border: OutlineInputBorder()),
      validator: widget.validator,
      isExpanded: true,
      hint: Text(
        widget.hintText ?? "",
        style: _textStyle.copyWith(
          color: Colors.black38,
        ),
      ),
      value: selectedValue ?? widget.intialValue,
      items: widget.dropDownItemns
          .map<DropdownMenuItem<String>>(
            (e) => DropdownMenuItem<String>(
              value: e,
              child: Text(
                e,
                style: _textStyle,
              ),
            ),
          )
          .toList(),
      onChanged: (val) {
        selectedValue = val;
        widget.getSelected(val);
        setState(() {});
      },
    );
  }
}
