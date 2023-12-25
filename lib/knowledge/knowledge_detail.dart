import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_flutter/_gen/assets.gen.dart';
import 'package:pregnancy_flutter/common/base/base_app_bar.dart';
import 'package:pregnancy_flutter/common/base/base_statefull_widget.dart';
import 'package:pregnancy_flutter/common/extension/text_extension.dart';
import 'package:pregnancy_flutter/knowledge/bloc/knowledge_bloc.dart';
import 'package:pregnancy_flutter/routes/routes.dart';

class KnowledgeDetail extends BaseStatefulWidget {
  const KnowledgeDetail({super.key, required this.content});
  final String content;

  @override
  State<KnowledgeDetail> createState() => _KnowledgeDetailState();
}

class _KnowledgeDetailState extends BaseStatefulState<KnowledgeDetail> {

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
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          image: const DecorationImage(
              image: AssetImage('assets/images/pregnancy_backgroound_3.jpg'),
              fit: BoxFit.cover
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Text(widget.content).w500().text15().blackColor().customHeight(1.5),
        )
    );
  }
}