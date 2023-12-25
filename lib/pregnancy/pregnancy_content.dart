import 'package:flutter/material.dart';
import 'package:pregnancy_flutter/chat/bloc/chat_bloc.dart';
import 'package:pregnancy_flutter/common/base/base_child_stateful_widget.dart';
import 'package:pregnancy_flutter/common/constants/app_colors.dart';
import 'package:pregnancy_flutter/common/extension/text_extension.dart';
import 'package:pregnancy_flutter/pregnancy/pregnancy_model.dart';

class PregnancyContent extends BaseChildStatefulWidget {
  const PregnancyContent({super.key, required this.process});
  final PregnancyProcessModel process;

  @override
  State<PregnancyContent> createState() => _PregnancyContentState();
}

class _PregnancyContentState extends BaseChildStatefulState<PregnancyContent> {
  TextEditingController textController = TextEditingController();
  ChatBloc chatBloc = ChatBloc();

  @override
  Widget? buildBody() {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/pregnancy_backgroound_3.jpg'),
              fit: BoxFit.cover
          ),
        ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _generateContent('Thay đổi của mẹ', widget.process.mom ?? ''),
            _generateContent('Thay đổi của bé', widget.process.baby ?? ''),
            _generateContent('Lời khuyên cho mẹ', widget.process.advice ?? ''),
          ],
        )
      )
    );
  }

  Widget _generateContent(String? title, String content) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: const BorderRadius.all(Radius.circular(8))
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(title ?? '').w600().text16().mainColor().ellipsis(),
          ),
          Text(content).w400().text14().primaryTextColor().customHeight(1.6)
        ],
      ),
    );
  }
}