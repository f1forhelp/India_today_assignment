import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:india_today_demo/presentation/bloc/ask_question/askquestion_bloc.dart';
import 'package:india_today_demo/presentation/widgets/custom_appbar.dart';
import 'package:india_today_demo/utils/app_init.dart';
import 'package:india_today_demo/utils/constants/k_asset.dart';
import 'package:india_today_demo/utils/constants/k_color.dart';
import 'package:india_today_demo/utils/constants/k_text_style.dart';
import 'package:india_today_demo/utils/helper/ui_helper.dart';

import '../widgets/custom_dropdown_menu.dart';
import '../widgets/custom_text_form_field.dart';

class AskQuestionScreen extends StatefulWidget {
  static const String id = "AskQuestionScreen";
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
      child: BlocConsumer<AskquestionBloc, AskquestionState>(
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
                            "Wallet Balance : ₹ 0",
                            style: KTextStyle.mainHeadingDark.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 18.w),
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
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: UiHelper.horizontalPadding(
                        child: Column(
                          children: [
                            UiHelper.h2(),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Ask a Question",
                                  style: KTextStyle.mainHeadingDark),
                            ),
                            UiHelper.h1(),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Seek accurate answers to your life problems and get guidance towards the right path. Wheather the problem is related to love,self,life,buisness,money,education or work, out astrologers will do an in depth study of your birth chart to provide personalized responses along with remedies.",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            UiHelper.h2(),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Choose Category",
                                style: KTextStyle.mainHeadingDark,
                              ),
                            ),
                            UiHelper.h2(),
                            CustomDropDownMenu(
                              hintText: "Select Category",
                              intialValue: state.categoryNames.isEmpty
                                  ? null
                                  : state.categoryNames.first,
                              dropDownItemns: state.categoryNames,
                              getSelected: (val) {
                                BlocProvider.of<AskquestionBloc>(context)
                                    .add(SetCategory(category: val ?? ""));
                                // context.read<AskquestionBloc>().add(
                                //       SetCategory(category: val ?? ""),
                                //     );
                              },
                            ),
                            UiHelper.h3(),
                            CustomTextFormField(
                              maxLength: 150,
                              maxLines: 4,
                              textEditingController: TextEditingController(),
                            ),
                            UiHelper.h2(),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Ideas what to Ask (Select Any)",
                                  style: KTextStyle.mainHeadingDark),
                            ),
                            state.questionFetchState.when(
                              data: (val) {
                                return Column(
                                  children: List.generate(
                                    (state.selectedSuggestion.length),
                                    (index) => _IdeasListItem(
                                      question: state.selectedSuggestion[index],
                                    ),
                                  ),
                                );
                              },
                              error: (val) {
                                return Text("Error ${val.toString()}");
                              },
                              idle: () {
                                return const Text("Idle");
                              },
                              loading: () {
                                return const SizedBox();
                              },
                            )
                          ],
                        ),
                      ),
                    ),
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
          Image.asset(
            KAsset.hamburger,
            fit: BoxFit.fitHeight,
          ),
          Image.asset(
            KAsset.astroLogo,
            fit: BoxFit.fitHeight,
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Image.asset(
                KAsset.profile,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IdeasListItem extends StatelessWidget {
  final String? question;

  _IdeasListItem({Key? key, this.question}) : super(key: key);

  final TextStyle _textStyle = TextStyle(
    fontSize: 14.sp,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.5,
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
            child: Text(
              question ?? "",
              style: _textStyle,
            ),
          )
        ],
      ),
    );
  }
}
