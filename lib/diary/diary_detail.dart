import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregnancy_flutter/_gen/assets.gen.dart';
import 'package:pregnancy_flutter/common/Widgets/custom_button.dart';
import 'package:pregnancy_flutter/common/base/base_app_bar.dart';
import 'package:pregnancy_flutter/common/base/base_statefull_widget.dart';
import 'package:pregnancy_flutter/common/constants/app_colors.dart';
import 'package:pregnancy_flutter/common/extension/date_time_extension.dart';
import 'package:pregnancy_flutter/common/widgets/customTextField.dart';
import 'package:pregnancy_flutter/common/widgets/date_picker/date_picker_2.dart';
import 'package:pregnancy_flutter/diary/bloc/diary_bloc.dart';
import 'package:pregnancy_flutter/diary/bloc/diary_event.dart';
import 'package:pregnancy_flutter/diary/bloc/diary_state.dart';
import 'package:pregnancy_flutter/diary/model/diary.dart';
import 'package:pregnancy_flutter/routes/routes.dart';

class DiaryDetail extends BaseStatefulWidget {
  DiaryDetail({super.key, this.diary});

  Diary? diary;
  @override
  State<DiaryDetail> createState() => _DiaryState();
}

class _DiaryState extends BaseStatefulState<DiaryDetail> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  DiaryBloc diaryBloc = DiaryBloc();

  @override
  PreferredSizeWidget? buildAppBar() {
    return AppBar(
      title: CustomButton(
          titleColor: Colors.white,
          backgroundColor: Colors.transparent,
          onTappedAction: () async {
            final date = await showDatePicker2(
              context: context,
              initialDate: widget.diary?.time ?? DateTime.now(),
              firstDate: DateTime(DateTime.now().year - 1),
              currentDate: DateTime.now(),
              lastDate: DateTime(DateTime.now().year + 2),
              cancelText: 'Huỷ',
              confirmText: 'Xong',
            );

            setState(() {
              widget.diary?.time = date ?? DateTime.now();
            });
          },
          title: DateTime.now().globalDateFormat(context),
      ),
      backgroundColor: AppColors.mainColor,
      leading: InkWell(
        onTap: () => Routes.instance.pop(),
        child: Align(
          alignment: Alignment.center,
          child: Assets.icons.arrowBack.svg(width: 24, height: 24),
        ),
      ),
    );
  }

  @override
  Widget? buildBody() {
    return BlocProvider(
        create: (context) => diaryBloc,
        child: BlocListener<DiaryBloc, DiaryState> (
            listener: (context, state) {
              if (state is LoadingSuccessfulState) {
                setState(() {
                });
              }
            },
            child: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/pregnancy_backgroound_3.jpg'),
                    fit: BoxFit.cover),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const CustomTextField(
                        hintText: 'Tiêu đề',
                        maxLines: 2,
                      ),
                      const SizedBox(height: 20),
                      const CustomTextField(
                        hintText: 'Nội dung',
                        maxLines: 6,
                        minLines: 2,
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                          titleColor: Colors.white,
                          backgroundColor: AppColors.mainColor,
                          onTappedAction: () {
                            if (widget.diary != null) {
                              diaryBloc.add(EditDiary(
                                  widget.diary,
                                  DateTime.now(),
                                  titleController.text,
                                  contentController.text)
                              );
                            } else {
                              diaryBloc.add(CreateDiary(
                                  titleController.text,
                                  DateTime.now(),
                                  contentController.text)
                              );
                            }
                          },
                          title: 'Lưu'
                      )
                    ],
                  ),
                ),
              ),
            )
        )
    );
  }
}