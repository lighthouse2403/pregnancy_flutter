import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregnancy_flutter/_gen/assets.gen.dart';
import 'package:pregnancy_flutter/chat/bloc/chat_bloc.dart';
import 'package:pregnancy_flutter/chat/bloc/chat_event.dart';
import 'package:pregnancy_flutter/chat/bloc/chat_state.dart';
import 'package:pregnancy_flutter/chat/child_widget/chat_detail.dart';
import 'package:pregnancy_flutter/chat/child_widget/new_thread.dart';
import 'package:pregnancy_flutter/chat/child_widget/thread_row.dart';
import 'package:pregnancy_flutter/common/base/base_app_bar.dart';
import 'package:pregnancy_flutter/common/base/base_statefull_widget.dart';
import 'package:pregnancy_flutter/common/extension/text_extension.dart';
import 'package:pregnancy_flutter/common/firebase/firebase_chat.dart';
import 'package:pregnancy_flutter/routes/routes.dart';

class Chat extends BaseStatefulWidget {
  const Chat({super.key});
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends BaseStatefulState<Chat> {
  final ScrollController _controller = ScrollController();
  final double _endReachedThreshold = 30;
  bool _loading = false;
  ChatBloc chatBloc = ChatBloc();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
    chatBloc.add(const LoadThreads());
  }

  void _onScroll() {
    if (!_controller.hasClients || _loading) return;

    final shouldReload = _controller.position.extentAfter < _endReachedThreshold;
    bool isNotFull = chatBloc.threads.length >= FirebaseChat.instance.threadLimit;
    if (shouldReload && !_loading && isNotFull) {
      _loading = true;
      chatBloc.add(const LoadThreads());
    }
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    return BaseAppBar(
      title: 'Giao lưu',
      leading: InkWell(
        onTap: () => Routes.instance.pop(),
        child: Align(
          alignment: Alignment.center,
          child: Assets.icons.arrowBack.svg(width: 24, height: 24),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NewThread())).then((res) => chatBloc.add(const LoadThreads()));
            },
            child: const Text('Hỏi').w600().text14().whiteColor()
        )
      ],
    );
  }

  @override
  Widget? buildBody() {
    return BlocProvider(
      create: (context) => chatBloc,
      child: BlocListener<ChatBloc, ChatState> (
          listener: (context, state) {
            if (state is LoadingState) {
              loadingView.show(context);
              return;
            }

            if (state is LoadingSuccessfulState) {
              setState(() {
                _loading = false;
              });
              loadingView.hide();
            }
            },
          child: CustomScrollView(
            controller: _controller,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              CupertinoSliverRefreshControl(
                onRefresh: _refresh,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetail(thread: chatBloc.threads[index]))).then((res) => chatBloc.add(const LoadThreads()));
                    },
                    child: ThreadRow(thread: chatBloc.threads[index]),
                  );
                },
                  childCount: chatBloc.threads.length,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                    height: 30,
                    child: FirebaseChat.instance.threadLimit > chatBloc.threads.length
                        ? Container()
                        : const CupertinoActivityIndicator(radius: 12.0, color: CupertinoColors.inactiveGray)
                ),
              )
            ],
          )
      )
    );
  }

  Future<void> _refresh() async {
    FirebaseChat.instance.threadLimit = 0;
    chatBloc.add(const LoadThreads());
  }
}