import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:india_today_demo/presentation/widgets/custom_appbar.dart';
import 'package:india_today_demo/presentation/widgets/custom_text_button.dart';
import 'package:india_today_demo/presentation/widgets/custom_text_form_field.dart';
import 'package:india_today_demo/utils/constants/k_color.dart';
import 'package:india_today_demo/utils/constants/k_text_style.dart';

import '../../utils/constants/k_asset.dart';
import '../../utils/helper/ui_helper.dart';
import '../bloc/family_profile/family_profile_bloc.dart';

class UpdateEditProfileScreen extends StatefulWidget {
  static const String id = "UpdateEditProfileScreen";
  const UpdateEditProfileScreen({Key? key}) : super(key: key);

  @override
  _UpdateEditProfileScreenState createState() =>
      _UpdateEditProfileScreenState();
}

class _UpdateEditProfileScreenState extends State<UpdateEditProfileScreen> {
  final TextStyle _textStyleLabel = TextStyle(
    fontSize: 12.sp,
    color: KColor.primayBlue,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FamilyProfileBloc()..add(const GetAllProfile()),
      child: BlocConsumer<FamilyProfileBloc, FamilyProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: const CustomAppBar(
              content: _AppBarContent(),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  UiHelper.h2(),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    color: Colors.orange.withOpacity(0.1),
                    child: UiHelper.horizontalPadding(
                      child: Text(
                        "Update Profile",
                        style: KTextStyle.mainHeadingDark
                            .copyWith(color: Colors.orange),
                      ),
                    ),
                  ),
                  UiHelper.h2(),
                  CustomTextFormField(
                    topLabel: "Name",
                    textEditingController: TextEditingController(),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          topLabel: "Name",
                          textEditingController: TextEditingController(),
                        ),
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          topLabel: "Name",
                          textEditingController: TextEditingController(),
                        ),
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          topLabel: "Name",
                          textEditingController: TextEditingController(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          topLabel: "Name",
                          textEditingController: TextEditingController(),
                        ),
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          topLabel: "Name",
                          textEditingController: TextEditingController(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AppBarContent extends StatelessWidget {
  const _AppBarContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UiHelper.horizontalPadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.orange,
            ),
          ),
          Image.asset(
            KAsset.astroLogo,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(
            width: 24.w,
          ),
        ],
      ),
    );
  }
}
