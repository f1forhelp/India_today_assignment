// TODO Implement this library.

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UiHelper {
  UiHelper._();

  static Widget horizontalPadding({required Widget child}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: child,
    );
  }

  static Widget h1() => SizedBox(
        height: 6.h,
      );
  static Widget h2() => SizedBox(
        height: 10.h,
      );
  static Widget h3() => SizedBox(
        height: 14.h,
      );
  static Widget h4() => SizedBox(
        height: 20.h,
      );
  static Widget w1() => SizedBox(
        width: 6.w,
      );
  static Widget w2() => SizedBox(
        width: 10.w,
      );
  static Widget w3() => SizedBox(
        width: 14.w,
      );
  static Widget w4() => SizedBox(
        width: 20.w,
      );
}
