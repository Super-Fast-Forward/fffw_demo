import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/vs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:providers/firestore.dart';
import 'package:widgets/app_bar/app_bar.dart';

import 'nav_rail.dart';

class AboutPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: CustomAppBar(
          title: Text('About'),
        ),
        body: Row(
          children: [
            CustomNavRail.getNavRail(),
            Container(
                width: 500,
                child: Column(children: [
                  Text('What is Flutter Firebase Framework (FFFW)?',
                      style: Theme.of(context).textTheme.titleLarge),
                  Text(
                      'FFFW is a framework for building Flutter apps with Firebase'
                      'It is a collection of widgets, providers and helpers to make development faster and easier.'
                      'It is using Riverpod for state management and Firestore for data storage.'),
                ])),
          ],
        ));
  }
}
