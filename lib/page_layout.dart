import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/vs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:providers/firestore.dart';
import 'package:widgets/app_bar/app_bar.dart';

import 'nav_rail.dart';

class PageLayout extends ConsumerWidget {
  final List<Widget> sections;
  final String title;

  PageLayout({required this.sections, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: CustomAppBar(
          title: Text(title),
        ),
        body: Row(children: [
          CustomNavRail.getNavRail(),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 600),
                child: ListView.separated(
                    itemBuilder: (context, index) => sections[index],
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: sections.length)),
          ))
        ]));
  }
}