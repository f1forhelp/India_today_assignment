import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:india_today_demo/presentation/bloc/ask_question/askquestion_bloc.dart';
import 'package:india_today_demo/utils/app_init.dart';
import 'package:india_today_demo/utils/constants/k_color.dart';
import 'package:india_today_demo/utils/constants/k_text_style.dart';
import 'package:india_today_demo/utils/helper/ui_helper.dart';

class AskQuestionScreen extends StatefulWidget {
  const AskQuestionScreen({Key? key}) : super(key: key);

  @override
  _AskQuestionScreenState createState() => _AskQuestionScreenState();
}

class _AskQuestionScreenState extends State<AskQuestionScreen> {
  late AskquestionBloc askquestionBloc;

  @override
  void initState() {
    askquestionBloc = AppInit.getIt<AskquestionBloc>();
    askquestionBloc.add(const GetQuestions());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: askquestionBloc,
      child: BlocListener<AskquestionBloc, AskquestionState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                // ignore: avoid_unnecessary_containers
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  decoration: const BoxDecoration(
                    color: KColor.primayBlue,
                  ),
                  child: UiHelper.horizontalPadding(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Wallet Balance: ₹ 0",
                          style: KTextStyle.mainHeadingDark.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black87,
                              width: 1,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            "Add Money",
                            style: TextStyle(
                              color: KColor.primayBlue,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                UiHelper.horizontalPadding(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Ask a Question",
                            style: KTextStyle.mainHeadingDark),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Seek accurate answer i mmimijn nun b bhb ybuy guy gitf itf iytfyit fiyt fiytf iytf iytf itf iytf iytf iytf iytf iytf iytfv hl jb ho78t tf ; og utre rsu yli yyt rtd titu yyt fiy tff",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Choose Category",
                            style: KTextStyle.mainHeadingDark),
                      ),
                      CustomDropDownMenu(
                        dropDownItemns: const ["Love", "Hate", "SomeThing"],
                        getSelected: (vval) {
                          print(vval);
                        },
                      ),
                      CustomTextFormField(
                        enableCounter: true,
                        maxLength: 3,
                        maxLines: 4,
                        textEditingController: TextEditingController(),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Ideas what to Ask (Select Any)",
                            style: KTextStyle.mainHeadingDark),
                      ),
                      BlocBuilder<AskquestionBloc, AskquestionState>(
                        builder: (context, state) {
                          return state.questionFetchState.when(
                            data: (val) {
                              return Column(
                                children: List.generate(
                                  (val.data?.length ?? 0),
                                  (index) => _IdeasListItem(),
                                ),
                              );
                            },
                            error: (val) {
                              return Text("Error ${val.toString()}");
                            },
                            idle: () {
                              return Text("Idle");
                            },
                            loading: () {
                              return CircularProgressIndicator();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _IdeasListItem extends StatelessWidget {
  final String? question;

  const _IdeasListItem({Key? key, this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.5,
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Icon(
              Icons.help_outline,
              size: 26.h,
              color: Colors.orange.shade800,
            ),
          ),
          Expanded(
            child: Text(question ?? ""),
          )
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatefulWidget {
  final TextEditingController textEditingController;
  final bool enableCounter;
  final int? maxLength;
  final int? maxLines;
  const CustomTextFormField(
      {Key? key,
      required this.textEditingController,
      this.enableCounter = false,
      this.maxLength,
      this.maxLines})
      : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  int totalLetters = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: "Type a question here",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
            ),
          ),
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          controller: widget.textEditingController,
          onChanged: (val) {
            totalLetters = val.length;
            setState(() {});
          },
        ),
      ],
    );
  }
}

class CustomDropDownMenu extends StatefulWidget {
  final List<String> dropDownItemns;
  final Function(String?) getSelected;

  const CustomDropDownMenu(
      {Key? key, required this.dropDownItemns, required this.getSelected})
      : super(key: key);

  @override
  _CustomDropDownMenuState createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
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
        underline: const SizedBox(),
        value: selectedValue,
        items: widget.dropDownItemns
            .map<DropdownMenuItem<String>>(
              (e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e),
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
