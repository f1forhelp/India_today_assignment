import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:india_today_demo/data/models/response/get_location_detail_response/datum.dart';
import 'package:india_today_demo/utils/constants/k_text_style.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CustomAutoSuggestField extends StatefulWidget {
  final TextEditingController? textEditingController;
  final int? maxLength;
  final String? hintText;
  final String? initialValue;
  final Function(Datum)? onChange;
  final FutureOr<Iterable<Datum>> Function(String) suggestionCallBack;
  const CustomAutoSuggestField({
    Key? key,
    this.textEditingController,
    this.maxLength,
    this.hintText,
    this.onChange,
    this.initialValue,
    required this.suggestionCallBack,
  }) : super(key: key);

  @override
  _CustomAutoSuggestFieldState createState() => _CustomAutoSuggestFieldState();
}

class _CustomAutoSuggestFieldState extends State<CustomAutoSuggestField> {
  int totalLetters = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TypeAheadField<Datum>(
          textFieldConfiguration: TextFieldConfiguration(
              controller: widget.textEditingController,
              style: KTextStyle.textFieldStyle,
              decoration: const InputDecoration(border: OutlineInputBorder())),
          suggestionsCallback: (pattern) async {
            return await widget.suggestionCallBack(pattern);
          },
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: Text(suggestion.placeName ?? ""),
            );
          },
          onSuggestionSelected: (suggestion) {
            if (widget.onChange != null) {
              widget.onChange!(suggestion);
            }
            widget.textEditingController?.text = suggestion.placeName ?? "";
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => ProductPage(product: suggestion)));
          },
        )
      ],
    );
  }
}
