import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_flutter/_gen/assets.gen.dart';
import 'package:pregnancy_flutter/common/base/base_app_bar.dart';
import 'package:pregnancy_flutter/common/base/base_statefull_widget.dart';
import 'package:pregnancy_flutter/common/constants/constants.dart';
import 'package:pregnancy_flutter/knowledge/knowledge_row.dart';
import 'package:pregnancy_flutter/routes/route_name.dart';
import 'package:pregnancy_flutter/routes/routes.dart';

class Knowledge extends BaseStatefulWidget {
  const Knowledge({super.key});
  @override
  State<Knowledge> createState() => _KnowledgeState();
}

class _KnowledgeState extends BaseStatefulState<Knowledge> {
  final ScrollController _controller = ScrollController();
  List<String> knowledge = [
    'Câu chuyện sinh nở',
    'Trước thai kỳ',
    'Trong thai kỳ',
    'Chuyển dạ và đi sinh',
    'Sau sinh',
    'Chia sẻ kinh nghiệm',
    'Dinh dưỡng',
    'Hướng dẫn nấu món ngon',
  ];

  @override
  void initState() {
    super.initState();
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
    return Container(
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
                    _navigate(index);
                  },
                  child: KnowledgeRow(title: knowledge[index]),
                );
              },
                childCount: knowledge.length,
              ),
            ),
          ],
        )
    );
  }

  void _navigate(int index) {
    switch (index) {
      case 0:
        Routes.instance.navigateTo(RoutesName.knowledgeList, arguments: KnowLedgeType.story);
        break;
      case 1:
        Routes.instance.navigateTo(RoutesName.knowledgeList, arguments: KnowLedgeType.beforePregnancy);
        break;
      case 2:
        Routes.instance.navigateTo(RoutesName.knowledgeList, arguments: KnowLedgeType.inPregnancy);
        break;
      case 3:
        Routes.instance.navigateTo(RoutesName.knowledgeList, arguments: KnowLedgeType.inHospital);
        break;
      case 4:
        Routes.instance.navigateTo(RoutesName.knowledgeList, arguments: KnowLedgeType.afterPregnancy);
        break;
      case 5:
        Routes.instance.navigateTo(RoutesName.knowledgeList, arguments: KnowLedgeType.experiences);
        break;
      default:
        break;
    }
  }
}