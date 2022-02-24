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
}
