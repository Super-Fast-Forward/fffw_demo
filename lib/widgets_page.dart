import 'package:fffw_demo/page_layout.dart';
import 'package:fffw_demo/section_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/vs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets/app_bar/app_bar.dart';

import 'nav_rail.dart';

class WidgetsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageLayout(title: 'Widgets', sections: [
      SectionLayout(
        children: [
          Text('DocFieldText', style: Theme.of(context).textTheme.titleLarge),
          Text(
              'DocFieldText is a widget that displays a field from a Firestore document.'
              'It is a wrapper around the Text widget. It is using the StreamProvider to listen'
              ' to changes in the document.'),
          Text('Example:', style: Theme.of(context).textTheme.titleMedium),
          HighlightView(
              """DocFieldText(FirebaseFirestore.instance.collection('users').doc('123'), 'name')""",
              language: 'dart', theme: vsTheme, padding: EdgeInsets.all(12)),
        ],
      ),
      SectionLayout(
        children: [
          Text('DocFieldTextEdit',
              style: Theme.of(context).textTheme.titleLarge),
          Text(
              'DocFieldTextEdit is a widget that displays a field from a Firestore document.'
              'It is a wrapper around the TextFormField widget. It is using the StreamProvider to listen'
              ' to changes in the document.'),
          Text('Example:', style: Theme.of(context).textTheme.titleMedium),
          HighlightView(
              """DocFieldTextEdit(FirebaseFirestore.instance.collection('users').doc('123'), 'name')""",
              language: 'dart', theme: vsTheme, padding: EdgeInsets.all(12)),
        ],
      ),
    ]);
  }
}
