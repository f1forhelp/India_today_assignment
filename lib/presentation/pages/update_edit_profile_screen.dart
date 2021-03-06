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
import 'package:india_today_demo/utils/helper/validation_helper.dart';

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
  late GlobalKey<FormState> _formkey;
  final TextStyle _textStyleLabel = TextStyle(
    fontSize: 12.sp,
    color: KColor.primayBlue,
  );
  late TextEditingController _placeController;

  UpdateAddUserRequest updateAddUserRequest = UpdateAddUserRequest();

  @override
  void initState() {
    _formkey = GlobalKey<FormState>();
    _placeController = TextEditingController(
        text: widget.updateAddUserRequest?.birthPlace?.placeName);
    updateAddUserRequest = UpdateAddUserRequest.fromJson(
        widget.updateAddUserRequest?.toJson() ?? {});

    if (widget.updateAddUserRequest?.birthDetails == null) {
      updateAddUserRequest.birthDetails = BirthDetails();
    }
    if (widget.updateAddUserRequest?.birthPlace == null) {
      updateAddUserRequest.birthPlace = BirthPlace();
    }

    // updateAddUserRequest.birthPlace?.placeId =
    //     widget.updateAddUserRequest?.birthPlace?.placeId;
    // updateAddUserRequest.birthPlace?.placeName =
    //     widget.updateAddUserRequest?.birthPlace?.placeName;
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
      create: (context) => FamilyProfileBloc(),
      child: BlocConsumer<FamilyProfileBloc, FamilyProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              content: _AppBarContent(onBackPress: () {
                Navigator.pop(context);
              }),
            ),
            body: SafeArea(
              child: UiHelper.horizontalPadding(
                child: SingleChildScrollView(
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formkey,
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
                                validator: ValidationHelper.validateTextField,
                                topLabel: "First Name",
                                initialValue:
                                    widget.updateAddUserRequest?.firstName,
                                key: Key(
                                    widget.updateAddUserRequest?.firstName ??
                                        ""),
                                onChange: (val) {
                                  updateAddUserRequest.firstName = val;
                                },
                              ),
                            ),
                            UiHelper.w2(),
                            Expanded(
                              child: CustomTextFormField(
                                validator: ValidationHelper.validateTextField,
                                topLabel: "Last Name",
                                key: Key(
                                    widget.updateAddUserRequest?.lastName ??
                                        ""),
                                initialValue:
                                    widget.updateAddUserRequest?.lastName,
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
                                validator: ValidationHelper.validateTextField,
                                maxLength: 2,
                                textInputType: TextInputType.number,
                                hintText: "Ex 23",
                                key: Key(
                                  widget.updateAddUserRequest?.birthDetails
                                          ?.dobDay
                                          ?.toString() ??
                                      "dd",
                                ),
                                initialValue: widget.updateAddUserRequest
                                        ?.birthDetails?.dobDay
                                        ?.toString() ??
                                    "",
                                onChange: (val) {
                                  updateAddUserRequest.birthDetails?.dobDay =
                                      int.tryParse(val);
                                },
                              ),
                            ),
                            UiHelper.w2(),
                            Expanded(
                              child: CustomTextFormField(
                                validator: ValidationHelper.validateTextField,
                                maxLength: 2,
                                initialValue: widget.updateAddUserRequest
                                        ?.birthDetails?.dobMonth
                                        ?.toString() ??
                                    "",
                                key: Key(
                                  widget.updateAddUserRequest?.birthDetails
                                          ?.dobDay
                                          ?.toString() ??
                                      "MM",
                                ),
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
                                validator: ValidationHelper.validateTextField,
                                key: Key(
                                  widget.updateAddUserRequest?.birthDetails
                                          ?.dobDay
                                          ?.toString() ??
                                      "yy",
                                ),
                                hintText: "Ex 2020",
                                initialValue: widget.updateAddUserRequest
                                        ?.birthDetails?.dobYear
                                        ?.toString() ??
                                    "",
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
                                validator: ValidationHelper.validateTextField,
                                initialValue: widget.updateAddUserRequest
                                        ?.birthDetails?.tobHour
                                        ?.toString() ??
                                    "",
                                key: Key(
                                  widget.updateAddUserRequest?.birthDetails
                                          ?.tobHour
                                          ?.toString() ??
                                      "",
                                ),
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
                                validator: ValidationHelper.validateTextField,
                                maxLength: 2,
                                textInputType: TextInputType.number,
                                initialValue: widget.updateAddUserRequest
                                        ?.birthDetails?.tobMin
                                        ?.toString() ??
                                    "",
                                key: Key(
                                  widget.updateAddUserRequest?.birthDetails
                                          ?.tobMin
                                          ?.toString() ??
                                      "yy",
                                ),
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
                                  initalValueIsAm: (updateAddUserRequest
                                                  .birthDetails?.meridiem ==
                                              "AM" ||
                                          updateAddUserRequest
                                                  .birthDetails?.meridiem ==
                                              null
                                      ? true
                                      : false),
                                  key: Key(updateAddUserRequest
                                          .birthDetails?.meridiem
                                          ?.toString() ??
                                      ""),
                                  isAm: (p0) {
                                    updateAddUserRequest.birthDetails
                                        ?.meridiem = p0 ? "AM" : "PM";
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
                          validator: ValidationHelper.validateTextField,
                          onChange: (p0) {
                            updateAddUserRequest.birthPlace?.placeId =
                                p0.placeId;
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
                                    validator:
                                        ValidationHelper.validateTextField,
                                    intialValue:
                                        widget.updateAddUserRequest?.gender,
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
                                    validator:
                                        ValidationHelper.validateTextField,
                                    intialValue:
                                        widget.updateAddUserRequest?.relation,
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
                            if (_formkey.currentState?.validate() ?? false) {
                              if (widget.updateAddUserRequest == null) {
                                BlocProvider.of<FamilyProfileBloc>(context).add(
                                  CreateProfile(
                                      updateAddUserRequest:
                                          updateAddUserRequest),
                                );
                              } else {
                                BlocProvider.of<FamilyProfileBloc>(context).add(
                                  UpdateProfile(
                                      uuid: widget.updateAddUserRequest?.uuid ??
                                          "",
                                      updateAddUserRequest:
                                          updateAddUserRequest),
                                );
                              }
                            }
                          },
                          text: widget.updateAddUserRequest == null
                              ? "Create Profile"
                              : "Save Changes",
                        ),
                        UiHelper.h4(),
                      ],
                    ),
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
      {Key? key, required this.initalValueIsAm, required this.isAm})
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

  @override
  void initState() {
    isAm = widget.initalValueIsAm;
    widget.isAm(isAm);
    super.initState();
  }

  final double width = 96.w;
  final double height = 48.w;

  final int duration = 350;
  @override
  Widget build(BuildContext context) {
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
  final Function onBackPress;

  const _AppBarContent({Key? key, required this.onBackPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UiHelper.horizontalPadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () {
                onBackPress();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.orange,
                size: 25.sp,
              ),
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
