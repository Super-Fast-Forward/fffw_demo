import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/vs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:providers/firestore.dart';
import 'package:widgets/app_bar/app_bar.dart';

import 'nav_rail.dart';

class PageLayout extends ConsumerWidget {
  final Widget child;

  PageLayout({required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: CustomAppBar(
          title: Text('About'),
        ),
        body: Row(children: [
          CustomNavRail.getNavRail(),
          Container(width: 500, child: child)
        ]));
  }
}
