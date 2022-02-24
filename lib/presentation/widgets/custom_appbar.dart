import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? content;

  const CustomAppBar({Key? key, this.content}) : super(key: key);

  @override
  Size get preferredSize => Size(1.sw, 46.h);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // ignore: avoid_unnecessary_containers
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 3.h),
        constraints: const BoxConstraints(
          maxHeight: 52,
        ),
        child: content,
      ),
    );
  }
}
