import 'package:flutter/material.dart';
import 'package:pregnancy_flutter/common/extension/text_extension.dart';
import 'package:pregnancy_flutter/music/model/music_model.dart';

class MusicRow extends StatefulWidget {
  const MusicRow({super.key, required this.music});

  final MusicModel music;

  @override
  State<MusicRow> createState() => MusicRowState();
}

class MusicRowState extends State<MusicRow> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          borderRadius: const BorderRadius.all(Radius.circular(8))
      ),
      child: Row(
        children: [
          Text('${widget.music.name}').w500().text14().ellipsis()
        ],
      ),
    );
  }
}
