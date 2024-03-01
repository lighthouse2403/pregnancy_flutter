import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregnancy_flutter/common/base/base_statefull_widget.dart';
import 'package:pregnancy_flutter/common/constants/constants.dart';
import 'package:pregnancy_flutter/common/extension/font_size_extension.dart';
import 'package:pregnancy_flutter/common/extension/font_weight_extension.dart';
import 'package:pregnancy_flutter/common/extension/text_extension.dart';
import 'package:pregnancy_flutter/pregnancy/bloc/pregnancy_process_bloc.dart';
import 'package:pregnancy_flutter/pregnancy/bloc/pregnancy_process_event.dart';
import 'package:pregnancy_flutter/pregnancy/bloc/pregnancy_process_state.dart';
import 'package:pregnancy_flutter/pregnancy/pregnancy_content.dart';

class Pregnancy extends BaseStatefulWidget {
  const Pregnancy({super.key});

  @override
  State<Pregnancy> createState() => _PregnancyState();
}

class _PregnancyState extends BaseStatefulState<Pregnancy> with
    SingleTickerProviderStateMixin {
  late final TabController _tabController;
  PregnancyProcessBloc processBloc = PregnancyProcessBloc()..add(const LoadPregnancyProcessEvent());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 40, vsync: this);
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    return AppBar(
      backgroundColor: Constants.mainColor(),
      titleSpacing: 0,
      title: const Text('Thai kỳ').w600().text18().whiteColor().ellipsis(),
      bottom: TabBar(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        indicatorColor: Colors.white,
        controller: _tabController,
        isScrollable: true,
        tabs: List<int>.generate(40, (i) => i + 1).map((e) => Text('Tuần ${e}')).toList(),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white.withOpacity(0.5),
        unselectedLabelStyle: const TextStyle().textW400().text12(),
        labelStyle: const TextStyle().textW500().text15(),
        dividerColor: Colors.transparent,
      ),
    );
  }

  @override
  Widget? buildBody() {
    return BlocProvider(
      create: (context) => processBloc,
      child: BlocListener<PregnancyProcessBloc, PregnancyProcessState>(
          listener: (context, state) {
            if (state is LoadingSuccessfulState) {
              setState(() {
              });
            }
          },
          child: TabBarView(
            controller: _tabController,
            children: _childrenView(),
          )
      ),
    );
  }

  List<Widget> _childrenView() {
    if (processBloc.process.isNotEmpty) {
      return processBloc.process.map((e) => PregnancyContent(process: e)).toList();
    }
    return List<int>.generate(40, (i) => i + 1).map((e) => const Text('Đang tải dữ liệu...')).toList();
  }
}