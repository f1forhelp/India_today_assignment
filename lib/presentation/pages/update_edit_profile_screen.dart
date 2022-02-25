import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:india_today_demo/data/models/request/update_add_user_request/birth_details.dart';
import 'package:india_today_demo/data/models/request/update_add_user_request/birth_place.dart';
import 'package:india_today_demo/data/models/request/update_add_user_request/update_add_user_request.dart';
import 'package:india_today_demo/data/models/response/get_location_detail_response/datum.dart';
import 'package:india_today_demo/data/repositories/relative_profile_repository.dart';
import 'package:india_today_demo/presentation/widgets/custom_appbar.dart';
import 'package:india_today_demo/presentation/widgets/custom_autosuggest_field.dart';
import 'package:india_today_demo/presentation/widgets/custom_dropdown_menu.dart';
import 'package:india_today_demo/presentation/widgets/custom_text_button.dart';
import 'package:india_today_demo/presentation/widgets/custom_text_form_field.dart';
import 'package:india_today_demo/utils/constants/k_color.dart';
import 'package:india_today_demo/utils/constants/k_text_style.dart';

import '../../utils/constants/k_asset.dart';
import '../../utils/helper/ui_helper.dart';
import '../bloc/family_profile/family_profile_bloc.dart';

class UpdateEditProfileScreen extends StatefulWidget {
  final UpdateAddUserRequest? updateAddUserRequest;
  static const String id = "UpdateEditProfileScreen";
  const UpdateEditProfileScreen({Key? key, this.updateAddUserRequest})
      : super(key: key);

  @override
  _UpdateEditProfileScreenState createState() =>
      _UpdateEditProfileScreenState();
}

class _UpdateEditProfileScreenState extends State<UpdateEditProfileScreen> {
  final TextStyle _textStyleLabel = TextStyle(
    fontSize: 12.sp,
    color: KColor.primayBlue,
  );
  late TextEditingController _placeController;

  UpdateAddUserRequest updateAddUserRequest = UpdateAddUserRequest();

  @override
  void initState() {
    _placeController = TextEditingController(
        text: widget.updateAddUserRequest?.birthPlace?.placeName);
    updateAddUserRequest.birthDetails = BirthDetails();
    updateAddUserRequest.birthPlace = BirthPlace();
    updateAddUserRequest.birthPlace?.placeId =
        widget.updateAddUserRequest?.birthPlace?.placeId;
    updateAddUserRequest.birthPlace?.placeName =
        widget.updateAddUserRequest?.birthPlace?.placeName;
    super.initState();
  }

  FutureOr<Iterable<Datum>> tempFunc(String p0) async {
    var res = await RelativeProfileRepository.getLocationData(location: p0);
    return res.when(success: (v) {
      return Future.value(v.data ?? []);
    }, failure: (e) {
      return Future.value([]);
    });
  }

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
              child: UiHelper.horizontalPadding(
                child: SingleChildScrollView(
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
                            widget.updateAddUserRequest == null
                                ? "Update Profile"
                                : "Create Profile",
                            style: KTextStyle.mainHeadingDark
                                .copyWith(color: Colors.orange),
                          ),
                        ),
                      ),
                      UiHelper.h2(),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              topLabel: "First Name",
                              initialValue: updateAddUserRequest.fullName,
                              onChange: (val) {
                                updateAddUserRequest.firstName = val;
                              },
                            ),
                          ),
                          UiHelper.w2(),
                          Expanded(
                            child: CustomTextFormField(
                              topLabel: "Last Name",
                              initialValue: updateAddUserRequest.lastName,
                              onChange: (val) {
                                updateAddUserRequest.lastName = val;
                              },
                            ),
                          ),
                        ],
                      ),
                      UiHelper.h2(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Date of birth",
                          style: KTextStyle.textFiledTopHint,
                        ),
                      ),
                      UiHelper.h1(),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              maxLength: 2,
                              textInputType: TextInputType.number,
                              hintText: "Ex 23",
                              onChange: (val) {
                                updateAddUserRequest.birthDetails?.dobDay =
                                    int.tryParse(val);
                              },
                            ),
                          ),
                          UiHelper.w2(),
                          Expanded(
                            child: CustomTextFormField(
                              maxLength: 2,
                              textInputType: TextInputType.number,
                              hintText: "Ex 12",
                              onChange: (val) {
                                updateAddUserRequest.birthDetails?.dobMonth =
                                    int.tryParse(val);
                              },
                            ),
                          ),
                          UiHelper.w2(),
                          Expanded(
                            child: CustomTextFormField(
                              hintText: "Ex 2020",
                              maxLength: 4,
                              textInputType: TextInputType.number,
                              onChange: (val) {
                                updateAddUserRequest.birthDetails?.dobYear =
                                    int.tryParse(val);
                              },
                            ),
                          ),
                        ],
                      ),
                      UiHelper.h2(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Time of birth",
                          style: KTextStyle.textFiledTopHint,
                        ),
                      ),
                      UiHelper.h1(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              maxLength: 2,
                              textInputType: TextInputType.number,
                              onChange: (val) {
                                updateAddUserRequest.birthDetails?.tobHour =
                                    int.tryParse(val);
                              },
                            ),
                          ),
                          UiHelper.w2(),
                          Expanded(
                            child: CustomTextFormField(
                              maxLength: 2,
                              textInputType: TextInputType.number,
                              onChange: (val) {
                                updateAddUserRequest.birthDetails?.tobMin =
                                    int.tryParse(val);
                              },
                            ),
                          ),
                          UiHelper.w2(),
                          Expanded(
                            child: Center(
                              child: AmPmSelector(
                                isAm: (p0) {
                                  updateAddUserRequest.birthDetails?.meridiem =
                                      p0 ? "AM" : "PM";
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      UiHelper.h2(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Place of birth",
                          style: KTextStyle.textFiledTopHint,
                        ),
                      ),
                      UiHelper.h1(),
                      CustomAutoSuggestField(
                        onChange: (p0) {
                          updateAddUserRequest.birthPlace?.placeId = p0.placeId;
                          updateAddUserRequest.birthPlace?.placeName =
                              p0.placeName;
                        },
                        textEditingController: _placeController,
                        suggestionCallBack: (p0) async {
                          return tempFunc(p0);
                        },
                      ),
                      // CustomTextFormField(
                      //   hintText: "Plasce of Birth",
                      //   onChange: (val) {
                      //     updateAddUserRequest.birthPlace?.placeName = val;
                      //   },
                      // ),
                      UiHelper.h3(),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                UiHelper.h2(),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Gender",
                                    style: KTextStyle.textFiledTopHint,
                                  ),
                                ),
                                UiHelper.h1(),
                                CustomDropDownMenu(
                                  getSelected: (p0) {
                                    updateAddUserRequest.gender = p0;
                                  },
                                  dropDownItemns: ["MALE", "FEMALE"],
                                ),
                              ],
                            ),
                          ),
                          UiHelper.w4(),
                          Expanded(
                            child: Column(
                              children: [
                                UiHelper.h2(),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Relation",
                                    style: KTextStyle.textFiledTopHint,
                                  ),
                                ),
                                UiHelper.h1(),
                                CustomDropDownMenu(
                                  getSelected: (p0) {
                                    if (p0 == "Brother") {
                                      updateAddUserRequest.relationId = 3;
                                    }
                                    if (p0 == "Sister") {
                                      updateAddUserRequest.relationId = 4;
                                    }
                                    if (p0 == "Father") {
                                      updateAddUserRequest.relationId = 1;
                                    }

                                    updateAddUserRequest.relation = p0;
                                  },
                                  dropDownItemns: [
                                    "Brother",
                                    "Sister",
                                    "Father"
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      UiHelper.h4(),
                      CustomTextButton(
                        onTap: () {
                          if (false) {
                          } else {
                            BlocProvider.of<FamilyProfileBloc>(context).add(
                              CreateProfile(
                                  updateAddUserRequest: updateAddUserRequest),
                            );
                          }
                        },
                        text: "Save Changes",
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AmPmSelector extends StatefulWidget {
  final bool initalValueIsAm;
  final Function(bool) isAm;

  const AmPmSelector(
      {Key? key, this.initalValueIsAm = true, required this.isAm})
      : super(key: key);

  @override
  _AmPmSelectorState createState() => _AmPmSelectorState();
}

class _AmPmSelectorState extends State<AmPmSelector> {
  bool isAm = false;
  final double borderRadius = 4.r;
  final TextStyle _amPmStyle = TextStyle(
    fontSize: 14.sp,
  );

  final double width = 96.w;
  final double height = 48.w;

  final int duration = 350;
  @override
  Widget build(BuildContext context) {
    if (isAm != null) {}

    return GestureDetector(
      onTap: () {
        isAm = isAm ? false : true;
        widget.isAm(isAm);
        setState(() {});
      },
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Colors.black54,
              offset: Offset(0.5, 1),
            )
          ],
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        duration: Duration(milliseconds: duration),
        width: width,
        height: height,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AnimatedAlign(
              duration: Duration(milliseconds: duration),
              alignment: isAm ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                width: width / 2,
                decoration: BoxDecoration(
                  color: KColor.primayBlue,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      "AM",
                      style: _amPmStyle.copyWith(
                        color: isAm ? Colors.white : KColor.primayBlue,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "PM",
                      style: _amPmStyle.copyWith(
                        color: !isAm ? Colors.white : KColor.primayBlue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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
