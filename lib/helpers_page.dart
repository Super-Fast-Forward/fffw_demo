import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:fffw_demo/example_layout.dart';
import 'package:fffw_demo/page_layout.dart';
import 'package:fffw_demo/section_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:providers/firestore.dart';
import 'package:widgets/doc_stream_widget.dart';

import 'code_layout.dart';

class HelpersPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageLayout(title: 'Widgets', sections: [
      SectionLayout(
        children: [
          Text('Strings', style: Theme.of(context).textTheme.titleLarge),
          Text(
              'stringLeft returns a string with the first [length] characters of [str].'),
          Text('Source Code:', style: Theme.of(context).textTheme.titleMedium),
          CodeLayout("""Text(stringLeft('Hello World', 5)"""),
          Text('Widget Example:',
              style: Theme.of(context).textTheme.titleMedium),
          ExampleLayout(
            child: Text(stringLeft('Hello World', 5)),
          ),
        ],
      ),
      SectionLayout(
        children: [
          Text('Timestamp', style: Theme.of(context).textTheme.titleLarge),
          Text('formatDate formats Firestore Timestamp to a date string'),
          Text('Example:', style: Theme.of(context).textTheme.titleMedium),
          CodeLayout(""" Text(formatDate(Timestamp.now())) """),
          ExampleLayout(child: Text(formatDate(Timestamp.now()))),
          Text(
              'This is handy when you receive the Timestamp type from Firestore document. '),
          CodeLayout(
              """DocFieldText(docRef, 'timestamp', formatter: formatDate) """),
          ExampleLayout(
              child: DocStreamWidget(docSP('test_collection/test_doc'),
                  (context, doc) {
            return Text(
                formatDate(doc.get('timeCreated'), format: 'yyyy-MM-dd HH:mm'));
          })),
        ],
      ),
    ]);
  }
}
