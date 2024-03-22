import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregnancy_flutter/common/base/base_app_bar.dart';
import 'package:pregnancy_flutter/common/base/base_statefull_widget.dart';
import 'package:pregnancy_flutter/common/constants/app_colors.dart';
import 'package:pregnancy_flutter/common/extension/text_extension.dart';
import 'package:pregnancy_flutter/index/bloc/index_bloc.dart';
import 'package:pregnancy_flutter/index/bloc/index_event.dart';
import 'package:pregnancy_flutter/index/bloc/index_state.dart';
import 'package:pregnancy_flutter/index/components/index_header.dart';
import 'package:pregnancy_flutter/index/components/index_row.dart';
import 'package:pregnancy_flutter/index/model/index_model.dart';

class Index extends BaseStatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends BaseStatefulState<Index> {
  final IndexBloc _indexBloc = IndexBloc()..add(const LoadIndexEvent());


  @override
  Widget? buildBody() {
    return BlocProvider(
      create: (context) => _indexBloc,
      child: BlocListener<IndexBloc, IndexState>(
          listener: (context, state) {
            if (state is LoadingSuccessfulIndexState) {
              setState(() {
              });
            }
          },
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/pregnancy_backgroound_3.jpg'),
                  fit: BoxFit.cover
              ),
            ),
            child:
            _indexBloc.indexList.isEmpty
                ? Container()
                : Container(
                    color: Colors.white.withOpacity(0.6),
                    child: SafeArea(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 60,
                            child: IndexHeader(),
                          ),
                          Expanded(
                              child: _indexList()
                          )
                        ],
                      ),
                    ),
                  )
          ),
      ),
    );
  }

  Widget _indexList() {
    return ListView.separated(
        itemCount: 34,
        itemBuilder: (context, i) {
          List<IndexModel> weekDetail = _indexBloc.indexList.where((element) => element.id == i + 7).toList();
          IndexModel? firstWeekDetail = weekDetail.first;
          return InkWell(
            onTap: () => _weekDetail(context, i),
            child: SizedBox(
              height: 50,
              child: IndexRow(index: firstWeekDetail),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            color: AppColors.disableColor,
            height: 0.3,
          );
        },
    );
  }

  Future<void> _weekDetail(BuildContext context, int index) {
    List<IndexModel> weekDetail = _indexBloc.indexList.where((element) => element.id == index + 7).toList();

    List<Widget> childrens = [IndexHeader()];
    weekDetail.forEach((element) {
      Widget row = Container(
        height: 50,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  color: AppColors.mainColor.withOpacity(0.3),
                  child: Text('${element.week}').w600().text14().center(),
                )
            ),
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  child: Text('${element.bpdAverage}').w500().text14().center(),
                )
            ),
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  color: AppColors.mainColor.withOpacity(0.3),
                  child: Text('${element.flAverage}').w500().text14().center(),
                )
            ),
            Expanded(
                flex: 1,
                child: Text('${element.efwAverage}').center()
            )
          ],
        ),
      );
      childrens.add(row);
    });
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                10.0,
              ),
            ),
          ),
          contentPadding: EdgeInsets.only(
            top: 10.0,
          ),
          title: Text('Tuần ${index + 7}').center(),
          content: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: childrens,
              )
          ),
        );
      },
    );
  }
}