import 'package:flutter/material.dart';

class TopNewsLoadingBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Center(child: CircularProgressIndicator()));
  }
}
