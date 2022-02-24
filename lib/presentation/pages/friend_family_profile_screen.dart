import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:india_today_demo/presentation/widgets/custom_appbar.dart';
import 'package:india_today_demo/presentation/widgets/custom_text_button.dart';
import 'package:india_today_demo/utils/constants/k_color.dart';
import 'package:india_today_demo/utils/constants/k_text_style.dart';

import '../../utils/constants/k_asset.dart';
import '../../utils/helper/ui_helper.dart';
import '../bloc/family_profile/family_profile_bloc.dart';

class FrindFamilyProfileScreen extends StatefulWidget {
  static const String id = "FrindFamilyProfileScreen";
  const FrindFamilyProfileScreen({Key? key}) : super(key: key);

  @override
  _FrindFamilyProfileScreenState createState() =>
      _FrindFamilyProfileScreenState();
}

class _FrindFamilyProfileScreenState extends State<FrindFamilyProfileScreen> {
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
                child: Stack(
              children: [
                Column(
                  children: [
                    UiHelper.h2(),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      color: Colors.orange.withOpacity(0.1),
                      child: UiHelper.horizontalPadding(
                        child: Text(
                          "Friends And Family Profile",
                          style: KTextStyle.mainHeadingDark
                              .copyWith(color: Colors.orange),
                        ),
                      ),
                    ),
                    UiHelper.h2(),
                    Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text("Name",
                                textAlign: TextAlign.center,
                                style: _textStyleLabel)),
                        Expanded(
                            flex: 2,
                            child: Text("DOB",
                                textAlign: TextAlign.center,
                                style: _textStyleLabel)),
                        Expanded(
                            flex: 2,
                            child: Text("TOB",
                                textAlign: TextAlign.center,
                                style: _textStyleLabel)),
                        Expanded(
                            flex: 2,
                            child: Text("Relation",
                                textAlign: TextAlign.center,
                                style: _textStyleLabel)),
                        Expanded(child: SizedBox()),
                        Expanded(child: SizedBox()),
                      ],
                    ),
                    state.relativesProfileFetchState.when(
                        idle: () => const SizedBox(),
                        loading: () => const SizedBox(),
                        data: (val) {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: val.data?.allRelatives?.length ?? 0,
                              itemBuilder: (context, i) {
                                return UiHelper.horizontalPadding(
                                  child: _ListItem(
                                    onDelete: () {
                                      BlocProvider.of<FamilyProfileBloc>(
                                              context)
                                          .add(
                                        DeleteProfile(
                                            uuid: val.data?.allRelatives![i]
                                                    .uuid ??
                                                ""),
                                      );
                                    },
                                    dob:
                                        "${val.data?.allRelatives![i].birthDetails?.dobDay}-${val.data?.allRelatives![i].birthDetails?.dobMonth}-${val.data?.allRelatives![i].birthDetails?.dobYear}",
                                    name: val.data?.allRelatives![i].firstName,
                                    relation:
                                        val.data?.allRelatives![i].relation,
                                    tob:
                                        "${val.data?.allRelatives![i].birthDetails?.tobHour}:${val.data?.allRelatives![i].birthDetails?.tobMin}",
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        error: (v) {
                          return const SizedBox();
                        })
                  ],
                ),
                Align(
                  alignment: Alignment(0, 0.8),
                  child: CustomTextButton(text: "Create Profile"),
                ),
              ],
            )),
          );
        },
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final Function? onDelete;
  final Function? onEdit;
  final String? name;
  final String? dob;
  final String? tob;
  final String? relation;

  _ListItem(
      {Key? key,
      this.name,
      this.dob,
      this.tob,
      this.relation,
      this.onDelete,
      this.onEdit})
      : super(key: key);

  final TextStyle _textStyle = TextStyle(
    fontSize: 12.sp,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      constraints: BoxConstraints(minHeight: 65.h),
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(3.r)),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Text(
                name ?? "",
                textAlign: TextAlign.center,
                style: _textStyle,
              )),
          Expanded(
              flex: 2,
              child: Text(
                dob ?? "",
                textAlign: TextAlign.center,
                style: _textStyle,
              )),
          Expanded(
              flex: 2,
              child: Text(
                tob ?? "",
                textAlign: TextAlign.center,
                style: _textStyle,
              )),
          Expanded(
              flex: 2,
              child: Text(
                relation ?? "",
                textAlign: TextAlign.center,
                style: _textStyle,
              )),
          Expanded(
              child: GestureDetector(
                  onTap: () {
                    if (onEdit != null) {
                      onEdit!();
                    }
                  },
                  child: const Icon(Icons.edit))),
          Expanded(
              child: GestureDetector(
                  onTap: () {
                    if (onDelete != null) {
                      onDelete!();
                    }
                  },
                  child: const Icon(Icons.delete)))
        ],
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
