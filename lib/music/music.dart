import 'package:audio_service/audio_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_flutter/_gen/assets.gen.dart';
import 'package:pregnancy_flutter/common/base/base_app_bar.dart';
import 'package:pregnancy_flutter/common/base/base_statefull_widget.dart';
import 'package:pregnancy_flutter/music/audio_handler.dart';
import 'package:pregnancy_flutter/music/model/music_model.dart';
import 'package:pregnancy_flutter/music/music_row.dart';
import 'package:pregnancy_flutter/routes/routes.dart';

class Music extends BaseStatefulWidget {
  const Music({super.key});
  @override
  State<Music> createState() => _KnowledgeState();
}

class _KnowledgeState extends BaseStatefulState<Music> {
  final ScrollController _controller = ScrollController();
  late AudioHandler _audioHandler;

  List<MusicModel> musics = [
    MusicModel(name: 'Bản nhạc 1', path: 'pregnancy_sound_1', status: false),
    MusicModel(name: 'Bản nhạc 2', path: 'pregnancy_sound_2', status: false),
    MusicModel(name: 'Bản nhạc 3', path: 'pregnancy_sound_3', status: false),
    MusicModel(name: 'Bản nhạc 4', path: 'pregnancy_sound_4', status: false),
    MusicModel(name: 'Bản nhạc 5', path: 'pregnancy_sound_5', status: false),
  ];

  @override
  void initState() {
    super.initState();

  }

  void initAudio() async {
    _audioHandler = await AudioService.init(
      builder: () => AudioPlayerHandler(),
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'com.ryanheise.myapp.channel.audio',
        androidNotificationChannelName: 'Audio playback',
        androidNotificationOngoing: true,
      ),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    return BaseAppBar(
        title: 'Âm nhạc',
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
                  },
                  child: MusicRow(music: musics[index]),
                );
              },
                childCount: musics.length,
              ),
            ),
          ],
        )
    );
  }
}