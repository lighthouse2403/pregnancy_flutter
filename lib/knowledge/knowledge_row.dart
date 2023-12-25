import 'package:flutter/material.dart';
import 'package:pregnancy_flutter/common/extension/text_extension.dart';

class KnowledgeRow extends StatefulWidget {
  const KnowledgeRow({super.key, required this.title});

  final String title;

  @override
  State<KnowledgeRow> createState() => KnowledgeRowState();
}

class KnowledgeRowState extends State<KnowledgeRow> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: Row(
        children: [
          Text('${widget.title}').w500().text14().ellipsis()
        ],
      ),
    );
  }
}
