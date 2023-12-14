

import 'package:flutter/material.dart';
import 'package:tgcapp/modules/p_set.dart';

class SetsToScreen extends StatelessWidget {
  const SetsToScreen({super.key, required this.pset});

  final PSet pset;

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: Image.network(pset.image),
    );
  }
}