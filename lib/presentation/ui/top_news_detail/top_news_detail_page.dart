import 'package:flutter/material.dart';
import 'package:thought_design_system/component/thought_scaffold.dart';

class TopNewsDetailPage extends StatelessWidget {
  const TopNewsDetailPage({
    Key? key,
    required this.topNewsId,
  }) : super(key: key);

  final String? topNewsId;

  @override
  Widget build(BuildContext context) {
    return ThoughtScaffold(body: Container());
  }
}
