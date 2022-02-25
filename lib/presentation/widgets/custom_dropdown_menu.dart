import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownMenu extends StatefulWidget {
  final List<String> dropDownItemns;
  final Function(String?) getSelected;
  final String? hintText;
  final String? intialValue;
  const CustomDropDownMenu(
      {Key? key,
      required this.dropDownItemns,
      required this.getSelected,
      this.hintText,
      this.intialValue})
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 1,
            color: Colors.black38,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        hint: Text(
          widget.hintText ?? "",
          style: _textStyle.copyWith(
            color: Colors.black38,
          ),
        ),
        underline: const SizedBox(),
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
      ),
    );
  }
}
