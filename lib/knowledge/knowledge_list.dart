import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregnancy_flutter/_gen/assets.gen.dart';
import 'package:pregnancy_flutter/common/base/base_app_bar.dart';
import 'package:pregnancy_flutter/common/base/base_statefull_widget.dart';
import 'package:pregnancy_flutter/common/constants/constants.dart';
import 'package:pregnancy_flutter/knowledge/bloc/knowledge_bloc.dart';
import 'package:pregnancy_flutter/knowledge/bloc/knowledge_event.dart';
import 'package:pregnancy_flutter/knowledge/bloc/knowledge_state.dart';
import 'package:pregnancy_flutter/knowledge/knowledge_row.dart';
import 'package:pregnancy_flutter/routes/route_name.dart';
import 'package:pregnancy_flutter/routes/routes.dart';

class KnowledgeList extends BaseStatefulWidget {
  const KnowledgeList({super.key, required this.type});
  final KnowLedgeType type;

  @override
  State<KnowledgeList> createState() => _KnowledgeListState();
}

class _KnowledgeListState extends BaseStatefulState<KnowledgeList> {
  KnowledgeBloc knowledgeBloc = KnowledgeBloc();
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    knowledgeBloc.add(LoadKnowledgeListEvent(widget.type));
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    return BaseAppBar(
        title: 'Kiến thức',
        leading: InkWell(
          onTap: () => Routes.instance.pop(),
          child: Align(
            alignment: Alignment.center,
            child: Assets.icons.arrowBack.svg(width: 24, height: 24),
          ),
        )
    );
  }

  @override
  Widget? buildBody() {
    return BlocProvider(
        create: (context) => knowledgeBloc,
        child: BlocListener<KnowledgeBloc, KnowledgeState> (
            listener: (context, state) {
              if (state is LoadingSuccessfulState) {
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
                child: CustomScrollView(
                  controller: _controller,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return InkWell(
                          onTap: () {
                            Routes.instance.navigateTo(RoutesName.knowledgeDetail, arguments: knowledgeBloc.knowledgeDetail?['$index']);
                          },
                          child: KnowledgeRow(title: 'index: $index'),
                        );
                      },
                        childCount: knowledgeBloc.knowledgeDetail?.keys.length ?? 0,
                      ),
                    ),
                  ],
                )
            )
        )
    );
  }
}